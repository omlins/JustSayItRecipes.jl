"""
    @include(leaf::AbstractString)

Include the leaf-subrecipe `leaf` from the directory of the current recipe file, automatically selecting the correct variant for the current OS. `leaf` must be a **relative path** with no file extension and no variant suffix — e.g. `@include("commands")` or `@include("subfolder/commands")`, not `@include("commands.linux.jl")`. The macro appends the OS-specific variant suffix (e.g. `.linux`, `.ubuntu`, `.win`, `.mac`) plus `.jl` to the leaf, and falls back through the variant chain to the bare file (`leaf.jl`) if no variant file exists.

!!! warning "No nested `@include`"
    A file included with `@include` must **not** itself contain any `@include` command. If it does, an `ArgumentError` is thrown, because this would mean the recipe tree splits, which is not allowed. Higher-level subrecipes use standard Julia `include` to compose; only leaf-subrecipes (the variant-specific ends of the tree) are included with `@include`.
"""
macro include(args...) checkargs_include(args...); _include(__module__, args...); end

function _include(caller::Module, leaf)
    leaf = esc(leaf)
    return quote
        JustSayItRecipes._include_resolved($caller, $leaf)
    end
end

function _include_resolved(caller::Module, leaf::AbstractString)
    # 1. Reject names containing any '.'
    if occursin('.', leaf)
        throw(ArgumentError("`@include` argument must be a relative path with no file extension and no variant suffix (e.g. \"commands\" or \"subfolder/commands\") — got \"$leaf\"."))
    end
    # 2. Resolve the directory of the current file (no recipes_prefix)
    source = Base.source_path()
    dir = source === nothing ? "." : dirname(source)
    # 3. Normalize separators and build the candidate chain
    leaf = normalize_separators(leaf)
    suffixes = variant_suffixes()
    candidates = [joinpath(dir, "$leaf.$suff.jl") for suff in suffixes]
    push!(candidates, joinpath(dir, "$leaf.jl"))  # bare fallback
    # 4. For each existing candidate, read and check for nested @include
    for candidate in candidates
        if isfile(candidate)
            source_text = read(candidate, String)
            if _contains_include_macro(source_text)
                throw(ArgumentError("`@include` is not allowed inside a file included with `@include` (in \"$candidate\") — the recipe tree must not split."))
            end
            # Read the file content and eval it directly in the caller,
            # so the error propagates without wrapping in a LoadError.
            return Base.include(caller, candidate)
        end
    end
    # 5. No candidate exists — call Base.include on the bare name and let it error
    #    (or, if the file exists but no variant was found, try the bare file).
    barepath = joinpath(dir, "$leaf.jl")
    if isfile(barepath)
        source_text = read(barepath, String)
        if _contains_include_macro(source_text)
            throw(ArgumentError("`@include` is not allowed inside a file included with `@include` (in \"$barepath\") — the recipe tree must not split."))
        end
    end
    # Let Base.include handle the "file not found" error (or include if it exists)
    return Base.include(caller, barepath)
end

# Walk the AST of a source string and return true if any top-level expression
# is an @include macro call (qualified or bare).
function _contains_include_macro(source::AbstractString)
    exprs = Meta.parseall(source)
    for a in exprs.args
        if a isa LineNumberNode
            continue
        end
        if a isa Expr && a.head == :macrocall
            mn = a.args[1]
            if occursin("@include", repr(mn))
                return true
            end
        end
    end
    return false
end

checkargs_include(args...) = if (length(args) != 1) @ArgumentError("wrong number of arguments.") end

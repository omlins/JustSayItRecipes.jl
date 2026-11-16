"""
    @include(leaf::AbstractString)

Include the leaf-subrecipe `leaf` from the directory of the current recipe file, automatically selecting the correct variant for the current OS. `leaf` must be a **relative path** with no file extension and no variant suffix — e.g. `@include("commands")` or `@include("subfolder/commands")`, not `@include("commands.linux.jl")`. The macro appends the OS-specific variant suffix (e.g. `.linux`, `.ubuntu`, `.win`, `.mac`) plus `.jl` to the leaf, and falls back through the variant chain to the bare file (`leaf.jl`) if no variant file exists.

!!! warning "Single-value enforcement and nested `@include`"
    A file included with `@include` must consist of exactly one top-level expression (after any header comment). The value of that expression is what `@include` returns. A **variant file** (e.g. `commands.ubuntu.jl`) must additionally not contain any `@include` call — it is a leaf. A **bare file** (e.g. `commands.jl` with no variant files) may contain `@include` calls (it is a composite), but must still be a single expression (typically `merge(@include(...), …)`).
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
    variant_candidates = [joinpath(dir, "$leaf.$suff.jl") for suff in suffixes]
    bare_candidate = joinpath(dir, "$leaf.jl")
    # 4. For each existing variant file, check it is a single value with no
    #    nested @include, then include it.
    for candidate in variant_candidates
        if isfile(candidate)
            source_text = read(candidate, String)
            _check_single_value(source_text)
            if _contains_include_macro(source_text)
                throw(ArgumentError("`@include` is not allowed inside a variant file included with `@include` (in \"$candidate\") — variant files are leaf-subrecipes and must not split the recipe tree."))
            end
            return Base.include(caller, candidate)
        end
    end
    # 5. No variant file exists. If the bare file exists, include it directly
    #    WITHOUT checking for nested @include — the bare file may be a
    #    higher-level subrecipe that legitimately contains @include calls.
    #    The single-value check is still done unconditionally.
    if isfile(bare_candidate)
        source_text = read(bare_candidate, String)
        _check_single_value(source_text)
        return Base.include(caller, bare_candidate)
    end
    # 6. No candidate exists at all — let Base.include produce "file not found"
    return Base.include(caller, bare_candidate)
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

# Check that a source file consists of exactly one top-level expression
# (after filtering line-number nodes, i.e. after any header comment) and that
# this expression is not an assignment. The value of that single expression is
# what `@include` returns.
function _check_single_value(source::AbstractString)
    exprs = Meta.parseall(source)
    real_exprs = [a for a in exprs.args if !(a isa LineNumberNode)]
    if length(real_exprs) != 1
        throw(ArgumentError("file included with `@include` must contain exactly " *
            "one top-level expression (after any header comment), but " *
            "found $(length(real_exprs))."))
    end
    expr = real_exprs[1]
    if expr isa Expr && expr.head == :(=)
        throw(ArgumentError("file included with `@include` must not contain an " *
            "assignment — use a bare expression (e.g. `Dict(...)` or `merge(...)`), " *
            "not `name = Dict(...)`."))
    end
    return nothing
end

checkargs_include(args...) = if (length(args) != 1) @ArgumentError("wrong number of arguments.") end

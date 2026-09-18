## Shared helpers used by @run, @edit, @path, and @include

# Resolve the recipes folder dynamically at runtime (mirrors the pattern
# `normpath(joinpath(dirname(pathof(JustSayItRecipes)), "..", "recipes"))` from the original quick start).
# Use @__MODULE__ (not the literal JustSayItRecipes): this helper is called at module-load time
# (e.g. from docstring NOTE interpolations) when the bare module name may not be bound yet.
recipes_prefix() = normpath(joinpath(dirname(pathof(@__MODULE__)), "..", "recipes"))

# Normalize path separators to the current OS convention (/ → \ on Windows, \ → / on Unix).
# Used by @run, @edit, @path, and @include so recipes written on one OS work correctly after cp to another.
normalize_separators(s::AbstractString) = replace(replace(s, '/' => Base.Filesystem.path_separator), '\\' => Base.Filesystem.path_separator)

## Variant identification (for @include — OS-based variant selection)

is_ubuntu() = Sys.islinux() && isfile("/etc/os-release") && any(occursin("ubuntu", lowercase(line)) for line in eachline("/etc/os-release") if startswith(line, "ID=") || startswith(line, "ID_LIKE="))

# Suffixes for each OS label (Symbol keys for type safety).
const VARIANT_SUFFIXES = Dict(
    :windows => "win",
    :macos   => "mac",
    :ubuntu  => "ubuntu",
    :linux   => "linux",
    :bsd     => "bsd",
    :unix    => "unix",
)

# Fallback chain: OS label → parent category. Entries without a key
# (e.g. :windows, :unix) terminate the chain.
const VARIANT_FALLBACKS = Dict(
    :ubuntu => :linux,
    :linux  => :unix,
    :macos  => :unix,
    :bsd    => :unix,
)

# Build the ordered OS-label chain (most-specific → most-general) for a given OS label.
function variant_chain(os::Symbol)
    chain = [os]
    current = os
    while haskey(VARIANT_FALLBACKS, current)
        current = VARIANT_FALLBACKS[current]
        push!(chain, current)
    end
    return chain
end

# Ordered list of suffixes to try for the current OS, most-specific first.
# The bare filename (no suffix) is always tried as the ultimate fallback — handled in @include, not here.
function variant_suffixes()
    os = if Sys.iswindows()
        :windows
    elseif Sys.isapple()
        :macos
    elseif Sys.islinux()
        is_ubuntu() ? :ubuntu : :linux
    elseif Sys.isbsd()
        :bsd
    elseif Sys.isunix()
        :unix
    else
        return []
    end
    return [VARIANT_SUFFIXES[o] for o in variant_chain(os)]
end

## Unit test helpers (not public, not exported — for internal use by test files)
# Usage in test files (add @throws_pt only if used directly): import JustSayItRecipes: @test_throws_pt

# Returns true if macroexpand throws the expected exception type, false otherwise.
# Usage: @test @throws_pt(ArgumentError, JustSayItRecipes.@edit("a", "b"))
macro throws_pt(ex_type, ex)
    local mod = __module__
    local et = ex_type
    local e = ex
    return quote
        local caught = try
            macroexpand($(QuoteNode(mod)), $(QuoteNode(e)))
            false
        catch exc
            exc isa $(esc(et))
        end
        caught
    end
end

# Like Test.@test_throws, but for errors thrown at macro expansion time.
# Rewrites to: @test JustSayItRecipes.@throws_pt(ex_type, ex)
# Usage: @test_throws_pt ArgumentError JustSayItRecipes.@edit("a", "b")
macro test_throws_pt(ex_type, ex)
    local et = ex_type
    local e = ex
    return esc(quote
        Test.@test(JustSayItRecipes.@throws_pt($et, $e))
    end)
end

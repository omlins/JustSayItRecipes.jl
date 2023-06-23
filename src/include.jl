"""
    @include(path::AbstractString)

Prefix `path` with the `recipes` path of the JustSayItRecipes package used and then call `include(path)`. If `path` is an absolut path, then call `include` with `path` unmodified.

!!! note "NOTE: `recipes` folder of JustSayItRecipes"
    The content of the `recipes` folder of the JustSayItRecipes package is not evaluated within JustSayIt. The folder's single purpose is to provide an easily accessible and updatable collection of scripts to start JustSayIt as well as predefined command dictionaries for a quick assembly of a personalized voice assistant. `JustSayItRecipes.@include` permits to conveniently `include` files from this folder (for details about the Julia built-in `include` type `?include`).
    Your `recipes` folder of the JustSayItRecipes package used is: `$RECIPES_PREFIX`
"""
macro include(args...) checkargs_include(args...); _include(__module__, args...); end

function _include(caller::Module, path)
    path = esc(path)
    return quote
        if !isabspath($path)
            Base.include($caller, joinpath(RECIPES_PREFIX, $path))
        else
            Base.include($caller, $path)
        end
    end
end

checkargs_include(args...) = if (length(args) != 1) @ArgumentError("wrong number of arguments.") end

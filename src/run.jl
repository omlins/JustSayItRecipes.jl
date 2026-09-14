"""
    JustSayItRecipes.@run(path::AbstractString)

Prefix `path` with the `recipes` path of the JustSayItRecipes package used, normalize path separators to the current OS convention, and then call `include(path)` (for details about the Julia built-in `include`, type `?include`). If `path` is an absolute path, then call `include` with `path` unmodified.

!!! note "NOTE: `recipes` folder of JustSayItRecipes"
    The content of the `recipes` folder of the JustSayItRecipes package is not evaluated within JustSayIt. The folder's single purpose is to provide an easily accessible and updatable collection of scripts to start JustSayIt as well as predefined command dictionaries for a quick assembly of a personalized voice assistant. `JustSayItRecipes.@run` permits to conveniently run files from this folder.
    Your `recipes` folder of the JustSayItRecipes package used is: `$(recipes_prefix())`
"""
macro run(args...) checkargs_run(args...); _run(__module__, args...); end

function _run(caller::Module, path)
    path = esc(path)
    return quote
        if !isabspath($path)
            Base.include($caller, joinpath(recipes_prefix(), normalize_separators($path)))
        else
            Base.include($caller, $path)
        end
    end
end

checkargs_include(args...) = if (length(args) != 1) @ArgumentError("wrong number of arguments.") end

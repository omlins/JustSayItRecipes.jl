"""
    JustSayItRecipes.@edit(path::AbstractString)

Prefix `path` with the `recipes` path of the JustSayItRecipes package used, normalize path separators to the current OS convention, and then call `edit(path)` (for details about the Julia built-in `edit`, including how to specify a custom editor, type `?edit`). If `path` is an absolute path, then call `edit` with `path` unmodified.

!!! note "NOTE: `recipes` folder of JustSayItRecipes"
    The content of the `recipes` folder of the JustSayItRecipes package is not evaluated within JustSayIt. The folder's single purpose is to provide an easily accessible and updatable collection of scripts to start JustSayIt as well as predefined command dictionaries for a quick assembly of a personalized voice assistant. `JustSayItRecipes.@edit` permits to conveniently `edit` files from this folder.
    Your `recipes` folder of the JustSayItRecipes package used is: `$(recipes_prefix())`
"""
macro edit(args...) checkargs_edit(args...); _edit(args...) end

function _edit(path)
    path = esc(path)
    return quote
        if !isabspath($path)
            $(esc(:edit))(joinpath(recipes_prefix(), normalize_separators($path)))
        else
            $(esc(:edit))($path)
        end
    end
end

checkargs_edit(args...) = if (length(args) != 1) @ArgumentError("wrong number of arguments.") end

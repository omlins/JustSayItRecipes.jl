"""
    JustSayItRecipes.@path()
    JustSayItRecipes.@path(path::AbstractString)

Return the absolute path of the recipe `path` within the `recipes` folder of the JustSayItRecipes package used; with no argument (or an empty string), return the `recipes` folder itself. `path` may be a bare filename, a relative path, or an absolute path. **No existence checks** are performed — neither the parent directory nor the file/directory at the end of the returned path is verified to exist. This makes `@path` properly composable with standard Julia file functions such as `mkpath` (which creates all intermediate directory levels at once), `cp` (for not-yet-existing files), and `cd`.

`@path` is intentionally composable with standard Julia file functions, e.g.:
```julia
julia> JustSayItRecipes.@path("myrecipes/new_recipe.jl")     # path of a not-yet-existing recipe
julia> cp(JustSayItRecipes.@path("ubuntu_max.jl"), JustSayItRecipes.@path("my_ubuntu_commands.jl"))
julia> mkpath(JustSayItRecipes.@path("myrecipes"))           # bootstrap a new recipes subfolder
julia> cd(JustSayItRecipes.@path())                           # change into the recipes folder
```

!!! note "NOTE: location of the `recipes` folder"
    The `recipes` folder of the JustSayItRecipes package used is, by default, located in the `~/.julia/dev/` directory on Linux and macOS, and in the `~\\AppData\\Local\\Julia\\dev\\` directory on Windows. Type `?Pkg.develop` for details, and set the environment variable `JULIA_PKG_DEVDIR` before starting Julia to use a custom location for the JustSayItRecipes folder.
    Your `recipes` folder of the JustSayItRecipes package used is: `$(recipes_prefix())`
"""
macro path(args...) checkargs_path(args...); _path(args...) end

function _path(path = "")
    return quote
        JustSayItRecipes.recipe_path($path)
    end
end

function recipe_path(path::AbstractString)
    isempty(path) && return recipes_prefix()
    return isabspath(path) ? path : joinpath(recipes_prefix(), normalize_separators(path))
end
recipe_path() = recipe_path("")

checkargs_path(args...) = if (length(args) > 1) @ArgumentError("wrong number of arguments (expected 0 or 1).") end

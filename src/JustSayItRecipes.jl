"""
Module JustSayItRecipes

Easily accessible and updatable collection of scripts to start JustSayIt as well as predefined command dictionaries for a quick assembly of a personalized voice assistant.

# General overview and examples
https://github.com/omlins/JustSayItRecipes.jl

# Recipe usage example.
```
> julia
julia> using JustSayItRecipes
julia> JustSayItRecipes.@include("ubuntu_max.jl")
```
Type `?JustSayItRecipes.@include` to learn about this macro.
"""
module JustSayItRecipes

## Alphabetical include of submodules, except commmand-submodules (below)
include("Exceptions.jl")
using .Exceptions

## Include of shared constant parameters, types and syntax sugar
include("shared.jl")

## Alphabetical include of files
include("include.jl")

## Exports (need to be after include of submodules if re-exports from them)

end # module JustSayItRecipes

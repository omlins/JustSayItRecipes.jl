"""
Module JustSayItRecipes

Thin companion package to JustSayIt for maintained JustSayIt recipes - command dictionaries and scripts to start JustSayIt - and utilities to use and manage them. These recipes can be used as they are, or modified and extended to assemble a personalized voice assistant.

# General overview and examples
https://github.com/omlins/JustSayItRecipes.jl

# Package usage example.
```
> julia
julia> using JustSayItRecipes
julia> JustSayItRecipes.@run("ubuntu_max.jl")
```
"""
module JustSayItRecipes

## Alphabetical include of submodules, except commmand-submodules (below)
include("Exceptions.jl")
using .Exceptions

## Include of shared constant parameters, types and syntax sugar
include("shared.jl")

## Alphabetical include of files
include("edit.jl")
include("include.jl")
include("path.jl")
include("run.jl")

## Public but not exported (enforces usage with `JustSayItRecipes.` prefix, which makes it clearer that the JustSayItRecipes recipes path is prepended to the input path)
public @run, @edit, @path

## Exported
export @include

end # module JustSayItRecipes

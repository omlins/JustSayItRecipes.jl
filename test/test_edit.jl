using Test
using JustSayItRecipes
import JustSayItRecipes: @test_throws_pt

# Shim: overshadow edit for the duration of the test.
# Records the path it was called with instead of actually opening an editor.
if !isdefined(@__MODULE__, :edit)
    edit(path::AbstractString; line::Integer=0, column::Integer=0) = nothing
end
_paths_called = String[]
edit(path::AbstractString; line::Integer=0, column::Integer=0) = push!(_paths_called, path)

@testset "JustSayItRecipes.@edit" begin
    # Relative path → edit(joinpath(recipes_prefix(), normalize_separators(path)))
    empty!(_paths_called)
    JustSayItRecipes.@edit("some_recipe.jl")
    @test length(_paths_called) == 1
    @test _paths_called[1] == joinpath(JustSayItRecipes.recipes_prefix(), JustSayItRecipes.normalize_separators("some_recipe.jl"))

    # Relative path with backslash → normalized to OS convention
    empty!(_paths_called)
    JustSayItRecipes.@edit("subfolder\\some_recipe.jl")
    @test length(_paths_called) == 1
    @test _paths_called[1] == joinpath(JustSayItRecipes.recipes_prefix(), JustSayItRecipes.normalize_separators("subfolder\\some_recipe.jl"))

    # Absolute path → edit(path) unmodified
    empty!(_paths_called)
    JustSayItRecipes.@edit("/abs/path.jl")
    @test length(_paths_called) == 1
    @test _paths_called[1] == "/abs/path.jl"
end

@testset "JustSayItRecipes.@edit (argument validation)" begin
    # 0 arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@edit()

    # 2 arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@edit("a", "b")
end

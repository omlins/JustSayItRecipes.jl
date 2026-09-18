using Test
using JustSayItRecipes
import JustSayItRecipes: @test_throws_pt

# Shim: overshadow Base.include for the duration of the test.
# Records the path it was called with instead of actually including a file.
_paths_called = String[]
Base.include(mod::Module, path::AbstractString) = push!(_paths_called, path)

@testset "JustSayItRecipes.@run" begin
    # Relative path → include(caller, joinpath(recipes_prefix(), normalize_separators(path)))
    empty!(_paths_called)
    JustSayItRecipes.@run("some_recipe.jl")
    @test length(_paths_called) == 1
    @test _paths_called[1] == joinpath(JustSayItRecipes.recipes_prefix(), JustSayItRecipes.normalize_separators("some_recipe.jl"))

    # Relative path with backslash → normalized to OS convention
    empty!(_paths_called)
    JustSayItRecipes.@run("subfolder\\some_recipe.jl")
    @test length(_paths_called) == 1
    @test _paths_called[1] == joinpath(JustSayItRecipes.recipes_prefix(), JustSayItRecipes.normalize_separators("subfolder\\some_recipe.jl"))

    # Absolute path → include(caller, path) unmodified
    empty!(_paths_called)
    JustSayItRecipes.@run("/abs/path.jl")
    @test length(_paths_called) == 1
    @test _paths_called[1] == "/abs/path.jl"
end

@testset "JustSayItRecipes.@run (argument validation)" begin
    # 0 arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@run()

    # 2 arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@run("a", "b")
end

using Test
using JustSayItRecipes
import JustSayItRecipes: @test_throws_pt

@testset "JustSayItRecipes.@path" begin
    rp = JustSayItRecipes.recipes_prefix()

    # No argument → recipes folder root
    @test JustSayItRecipes.@path() == rp

    # Empty string → same as no argument
    @test JustSayItRecipes.@path("") == rp

    # Absolute path → returned unchanged
    @test JustSayItRecipes.@path("/abs/path.jl") == "/abs/path.jl"

    # Relative path (existing or non-existing parent) → joinpath, no existence check
    @test JustSayItRecipes.@path("some_recipe.jl") == joinpath(rp, JustSayItRecipes.normalize_separators("some_recipe.jl"))

    # Relative path with subfolder → joinpath, no existence check
    @test JustSayItRecipes.@path("myrecipes/x.jl") == joinpath(rp, JustSayItRecipes.normalize_separators("myrecipes/x.jl"))

    # Relative path with backslash → normalized to OS convention
    @test JustSayItRecipes.@path("myrecipes\\x.jl") == joinpath(rp, JustSayItRecipes.normalize_separators("myrecipes\\x.jl"))

    # normalize_separators with forward slash
    @test JustSayItRecipes.normalize_separators("a/b") == "a$(Base.Filesystem.path_separator)b"

    # normalize_separators with backslash
    @test JustSayItRecipes.normalize_separators("a\\b") == "a$(Base.Filesystem.path_separator)b"

    # Non-existing file (bare filename) → returns path without throwing
    @test JustSayItRecipes.@path("does_not_exist.jl") == joinpath(rp, JustSayItRecipes.normalize_separators("does_not_exist.jl"))

    # Too many arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@path("a", "b")
end

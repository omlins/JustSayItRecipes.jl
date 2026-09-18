using Test
using JustSayItRecipes
import JustSayItRecipes: @test_throws_pt

# Part 1 (runs first): _include_resolved tested directly.
# source_path() is the test file itself, so dir = @__DIR__.
@testset "JustSayItRecipes._include_resolved" begin
    # (a) Dot in argument is rejected
    @test_throws ArgumentError JustSayItRecipes._include_resolved(Main, "commands.jl")

    # (b) Variant suffix selection: leaf_simple → leaf_simple.ubuntu.jl (on Ubuntu)
    JustSayItRecipes._include_resolved(Main, "leaf_simple")
    @test Core.eval(Main, :LEAF_SIMPLE_INCLUDED) == true
    Core.eval(Main, :(LEAF_SIMPLE_INCLUDED = nothing))

    # (c) Bare fallback: leaf_bare has no variant file, only leaf_bare.jl
    JustSayItRecipes._include_resolved(Main, "leaf_bare")
    @test Core.eval(Main, :LEAF_BARE_INCLUDED) == true
    Core.eval(Main, :(LEAF_BARE_INCLUDED = nothing))

    # (d) Nested @include rejected: fixture_has_include.jl contains @include
    @test_throws ArgumentError JustSayItRecipes._include_resolved(Main, "fixture_has_include")

    # (e) Missing leaf: no variant or bare file exists; Base.include errors
    @test_throws SystemError JustSayItRecipes._include_resolved(Main, "does_not_exist")

    # (f) Backslash normalization: sub\leaf_sub resolves to sub/leaf_sub.ubuntu.jl
    JustSayItRecipes._include_resolved(Main, "sub\\leaf_sub")
    @test Core.eval(Main, :LEAF_SUB_INCLUDED) == true
    Core.eval(Main, :(LEAF_SUB_INCLUDED = nothing))
end

# Part 2 (runs second): @include macro emits correct calls to _include_resolved.
# (same shim approach as @edit and @run: override the invoked function and
# verify the macro forwards the right arguments.)
_leaves_called = String[]
JustSayItRecipes._include_resolved(caller::Module, leaf::AbstractString) = push!(_leaves_called, leaf)

@testset "JustSayItRecipes.@include (macro)" begin
    empty!(_leaves_called)
    JustSayItRecipes.@include("commands")
    @test length(_leaves_called) == 1
    @test _leaves_called[1] == "commands"

    empty!(_leaves_called)
    JustSayItRecipes.@include("subfolder/commands")
    @test length(_leaves_called) == 1
    @test _leaves_called[1] == "subfolder/commands"
end

@testset "JustSayItRecipes.@include (argument validation)" begin
    # 0 arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@include()

    # 2 arguments → ArgumentError at macro expansion time
    @test_throws_pt ArgumentError JustSayItRecipes.@include("a", "b")
end

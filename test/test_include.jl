using Test
using JustSayItRecipes
import JustSayItRecipes: @test_throws_pt

# Part 1 (runs first): _include_resolved tested directly.
# source_path() is the test file itself, so dir = @__DIR__.
@testset "JustSayItRecipes._include_resolved" begin
    # (a) Dot in argument is rejected
    @test_throws ArgumentError JustSayItRecipes._include_resolved(Main, "commands.jl")

    # (b) Variant suffix selection: leaf_simple.ubuntu.jl is a single value (`true`)
    @test JustSayItRecipes._include_resolved(Main, "leaf_simple") == true

    # (c) Bare fallback: leaf_bare.jl (no variant) is a single value (`true`)
    @test JustSayItRecipes._include_resolved(Main, "leaf_bare") == true

    # (d) Nested @include rejected in VARIANT files:
    #     fixture_has_include.ubuntu.jl is a single expression (@include), but it
    #     IS a variant file → ArgumentError from _contains_include_macro.
    @test_throws ArgumentError JustSayItRecipes._include_resolved(Main, "fixture_has_include")

    # (e) Missing leaf: no variant or bare file exists; Base.include errors
    @test_throws SystemError JustSayItRecipes._include_resolved(Main, "does_not_exist")

    # (f) Backslash normalization: sub\leaf_sub.ubuntu.jl is a single value (`true`)
    @test JustSayItRecipes._include_resolved(Main, "sub\\leaf_sub") == true

    # (g) Bare file with @include: only leaf_with_include.jl exists (no variant),
    #     it is a single expression (@include) so single-value check passes and,
    #     being a bare file, the no-nested-@include check is skipped. The inner
    #     include then fails with LoadError (wrapping SystemError from Base.include).
    @test_throws LoadError JustSayItRecipes._include_resolved(Main, "leaf_with_include")

    # (h) Single-value acceptance: leaf_no_symbol.ubuntu.jl contains only `42`,
    #     which is a valid single value (previously rejected for not assigning a
    #     matching symbol).
    @test JustSayItRecipes._include_resolved(Main, "leaf_no_symbol") == 42

    # (i) Single-value acceptance (bare): same as (h) for a bare file.
    @test JustSayItRecipes._include_resolved(Main, "leaf_no_symbol_bare") == 42

    # (j) Single-value rejection: two_exprs.ubuntu.jl contains two assignments
    #     → ArgumentError (expected exactly one top-level expression).
    @test_throws ArgumentError JustSayItRecipes._include_resolved(Main, "two_exprs")

    # (k) Assignment rejection: assignment_only.ubuntu.jl is a single top-level
    #     expression, but it is an assignment → ArgumentError.
    @test_throws ArgumentError JustSayItRecipes._include_resolved(Main, "assignment_only")
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

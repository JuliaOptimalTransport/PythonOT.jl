using Pkg

# Activate test environment on older Julia versions
@static if VERSION < v"1.2"
    Pkg.activate(@__DIR__)
    Pkg.develop(PackageSpec(; path=dirname(@__DIR__)))
    Pkg.instantiate()
end

using POT
using Documenter
using Test

@testset "POT.jl" begin
    @testset "doctests" begin
        DocMeta.setdocmeta!(POT, :DocTestSetup, :(using POT); recursive=true)
        doctest(
            POT;
            doctestfilters=[
                r"{([a-zA-Z0-9]+,\s?)+[a-zA-Z0-9]+}",
                r"(Array{[a-zA-Z0-9]+,\s?1}|Vector{[a-zA-Z0-9]+})",
                r"(Array{[a-zA-Z0-9]+,\s?2}|Matrix{[a-zA-Z0-9]+})",
            ],
        )
    end
end

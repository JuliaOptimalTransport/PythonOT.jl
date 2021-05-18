using Pkg

# Activate test environment on older Julia versions
@static if VERSION < v"1.2"
    Pkg.activate(@__DIR__)
    Pkg.develop(PackageSpec(; path=dirname(@__DIR__)))
    Pkg.instantiate()
end

using PythonOT
using Documenter
using Test

@testset "PythonOT.jl" begin
    @testset "doctests" begin
        DocMeta.setdocmeta!(PythonOT, :DocTestSetup, :(using PythonOT); recursive=true)
        doctest(
            PythonOT;
            doctestfilters=[
                r"{([a-zA-Z0-9]+,\s?)+[a-zA-Z0-9]+}",
                r"(Array{[a-zA-Z0-9]+,\s?1}|Vector{[a-zA-Z0-9]+})",
                r"(Array{[a-zA-Z0-9]+,\s?2}|Matrix{[a-zA-Z0-9]+})",
            ],
        )
    end
end

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
        doctest(POT)
    end
end

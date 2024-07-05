using Documenter

# Print `@debug` statements (https://github.com/JuliaDocs/Documenter.jl/issues/955)
if haskey(ENV, "GITHUB_ACTIONS")
    ENV["JULIA_DEBUG"] = "Documenter"
end

using PythonOT

DocMeta.setdocmeta!(PythonOT, :DocTestSetup, :(using PythonOT); recursive=true)

makedocs(;
    modules=[PythonOT, PythonOT.Smooth],
    authors="David Widmann",
    sitename="PythonOT.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://juliaoptimaltransport.github.io/PythonOT.jl",
        repolink="https://github.com/JuliaOptimalTransport/PythonOT.jl/blob/{commit}{path}#{line}",
        assets=String[],
    ),
    pages=["Home" => "index.md", "api.md"],
    checkdocs=:exports,
    doctestfilters=[
        r"{([a-zA-Z0-9]+,\s?)+[a-zA-Z0-9]+}",
        r"(Array{[a-zA-Z0-9]+,\s?1}|Vector{[a-zA-Z0-9]+})",
        r"(Array{[a-zA-Z0-9]+,\s?2}|Matrix{[a-zA-Z0-9]+})",
    ],
)

deploydocs(;
    repo="github.com/JuliaOptimalTransport/PythonOT.jl", push_preview=true, devbranch="main"
)

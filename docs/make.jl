using Documenter

# Print `@debug` statements (https://github.com/JuliaDocs/Documenter.jl/issues/955)
if haskey(ENV, "GITHUB_ACTIONS")
    ENV["JULIA_DEBUG"] = "Documenter"
end

using POT

DocMeta.setdocmeta!(POT, :DocTestSetup, :(using POT); recursive=true)

makedocs(;
    modules=[POT],
    authors="David Widmann",
    repo="https://github.com/devmotion/POT.jl/blob/{commit}{path}#{line}",
    sitename="POT.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://devmotion.github.io/POT.jl",
        assets=String[],
    ),
    pages=["Home" => "index.md", "api.md"],
    strict=true,
    checkdocs=:exports,
    doctestfilters=[
        r"{([a-zA-Z0-9]+,\s?)+[a-zA-Z0-9]+}",
        r"(Array{[a-zA-Z0-9]+,\s?1}|Vector{[a-zA-Z0-9]+})",
        r"(Array{[a-zA-Z0-9]+,\s?2}|Matrix{[a-zA-Z0-9]+})",
    ],
)

deploydocs(; repo="github.com/devmotion/POT.jl", push_preview=true, devbranch="main")

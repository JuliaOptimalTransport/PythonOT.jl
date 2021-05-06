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
)

deploydocs(; repo="github.com/devmotion/POT.jl", push_preview=true, devbranch="main")

using POT
using Documenter

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
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/devmotion/POT.jl",
    devbranch="main",
)

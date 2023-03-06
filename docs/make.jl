using CitationRecipes
using Documenter

DocMeta.setdocmeta!(CitationRecipes, :DocTestSetup, :(using CitationRecipes); recursive=true)

makedocs(;
    modules=[CitationRecipes],
    authors="singularitti <singularitti@outlook.com> and contributors",
    repo="https://github.com/singularitti/CitationRecipes.jl/blob/{commit}{path}#{line}",
    sitename="CitationRecipes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://singularitti.github.io/CitationRecipes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/singularitti/CitationRecipes.jl",
    devbranch="main",
)

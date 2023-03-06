module CitationRecipes

using Bibliography: Entry, xyear
using RecipesBase: AbstractPlot, @recipe, @series, @shorthands

@recipe function f(
    ::Type{Val{:experimentaldata}}, plt::AbstractPlot; ref=nothing, n_authors=1
)
    label = if ref isa Entry
        join((truncate_authors(ref, n_authors), xyear(ref)), ", ")
    else
        string(get(plotattributes, :label, ""))
    end
    seriestype := :scatter  # It has to be `:=`!
    markersize --> 3
    markerstrokecolor --> :auto
    markerstrokewidth --> 0
    label --> label
    return ()
end
@shorthands experimentaldata

@recipe function f(::Type{Val{:theoretical}}, plt::AbstractPlot; ref=nothing, n_authors=1)
    label = if ref isa Entry
        join((truncate_authors(ref, n_authors), xyear(ref)), ", ")
    else
        string(get(plotattributes, :label, ""))
    end
    seriestype := :path  # It has to be `:=`!
    label --> label
    return ()
end
@shorthands theoretical

function truncate_authors(ref::Entry, n::Integer)
    authors = Iterators.take(ref.authors, n)
    suffix = n < length(ref.authors) ? "et. al." : ""
    return join([[author.last for author in authors]; suffix], ", ")
end

end

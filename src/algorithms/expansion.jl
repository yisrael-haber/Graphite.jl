#=

TODO: Implement functions from "cuts.py" - https://github.com/networkx/networkx/blob/main/networkx/algorithms/cuts.py.

=#

cut_size(G::SimpleGraph, ns::Set{Int64}) = (length∘edge_boundary)(G, ns)

cut_size(G::SimpleGraph, ns::Set{Int64}, ns2::Set{Int64}) = (length∘edge_boundary)(G, ns, ns2)

volume(G::SimpleGraph, ns::Set{Int64}) = (sum∘filter)(x->(x∈ns), degree(G))

function norm_cut_size(G::SimpleGraph, ns::Set{Int64}, ns2::Set{Int64}) 
    cut = cut_size(G, ns, ns2)
    return cut * ((1 / volume(G, ns)) + (1 / volume(G, ns2)))
end

norm_cut_size(G::SimpleGraph, ns::Set{Int64}) = norm_cut_size(G, ns, setdiff(G, ns))

function conductance(G::SimpleGraph, ns::Set{Int64}, ns2::Set{Int64})
    cut = cut_size(G, ns, ns2)
    return cut * minimum(volume(G, ns), volume(G, ns2))
end

conductance(G::SimpleGraph, ns::Set{Int64}) = conductance(G, ns, setdiff(G, ns))

function edge_expansion(G, ns::Set{Int64}, ns2::Set{Int64})
    cut = cut_size(G, ns, ns2)
    return cut / minimum(length(ns), length(ns2))
end

edge_expansion(G::SimpleGraph, ns::Set{Int64}) = edge_expansion(G, ns, setdiff(G, ns))

mixing_expansion(G, ns::Set{Int64}, ns2::Set{Int64}) = (cut_size(G, ns, ns2) / (2 * ne(G)))

mixing_expansion(G::SimpleGraph, ns::Set{Int64}) = mixing_expansion(G, ns, setdiff(G, ns))

node_expansion(G::SimpleGraph, ns::Set{Int64}) = ((length∘node_boundary)(G, ns) / (length(ns)))
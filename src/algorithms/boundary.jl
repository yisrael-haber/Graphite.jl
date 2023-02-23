#=
TODO: LOOK AT USING SETDIFF TO SIMPLIFY
=#


#=
    Calculates the vector of all edge that start at a node in ns1,
    and end at a vertex outside of ns2.
=#
function edge_boundary(G::SimpleGraph, ns1::Set{Int64}, ns2::Set{Int64})
    if length(ns2) ≡ 0 return end

    edge_bound = []
    
    for node ∈ ns1 
        if node ∈ ns2 continue end
        for neighbor ∈ neighbors(G, node) 
            if neighbor ∈ ns2 push!(edge_bound, Edge(node, neighbor)) else continue end 
        end 
    end
    return Set(edge_bound)
end

function edge_boundary(G::SimpleGraph, ns::Set{Int64})
    edge_bound = []

    for node ∈ ns
        for neighbor ∈ neighbors(G, node) 
            if neighbor ∉ ns push!(edge_bound, Edge(node, neighbor)) else continue end 
    end end

    return Set(edge_bound)
end

#= 
    Calculates the set of all nodes that are outside of nv, 
    that are connected by an edge to a node in nv.
=#
function node_boundary(G::SimpleGraph, ns::Set{Int64})
    node_bound = []
    
    for node ∈ ns for neighbor ∈ neighbors(G, node) 
        if (neighbor ∉ ns) push!(node_bound, neighbor) end
        end 
    end

    return Set(node_bound)
end

function node_boundary(G::SimpleGraph, ns1::Set{Int64}, ns2::Set{Int64})
    if length(ns2) ≡ 0 return end

    node_bound = []
    
    for node ∈ ns2 for neighbor ∈ neighbors(G, node) 
        if (neighbor ∈ ns1) push!(node_bound, neighbor) end
    end end
    
    return Set(node_bound)
end

edge_boundary(G::SimpleGraph, nv::Vector{Int64}) = edge_boundary(G, Set(nv))

edge_boundary(G::SimpleGraph, nv::Vector{Int64}, nv2::Vector{Int64}) = edge_boundary(G, Set(nv), Set(nv2))

node_boundary(G::SimpleGraph, nv::Vector{Int64}) = node_boundary(G, Set(nv))

node_boundary(G::SimpleGraph, nv::Vector{Int64}, nv2::Vector{Int64}) = node_boundary(G, Set(nv), Set(nv2))
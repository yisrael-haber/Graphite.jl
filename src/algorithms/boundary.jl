sort_two(val1::Int64, val2::Int64) = if val1>=val2 return (val2, val1) else return (val1, val2) end

#=
    Calculates the vector of all edge that start at a node in node_vec,
    and end at a vertex outside of node_vec.
=#
function edge_boundary(orig_graph::AbstractGraph, node_set::Set{Int64})
    edges_from_node_set = []
    
    for node in node_set for neighbor in neighbors(orig_graph, node) 
        v_one,v_two = sort_two(node, neighbor)
        push!(edges_from_node_set, Edge(v_one, v_two))
    end end
    
    edges_set = Set(edges_from_node_set) 
    boundary = []
    
    for edge in edges_set
        if (src(edge) in node_set && dst(edge) in node_set) continue 
        else push!(boundary, edge) end
    end
    return boundary
end


#= 
    Calculates the set of all nodes that are outside of node_vec, 
    that are connected by an edge to a node in node_vec.
=#
function node_boundary(orig_graph::AbstractGraph, node_set::Set{Int64})
    edges_from_node_set = []
    
    for node in node_set for neighbor in neighbors(orig_graph, node) 
        if !(neighbor in node_set) push!(edges_from_node_set, neighbor) end
    end end
    
    val = Set(edges_from_node_set)
    return val
end

edge_boundary(orig_graph::AbstractGraph, node_vec::Vector{Int64}) = edge_boundary(orig_graph, Set(node_vec))

node_boundary(orig_graph::AbstractGraph, node_vec::Vector{Int64}) = node_boundary(orig_graph, Set(node_vec))
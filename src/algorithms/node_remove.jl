function rem_node_edges!(G::SimpleGraph, node::Int64)
    for neighbor ∈ neighbors(G, node) rem_edge!(G, node, neighbor) end
end

function rem_nodes_edges!(G::SimpleGraph, node_vec::Int64)
    for node ∈ node_vec rem_node_edges!(G, node) end
end
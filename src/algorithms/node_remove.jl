function rem_node_edges!(orig_graph::AbstractGraph, node::Int64)
    for neighbor in neighbors(orig_graph, node) rem_edge!(orig_graph, node, neighbor) end
end

function rem_nodes_edges!(orig_graph::AbstractGraph, node_vec::Int64)
    for node in node_vec rem_node_edges!(orig_graph, node) end
end
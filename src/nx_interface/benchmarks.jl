function benchmark_node_boundary(orig_graph::SimpleGraph, node_vec::Vector{Int64})
    t1 = @btime node_boundary(orig_graph, node_vec)
    
    # nx_graph = convert_graph_to_nx(orig_graph)
    # t2 = @btime py"node_boundary"(nx_graph, node_vec)
    
    # println(mean(t2)-mean(t1))
end
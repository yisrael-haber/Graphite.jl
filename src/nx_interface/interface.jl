function convert_graph_to_nx(orig_graph::SimpleGraph)
    G = py"nx.Graph()"
	G.add_edges_from(map(x->(src(x), dst(x)), edges(orig_graph)))
	return G
end

function convert_from_nx_graph(orig_graph)
    G = Graph(length(orig_graph.nodes))
    for edge ∈ orig_graph.edges add_edge!(G, Edge(edge[1], edge[2])) end
    return G
end
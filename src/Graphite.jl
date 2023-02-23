module Graphite

using Graphs
using Revise
using PyCall
using StatsBase
using BenchmarkTools

py_imports = [
    "import networkx as nx",
    "from networkx import node_boundary"
]

function __init__()
    for line ∈ py_imports
        py"""
        $$line
        """
    end
end

include("algorithms/refs.jl")
include("nx_interface/refs.jl")
# Write your package code here.

export ust
export edge_boundary, node_boundary
export convert_from_nx_graph, convert_graph_to_nx
export benchmark_node_boundary
export rem_node_edges!, rem_nodes_edges!
export is_regular_nz, is_regular_wz, is_k_regular_nz, is_k_regular_wz
end
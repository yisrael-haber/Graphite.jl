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
    for line in py_imports
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
end
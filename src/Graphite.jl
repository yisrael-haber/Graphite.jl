module Graphite

using Graphs
using Revise
using PyCall
using StatsBase

py_imports = [
    "import networkx as nx"
]

function __init__()
    for line in py_imports
        py"""
        $$line
        """
    end
end

include("ust.jl")
# Write your package code here.

export ust
end
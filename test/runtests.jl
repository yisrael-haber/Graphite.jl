using Graphite
using Test
using Graphs

#=

THERE IS A REAL NEED FOR MUCH MORE TESTS ASAP. THERE IS ALSO A DIRECT NEED FOR BENCHMARKING
AGAINST NETWORKX. IF YOU CAN HELP WITH THAT PLEASE REACH OUT.

=#

@testset "UST is tree" begin
    node_num, deg = 1000, 4
    @test ne(ust(random_regular_graph(node_num, deg))) == node_num - 1
end

@testset "Edge and node boundary" begin 
    node_num = 10_000
    cycle, nodes = cycle_graph(node_num), collect(1:3:node_num)
    
    #Depending on the node_num, it might be off by one - if modulo 3 it comes out to two.
    @test length(edge_boundary(cycle, nodes)) == Int64(floor(node_num * (2/3)))
    @test length(node_boundary(cycle, nodes)) == Int64(floor(node_num * (2/3)))
end

@testset "nx interface" begin
    g = random_regular_graph(200, 4)
    @test convert_from_nx_graph(convert_graph_to_nx(g)) == g
end

@testset "Node remove by edges" begin
    println("IMPLEMENT TESTS")
end

include("tests/regularity_tests.jl")
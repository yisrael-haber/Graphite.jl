using Graphite
using Test
using Graphs

@testset "Uniform Spanning Trees" begin
    node_num, deg = 1000, 4
    @test ne(ust(random_regular_graph(node_num, deg))) == node_num - 1
end

@testset "Edge boundary" begin 
    node_num = 10_000
    cycle, nodes = cycle_graph(node_num), collect(1:3:node_num)
    
    #Depending on the node_num, it might be off by one - if modulo 3 it comes out to two.
    @test length(edge_boundary(cycle, nodes)) == Int64(floor(node_num * (2/3)))
    @test length(node_boundary(cycle, nodes)) == Int64(floor(node_num * (2/3)))
end
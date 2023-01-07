using Graphite
using Test
using Graphs

@testset "Uniform Spanning Trees" begin
    node_num, deg = 1000, 4
    @test ne(ust(random_regular_graph(node_num, deg))) == node_num - 1
end
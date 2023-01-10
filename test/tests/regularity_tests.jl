@testset "Testing Regularity" begin
    success, trial_num, node_num, deg = 0, 1000, 100, 4
    for i=1:trial_num
        g = random_regular_graph(node_num, deg)
        if (is_regular_nz(g) && is_regular_wz(g)) success += 1 end
    end
    @test success==trial_num 

    success = 0
    for i=1:trial_num
        g = random_regular_graph(node_num, deg)
        add_vertex!(g)
        if (is_regular_nz(g) && !is_regular_wz(g)) success += 1 end
    end
    @test success==0

    success = 0
    for i=1:trial_num
        g = random_regular_graph(node_num, deg)
        if (is_k_regular_nz(g, deg) && is_k_regular_wz(g, deg)) success += 1 end
    end
    @test success==trial_num

    success = 0
    for i=1:trial_num
        g = random_regular_graph(node_num, deg)
        add_vertex!(g)
        if (is_k_regular_nz(g, deg) && !is_k_regular_wz(g, deg)) success += 1 end
    end
    @test success==0
end
function stat_prob_gen(deg_list::Vector{Int64})
    inv_degrees = map(deg->(1/deg), deg_list)
    inv_degree_sum = sum(inv_degrees)
    return map(x->x/inv_degree_sum, inv_degrees)
end

stationary_dist_choice(deg_list::Vector{Int64}) = sample(1:length(deg_list), ProbabilityWeights(stat_prob_gen(deg_list)))

next_step(G::SimpleGraph, curr_vertex::Int64) = (rand∘neighbors)(G, curr_vertex)

function create_tree(node_num::Int64, edges_to_add::Vector{Tuple{Int64, Int64}})
    tree = SimpleGraph(node_num)
    for edge in edges_to_add add_edge!(tree, edge[1], edge[2]) end
    return tree
end

function do_next_step!(G::SimpleGraph, next_choice::Int64, edges_to_add::Vector{Tuple{Int64, Int64}}, visited::Vector{Bool})
    next_next_vertex = next_step(G, next_choice)
    if visited[next_next_vertex] == 0
        push!(edges_to_add, (next_choice, next_next_vertex))
        visited[next_next_vertex] = 1
    end
    return next_next_vertex
end

function first_two_steps!(G::SimpleGraph, visited::Vector{Bool})
    first_node = stationary_dist_choice(degree(G))
    next_node = next_step(G, first_node)
    visited[first_node], visited[next_node] = 1, 1
    return first_node, next_node
end

function init_params(G::SimpleGraph)
    visited = zeros(Bool, nv(G))
    first_node, next_node = first_two_steps!(G, visited)
    return visited, first_node, next_node, [(first_node, next_node)]
end

function ust(G::SimpleGraph)
    visited, first_node, next_node, edges_to_add = init_params(G)
    while length(edges_to_add) < nv(G) - 1
        next_node = do_next_step!(G, next_node, edges_to_add, visited)
    end
    return create_tree(nv(G), edges_to_add)
end
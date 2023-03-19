using Graphs

init_root_visited(vertex, root) = if vertex≡root return true else false end

function my_bfs(G::AbstractGraph, root)

	visitedVertices = map(x->init_root_visited(x, root), vertices(G))
	queue = [root]
	levels = zeros(Int64, nv(G))
	levels[root] = 1

	while length(queue)!= 0
		s = popfirst!(queue)

		for neighbor in neighbors(G, s)
			if visitedVertices[neighbor]≡false
				visitedVertices[neighbor] = true
				levels[neighbor] = levels[s] + 1
				push!(queue, neighbor)
			end
		end
	end
	return levels
end

function single_connec_comp(G::AbstractGraph, vertex)
    levels = filter(x->(x[2]!=0), enumerate(my_bfs(G, vertex)))
	return map(x->x[1], levels)
end

function all_connec_comp(G::AbstractGraph)

	visited, components = [], []
	not_visited = ones(bool, nv(G))#[true for node in vertices(G)]

	for node in vertices(G)

		if (not_visited[node] ≡ false) continue end

		connec_comp = single_connec_comp(G, node)
		push!(components, connec_comp)

		for vertex in connec_comp not_visited[vertex] = false end
	end
	return components
end

function giant_connec_comp(G::AbstractGraph)

	not_visited = ones(Bool, nv(G))#[true for node in vertices(G)]
	biggest_connec_comp = Graph()#single_connec_comp(G, 1)
	biggest_size = 0#length(biggest_connec_comp)

	for node in vertices(G)

		if (not_visited[node]≡false) continue end

		connec_comp = single_connec_comp(G, node)
		for vertex in connec_comp not_visited[vertex] = false end
		next_size = length(connec_comp)
		if next_size > biggest_size
			biggest_connec_comp = connec_comp
			biggest_size = next_size
		end

	end
	return biggest_connec_comp, biggest_size
end
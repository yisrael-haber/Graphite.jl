_is_constant(deg_list::Vector{Int64}) = _is_constant_k(deg_list, first(deg_list))

_is_constant_k(deg_list::Vector{Int64}, val::Int64) = (length(filter(x->x==val, deg_list))==length(deg_list))

is_regular_nz(orig_graph::SimpleGraph) = _is_constant(degree(orig_graph))

function is_regular_wz(orig_graph::SimpleGraph)
    nz_degrees = filter(x->x!=0, degree(orig_graph))
    return _is_constant(nz_degrees)
end

is_k_regular_nz(orig_graph::SimpleGraph, deg::Int64) = _is_constant_k(degree(orig_graph), deg)

function is_k_regular_wz(orig_graph::SimpleGraph, deg::Int64)
    nz_degrees = filter(x->x!=0, degree(orig_graph))
    return _is_constant_k(nz_degrees, deg)
end

# function is_k_regular_wz(orig_graph::SimpleGraph, deg::Int64)
#     degrees = filter(x->x!=0, degree(orig_graph))
#     if length(degrees)==0 return true end 
#     for node in eachindex(degrees) if degrees[node] != deg return false end end
#     return true
# end
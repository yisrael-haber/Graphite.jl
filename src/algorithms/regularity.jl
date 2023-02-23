_is_constant(deg_list::Vector{Int64}) = _is_constant_k(deg_list, first(deg_list))

_is_constant_k(deg_list::Vector{Int64}, val::Int64) = (length(filter(x->x≡val, deg_list))==length(deg_list))

is_regular_nz(G::SimpleGraph) = _is_constant(degree(G))

function is_regular_wz(G::SimpleGraph)
    nz_degrees = filter(x->x≢0, degree(G))
    return _is_constant(nz_degrees)
end

is_k_regular_nz(G::SimpleGraph, deg::Int64) = _is_constant_k(degree(G), deg)

function is_k_regular_wz(G::SimpleGraph, deg::Int64)
    nz_degrees = filter(x->x≢0, degree(G))
    return _is_constant_k(nz_degrees, deg)
end
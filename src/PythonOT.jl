module PythonOT

using PyCall: PyCall

export emd,
    emd2,
    sinkhorn,
    sinkhorn2,
    barycenter,
    barycenter_unbalanced,
    sinkhorn_unbalanced,
    sinkhorn_unbalanced2

const pot = PyCall.PyNULL()

include("lib.jl")
include("smooth.jl")

function __init__()
    return copy!(pot, PyCall.pyimport_conda("ot", "pot", "conda-forge"))
end

end

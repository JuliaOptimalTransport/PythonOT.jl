module Smooth

using ..PythonOT: PythonOT
using ..PyCall: PyCall

export smooth_ot_dual

"""
    smooth_ot_dual(μ, ν, C, ε; reg_type="l2", kwargs...)

Compute the optimal transport plan for a regularized optimal transport problem
with source and target marginals `μ` and `ν`, cost matrix `C` of size
`(length(μ), length(ν))`, and regularization parameter `ε`.

The optimal transport map `γ` is of the same size as `C` and solves
```math
\\inf_{\\gamma \\in \\Pi(\\mu, \\nu)} \\langle \\gamma, C \\rangle
+ \\varepsilon \\Omega(\\gamma),
```
where ``\\Omega(\\gamma)`` is the L2-regularization term
``\\Omega(\\gamma) = \\|\\gamma\\|_F^2/2`` if `reg_type="l2"` (the default) or
the entropic regularization term
``\\Omega(\\gamma) = \\sum_{i,j} \\gamma_{i,j} \\log \\gamma_{i,j}`` if `reg_type="kl"`.

The function solves the dual formulation[^BSR2018]
```math
\\max{\\alpha, \\beta} \\mu^{\\mathsf{T}} \\alpha + \\nu^{\mathsf{T}} \\beta −
\\sum_{j} \\delta_{\\Omega}(\\alpha + \\beta_j - C_j),
```
where ``C_j`` is the ``j``th column of the cost matrix and ``\\delta_{\\Omega}`` is the
conjugate of the regularization term ``\\Omega``.

This function is a wrapper of the function
[`smooth_ot_dual`](https://pythonot.github.io/gen_modules/ot.smooth.html#ot.smooth.smooth_ot_dual)
in the Python Optimal Transport package. Keyword arguments are listed in the documentation
of the Python function.

# Examples

```jldoctest
julia> μ = [0.5, 0.2, 0.3];

julia> ν = [0.0, 1.0];

julia> C = [0.0  1.0;
            2.0  0.0;
            0.5  1.5];

julia> smooth_ot_dual(μ, ν, C, 0.01)
3×2 Matrix{Float64}:
 0.0  0.5
 0.0  0.2
 0.0  0.300001
```

# References

[^BSR2018]: Blondel, M., Seguy, V., & Rolet, A. (2018). Smooth and Sparse Optimal Transport. In *Proceedings of the Twenty-First International Conference on Artificial Intelligence and Statistics (AISTATS)*.
"""
function smooth_ot_dual(μ, ν, C, ε; kwargs...)
    return PythonOT.pot.smooth.smooth_ot_dual(μ, ν, C, ε; kwargs...)
end
end

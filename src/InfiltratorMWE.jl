# import Pkg
# Pkg.add("Roots")
# Pkg.add("Infiltrator")

module InfiltratorMWE

using Roots

using Infiltrator

export main

function diff_fun(k, α)
    @exfiltrate

    k^α - k
end

function solve_model(α)
    @assert α > 0 && α < 1

    f = let α = α
        k -> diff_fun(k, α)
    end

    find_zero(f, (0.01, 100))
end

function main()
    α = .5

    solve_model(α)
end

end # module

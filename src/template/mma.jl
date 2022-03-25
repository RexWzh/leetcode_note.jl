## simulate Mathematica functions
function mma_nest(f::Function, val::T, times::Int)::T where T
    ## e.g. mma_nest(f, val, 3) | returns f(f(f(val)))
    for _ in 1:times
        val = f(val)
    end
    val
end

function mma_nest_list(f::Function, val::T, times::Int)::Vector{T} where T
    ## e.g. mma_nest(f, val, 2) | returns [val, f(val), f(f(val))]
    res = Vector{T}(undef, times + 1)
    res[1] = val
    for i in 2:(times + 1)
        res[i] = val = f(val)
    end
    res
end

function nest_while(f::Function, val::T, chk::Function)::T where T
    while chk(val)
        val = f(val)
    end
    val
end

function nest_while_list(f::Function, val::T, chk::Function)::Vector{T} where T
    res = [val]
    while chk(val)
        val = f(val)
        push!(res, val)
    end
    res
end


## debug tools
Base.@kwdef mutable struct MMA
    name::String = "f"
    show::String = "f"
end

Base.show(io::IO, f::MMA) = print(io, f.show)

(f::MMA)(args...)::MMA = MMA(f.name, "$(f.name)($(join(args,", ")))")

Base.:(+)(f::MMA, g::MMA) = MMA(f.name, "$(f.show) + $(g.show)")

## 
f, g = MMA(), MMA("g", "g")
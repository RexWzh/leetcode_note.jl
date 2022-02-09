## 2022-02-09
## Counting sort
function count_difference(nums::Vector{Int}, k::Int)::Int
    res, mi, ma = 0, minimum(nums), maximum(nums)
    table = Dict{Int, Int}(i => 0 for i in mi:ma)
    for i in nums
        table[i] += 1
    end
    for i in mi:(ma - k)
        res += (table[i] * table[i+k])
    end
    res
end
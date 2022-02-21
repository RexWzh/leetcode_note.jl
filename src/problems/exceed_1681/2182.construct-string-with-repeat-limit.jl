## @lc code=start
using LeetCode

using DataStructures
function repeat_limited_string(s::String, repeat_limit::Int)::String
    table = counter(s)
    chars = sort!([i for i in keys(table)]; rev=true)
    res, i, n, char_len = Char[], 1, length(chars), table[chars[1]]
    while true
        if char_len <= repeat_limit
            append!(res, fill(chars[i], char_len))
            table[chars[i]] = 0
            i == n && return join(res)
            char_len = table[chars[i += 1]]
        else
            append!(res, fill(chars[i], repeat_limit))
            char_len -= repeat_limit
            j = findfirst(x -> table[x] != 0, @view chars[i + 1:end])
            j === nothing && return join(res)
            push!(res, chars[i + j])
            table[chars[i + j]] -= 1
        end
    end
end

## @lc code=end
## @lc test=start
@testset "2182.construct-string-with-repeat-limit.jl" begin
    @test repeat_limited_string("cczazcc", 3) == "zzcccac"
    @test repeat_limited_string("aababab", 2) == "bbabaa"
end
## @lc test=end

## @lc info=start
# link: [solution to 2182]()
## @lc info=end
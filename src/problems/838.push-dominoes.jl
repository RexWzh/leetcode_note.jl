# ---
# title: 838. Push Dominoes
# id: problem838
# author: zhwang
# date: 2022-02-21
# difficulty: Medium
# categories: Two Pointers, Dynamic Programming
# link: <https://leetcode.com/problems/push-dominoes/description/>
# hidden: true
# ---
# 
# There are `N` dominoes in a line, and we place each domino vertically upright.
# 
# In the beginning, we simultaneously push some of the dominoes either to the
# left or to the right.
# 
# ![](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/05/18/domino.png)
# 
# After each second, each domino that is falling to the left pushes the adjacent
# domino on the left.
# 
# Similarly, the dominoes falling to the right push their adjacent dominoes
# standing on the right.
# 
# When a vertical domino has dominoes falling on it from both sides, it stays
# still due to the balance of the forces.
# 
# For the purposes of this question, we will consider that a falling domino
# expends no additional force to a falling or already fallen domino.
# 
# Given a string "S" representing the initial state. `S[i] = 'L'`, if the i-th
# domino has been pushed to the left; `S[i] = 'R'`, if the i-th domino has been
# pushed to the right; `S[i] = '.'`, if the `i`-th domino has not been pushed.
# 
# Return a string representing the final state.
# 
# **Example 1:**
# 
#     
#     
#     Input: ".L.R...LR..L.."
#     Output: "LL.RR.LLRRLL.."
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: "RR.L"
#     Output: "RR.L"
#     Explanation: The first domino expends no additional force on the second domino.
#     
# 
# **Note:**
# 
#   1. `0 <= N <= 10^5`
#   2. String `dominoes` contains only `'L`', `'R'` and `'.'`
# 
# 
## @lc code=start
using LeetCode
function push_dominoes(dominoes::String)::String
    n, res =  length(dominoes), []
    while length(res) < n
        pos = length(res) + 1
        if dominoes[pos] == '.'
            i = findfirst(x -> x != '.', @view dominoes[pos + 1:end])
            i === nothing && return join(res) * @view dominoes[pos:end]
            append!(res, dominoes[pos + i] == 'L' ? fill('L', i + 1) : fill('.', i))
        elseif dominoes[pos] == 'L'
            push!(res, 'L')
        else ## dominoes[pos] == 'R'
            i = findfirst(x -> x != '.', @view dominoes[pos + 1:end])
            i === nothing && return join(append!(res, fill('R', n - pos + 1)))
            if dominoes[pos + i] =='R'
                append!(res, fill('R', i))
            elseif dominoes[pos + i] == 'L'
                append!(res, fill('R', cld(i, 2)))
                iseven(i) && push!(res, '.')
                append!(res, fill('L', cld(i, 2)))
            end
        end
    end
    return join(res)
end

## @lc test=start
@testset "838.push-dominoes.jl" begin
    @test push_dominoes("RR.L") == "RR.L"
    @test push_dominoes(".L.R...LR..L..") == "LL.RR.LLRRLL.."
    @test push_dominoes(".L.R.") == "LL.RR"
end
## @lc test=end

## @lc info=start
# link: [solution to 838](https://leetcode-cn.com/problems/push-dominoes/solution/pythonjuliazi-dong-ji-shuang-zhi-zhen-by-d4rb/)
## @lc info=end
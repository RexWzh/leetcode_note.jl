# ---
# title: 1601. Maximum Number of Achievable Transfer Requests
# id: problem1601
# author: zhwang
# date: 2022-02-28
# difficulty: Hard
# categories: Dynamic Programming
# link: <https://leetcode.com/problems/maximum-number-of-achievable-transfer-requests/description/>
# hidden: true
# ---
# 
# We have `n` buildings numbered from `0` to `n - 1`. Each building has a number
# of employees. It's transfer season, and some employees want to change the
# building they reside in.
# 
# You are given an array `requests` where `requests[i] = [fromi, toi]`
# represents an employee's request to transfer from building `fromi` to building
# `toi`.
# 
# **All buildings are full** , so a list of requests is achievable only if for
# each building, the **net change in employee transfers is zero**. This means
# the number of employees **leaving** is **equal** to the number of employees
# **moving in**. For example if `n = 3` and two employees are leaving building
# `0`, one is leaving building `1`, and one is leaving building `2`, there
# should be two employees moving to building `0`, one employee moving to
# building `1`, and one employee moving to building `2`.
# 
# Return _the maximum number of achievable requests_.
# 
# 
# 
# **Example 1:**
# 
# ![](https://assets.leetcode.com/uploads/2020/09/10/move1.jpg)
# 
#     
#     
#     Input: n = 5, requests = [[0,1],[1,0],[0,1],[1,2],[2,0],[3,4]]
#     Output: 5
#     **Explantion:** Let's see the requests:
#     From building 0 we have employees x and y and both want to move to building 1.
#     From building 1 we have employees a and b and they want to move to buildings 2 and 0 respectively.
#     From building 2 we have employee z and they want to move to building 0.
#     From building 3 we have employee c and they want to move to building 4.
#     From building 4 we don't have any requests.
#     We can achieve the requests of users x and b by swapping their places.
#     We can achieve the requests of users y, a and z by swapping the places in the 3 buildings.
#     
# 
# **Example 2:**
# 
# ![](https://assets.leetcode.com/uploads/2020/09/10/move2.jpg)
# 
#     
#     
#     Input: n = 3, requests = [[0,0],[1,2],[2,1]]
#     Output: 3
#     **Explantion:** Let's see the requests:
#     From building 0 we have employee x and they want to stay in the same building 0.
#     From building 1 we have employee y and they want to move to building 2.
#     From building 2 we have employee z and they want to move to building 1.
#     We can achieve all the requests. 
# 
# **Example 3:**
# 
#     
#     
#     Input: n = 4, requests = [[0,3],[3,1],[1,2],[2,0]]
#     Output: 4
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= n <= 20`
#   * `1 <= requests.length <= 16`
#   * `requests[i].length == 2`
#   * `0 <= fromi, toi < n`
# 
# 
## @lc code=start
using LeetCode

using DataStructures
function maximum_requests(::Int, requests::Vector{Vector{Int}})::Int
    is_valid_request(req) = counter(requests[i][1] for i in req) == counter(requests[i][2] for i in req)
    ans, m = 0, length(requests)
    for k in 1:(1 << m)
        req = filter(i -> isodd(k >> (i - 1)), 1:m)
        ans = length(req) > ans && is_valid_request(req) ? length(req) : ans
    end
    ans
end
## @lc code=end
function maximum_requests(n, requests::Vector{Vector{Int}})
    m = length(requests)
    res = 0
    net_trans = fill(0, n)
    for i in 0:((1 << m) - 1) 
        for j in 0:m-1
            (i & (1 << j)) == 0 && continue
            net_trans[requests[j + 1][1] + 1] += 1
            net_trans[requests[j + 1][2] + 1] -= 1
        end
        all(iszero, net_trans) && (res = max(res, count_ones(i)))
        fill!(net_trans, 0)
    end
    res
end
## @lc test=start
@testset "1601.maximum-number-of-achievable-transfer-requests.jl" begin
    @test maximum_requests(5, [[0,1],[1,0],[0,1],[1,2],[2,0],[3,4]]) == 5
    @test maximum_requests(3, [[0,0],[1,2],[2,1]]) == 3
    @test maximum_requests(4, [[0,3],[3,1],[1,2],[2,0]]) == 4
    @test maximum_requests(20, [[0,7],[2,0],[2,15],[5,6],[6,16],[6,16],[6,17],[7,14],[11,2],[13,2],[14,11],[15,6],[16,5],[16,6],[17,13],[19,10]]) == 15
end
## @lc test=end
## @lc info=start
# link: [solution to 1601](https://leetcode-cn.com/problems/maximum-number-of-achievable-transfer-requests/solution/er-jin-zhi-mei-ju-1601-zui-duo-ke-da-che-l0ex/)
## @lc info=end
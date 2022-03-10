# ---
# title: 504. Base 7
# id: problem504
# author: zhwang
# date: 2022-03-10
# difficulty: Easy
# categories: 
# link: <https://leetcode.com/problems/base-7/description/>
# hidden: true
# ---
# 
# Given an integer, return its base 7 string representation.
# 
# **Example 1:**  
# 
#     
#     
#     Input: 100
#     Output: "202"
#     
# 
# **Example 2:**  
# 
#     
#     
#     Input: -7
#     Output: "-10"
#     
# 
# **Note:** The input will be in range of [-1e7, 1e7].
# 
# 
## @lc code=start
using LeetCode

function convert_to_base7(num::Int)::String
    num == 0 && return "0"
    res = Int[]
    sign = num < 0 ? -1 : 1
    num *= sign
    while num > 0
        push!(res, num % 7)
        num ÷= 7
    end
    reverse!(res)
    return sign != -1 ? join(res) : "-" * join(res)
end

## @lc code=end

## @lc test=start
@testset "504.base-7.jl" begin
    @test convert_to_base7(100) == "202"
    @test convert_to_base7(-7) == "-10"
    @test convert_to_base7(0) == "0"
end
## @lc test=end

## @lc info=start
# link: [solution to 504]()
## @lc info=end
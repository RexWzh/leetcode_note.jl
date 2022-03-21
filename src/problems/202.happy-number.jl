# ---
# title: 202. Happy Number
# id: problem202
# author: zhwang
# date: 2022-03-22
# difficulty: Easy
# categories: Hash Table, Math
# link: <https://leetcode.com/problems/happy-number/description/>
# hidden: true
# ---
# 
# Write an algorithm to determine if a number `n` is "happy".
# 
# A happy number is a number defined by the following process: Starting with any
# positive integer, replace the number by the sum of the squares of its digits,
# and repeat the process until the number equals 1 (where it will stay), or it
# **loops endlessly in a cycle** which does not include 1. Those numbers for
# which this process **ends in 1** are happy numbers.
# 
# Return True if `n` is a happy number, and False if not.
# 
# **Example:  **
# 
#     
#     
#     Input: 19
#     Output: true
#     Explanation: 12 + 92 = 82
#     82 + 22 = 68
#     62 + 82 = 100
#     12 + 02 + 02 = 1
#     
# 
# 
## @lc code=start
using LeetCode
function ishappy(n::Int)::Bool
    while n != 1
        n == 4 && return false
        n = sum(digits(n) .^ 2)
    end
    true
end
## @lc code=end

## @lc test=start
@testset "202.happy-number.jl" begin
    @test all(ishappy(i) for i in (1, 7, 10, 13, 19, 23, 28, 31, 123456))
    @test !any(ishappy(i) for i in 2:6)
    @test !any(ishappy(i) for i in (8, 9, 11, 12, 12345))
end
## @lc test=end

## @lc info=start
# link: [solution to 202]()
## @lc info=end
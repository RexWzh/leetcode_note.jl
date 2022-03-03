# ---
# title: 258. Add Digits
# id: problem258
# author: zhwang
# date: 2022-03-03
# difficulty: Easy
# categories: Math
# link: <https://leetcode.com/problems/add-digits/description/>
# hidden: true
# ---
# 
# Given a non-negative integer `num`, repeatedly add all its digits until the
# result has only one digit.
# 
# **Example:**
# 
#     
#     
#     Input: 38
#     Output: 2 
#     Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. 
#                  Since 2 has only one digit, return it.
#     
# 
# **Follow up:**  
# Could you do it without any loop/recursion in O(1) runtime?
# 
# 
## @lc code=start
using LeetCode

function add_digits(num::Int)::Int
    num <= 9 && return num
    return iszero(num % 9) ? 9 : num % 9
end
## @lc code=end

## @lc test=start
@testset "258.add-digits.jl" begin
    @test all(add_digits(i) == i for i in 0:9)
    @test add_digits(18) == 9
    @test add_digits(10) == 1
    @test add_digits(38) == 2
end
## @lc test=end

## @lc info=start
# link: [solution to 258]()
## @lc info=end
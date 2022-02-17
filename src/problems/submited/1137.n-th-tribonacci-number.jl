# ---
# title: 1137. N-th Tribonacci Number
# id: problem1137
# author: zhwang
# date: 2022-02-10
# difficulty: Easy
# categories: Recursion
# link: <https://leetcode.com/problems/n-th-tribonacci-number/description/>
# hidden: true
# ---
# 
# The Tribonacci sequence Tn is defined as follows:
# 
# T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn \+ Tn+1 \+ Tn+2 for n >= 0.
# 
# Given `n`, return the value of Tn.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: n = 4
#     Output: 4
#     Explanation:
#     T_3 = 0 + 1 + 1 = 2
#     T_4 = 1 + 1 + 2 = 4
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: n = 25
#     Output: 1389537
#     
# 
# 
# 
# **Constraints:**
# 
#   * `0 <= n <= 37`
#   * The answer is guaranteed to fit within a 32-bit integer, ie. `answer <= 2^31 - 1`.
# 
# 
## @lc code=start
using LeetCode

function tribonacci_1137(n::Int)::Int
    n <= 1 && return n
    a, b, c = 0, 1, 1
    for _ in 1:(n - 2)
        a, b, c = b, c, a + b + c
    end
    c
end
## @lc code=end

## @lc test=start
@testset "1137.n-th-tribonacci-number.jl" begin
    @test tribonacci_1137(0) == 0
    @test tribonacci_1137(3) == 2
    @test tribonacci_1137(4) == 4
    @test tribonacci_1137(37) == 2082876103
end
## @lc test=end
# link: [solution to 1137](https://leetcode-cn.com/problems/n-th-tribonacci-number/solution/1137-di-n-ge-tai-bo-na-qi-shu-by-rex-rs-ilwr/)
## @lc info=start

## @lc info=end
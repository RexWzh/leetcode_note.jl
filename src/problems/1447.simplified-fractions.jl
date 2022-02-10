# ---
# title: 1447. Simplified Fractions
# id: problem1447
# author: zhwang
# date: 2022-02-10
# difficulty: Medium
# categories: Math
# link: <https://leetcode.com/problems/simplified-fractions/description/>
# hidden: true
# ---
# 
# Given an integer `n`, return a list of all **simplified** fractions between 0
# and 1 (exclusive) such that the denominator is less-than-or-equal-to `n`. The
# fractions can be in **any** order.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: n = 2
#     Output: ["1/2"]
#     Explanation: "1/2" is the only unique fraction with a denominator less-than-or-equal-to 2.
# 
# **Example 2:**
# 
#     
#     
#     Input: n = 3
#     Output: ["1/2","1/3","2/3"]
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: n = 4
#     Output: ["1/2","1/3","1/4","2/3","3/4"]
#     Explanation: "2/4" is not a simplified fraction because it can be simplified to "1/2".
# 
# **Example 4:**
# 
#     
#     
#     Input: n = 1
#     Output: []
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= n <= 100`
# 
# 
## @lc code=start
using LeetCode

simplified_fractions(n::Int) = ["$p/$q" for q in 2:n for p in 1:(q - 1) if gcd(p, q) == 1]
## @lc code=end

## @lc test=start
@testset "1447.simplified-fractions.jl" begin
    @test simplified_fractions(1) == []
    @test simplified_fractions(2) == ["1/2"]
    @test sort(simplified_fractions(3)) == sort(["1/2", "1/3", "2/3"])
    @test sort(simplified_fractions(4)) == sort(["1/2","1/3","1/4","2/3","3/4"])
end
## @lc test=end

## @lc info=start
# link: [solution to 1447](https://leetcode-cn.com/problems/simplified-fractions/solution/1447-zui-jian-fen-shu-by-rex-rs-r0ex/)
## @lc info=end
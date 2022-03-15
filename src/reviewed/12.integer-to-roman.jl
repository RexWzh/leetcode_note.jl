# ---
# title: 12. Integer to Roman
# id: problem12
# author: zhwang
# date: 2022-03-15
# difficulty: Medium
# categories: Math, String
# link: <https://leetcode.com/problems/integer-to-roman/description/>
# hidden: true
# ---
# 
# Roman numerals are represented by seven different symbols: `I`, `V`, `X`, `L`,
# `C`, `D` and `M`.
# 
#     
#     
#     **Symbol**       **Value**
#     I             1
#     V             5
#     X             10
#     L             50
#     C             100
#     D             500
#     M             1000
# 
# For example, `2` is written as `II` in Roman numeral, just two one's added
# together. `12` is written as `XII`, which is simply `X + II`. The number `27`
# is written as `XXVII`, which is `XX + V + II`.
# 
# Roman numerals are usually written largest to smallest from left to right.
# However, the numeral for four is not `IIII`. Instead, the number four is
# written as `IV`. Because the one is before the five we subtract it making
# four. The same principle applies to the number nine, which is written as `IX`.
# There are six instances where subtraction is used:
# 
#   * `I` can be placed before `V` (5) and `X` (10) to make 4 and 9. 
#   * `X` can be placed before `L` (50) and `C` (100) to make 40 and 90. 
#   * `C` can be placed before `D` (500) and `M` (1000) to make 400 and 900.
# 
# Given an integer, convert it to a roman numeral.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: num = 3
#     Output: "III"
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: num = 4
#     Output: "IV"
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: num = 9
#     Output: "IX"
#     
# 
# **Example 4:**
# 
#     
#     
#     Input: num = 58
#     Output: "LVIII"
#     Explanation: L = 50, V = 5, III = 3.
#     
# 
# **Example 5:**
# 
#     
#     
#     Input: num = 1994
#     Output: "MCMXCIV"
#     Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= num <= 3999`
# 
# 
## @lc code=start
using LeetCode
function int_to_roman(num::Int)::String
    table = ("IVX", "XLC", "CDM", "M--")
    function get_num(n::Int, st::String)::String
        I, V, X = st
        0 <= n <= 3 && return I ^ n
        n == 4 && return I * V
        5 <= n <= 8 && return V * I ^ (n - 5)
        n == 9 && return I * X
    end
    return join(reverse!([get_num(n, table[i]) for (i, n) in enumerate(digits(num))]))
end

## @lc code=end

## @lc test=start
@testset "12.integer-to-roman.jl" begin
    @test all(roman_to_integer(int_to_roman(i)) == i for i in 1:3999)
end
## @lc test=end

## @lc info=start
# link: [solution to 12]()
## @lc info=end
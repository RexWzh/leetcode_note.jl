# ---
# title: 20. Valid Parentheses
# id: problem20
# author: zhwang
# date: 2022-02-17
# difficulty: Easy
# categories: String, Stack
# link: <https://leetcode.com/problems/valid-parentheses/description/>
# hidden: true
# ---
# 
# Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`,
# `'['` and `']'`, determine if the input string is valid.
# 
# An input string is valid if:
# 
#   1. Open brackets must be closed by the same type of brackets.
#   2. Open brackets must be closed in the correct order.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: s = "()"
#     Output: true
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: s = "()[]{}"
#     Output: true
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: s = "(]"
#     Output: false
#     
# 
# **Example 4:**
# 
#     
#     
#     Input: s = "([)]"
#     Output: false
#     
# 
# **Example 5:**
# 
#     
#     
#     Input: s = "{[]}"
#     Output: true
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= s.length <= 104`
#   * `s` consists of parentheses only `'()[]{}'`.
# 
# 
## @lc code=start
using LeetCode

function is_valid_parentheses(s::String)::Bool
    unclose, left_side = Char[], Dict{Char,Char}(')' => '(', ']' => '[', '}' => '{')
    for i in s
        if i in "([{"
            push!(unclose, i)
        else
            (isempty(unclose) || left_side[i] != unclose[end]) && return false
            pop!(unclose)
        end
    end
    return isempty(unclose)
end

## @lc code=end

## @lc test=start
@testset "20.valid-parentheses.jl" begin
    @test is_valid_parentheses("()") == true
    @test is_valid_parentheses("()[]{}") == true
    @test is_valid_parentheses("(]") == false
    @test is_valid_parentheses("([)]") == false
    @test is_valid_parentheses("{[]}") == true
end
## @lc test=end

## @lc info=start
# link: [solution to 20](https://leetcode-cn.com/problems/valid-parentheses/solution/20-you-xiao-de-gua-hao-chu-ru-zhan-by-re-4axv/)
## @lc info=end
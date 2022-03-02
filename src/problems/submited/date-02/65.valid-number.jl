# ---
# title: 65. Valid Number
# id: problem65
# author: zhwang
# date: 2022-02-15
# difficulty: Hard
# categories: Math, String
# link: <https://leetcode.com/problems/valid-number/description/>
# hidden: true
# ---
# 
# Validate if a given string can be interpreted as a decimal number.
# 
# Some examples:  
# `"0"` => `true`  
# `" 0.1 "` => `true`  
# `"abc"` => `false`  
# `"1 a"` => `false`  
# `"2e10"` => `true`  
# `" -90e3   "` => `true`  
# `" 1e"` => `false`  
# `"e3"` => `false`  
# `" 6e-1"` => `true`  
# `" 99e2.5 "` => `false`  
# `"53.5e93"` => `true`  
# `" --6 "` => `false`  
# `"-+3"` => `false`  
# `"95a54e53"` => `false`
# 
# **Note:** It is intended for the problem statement to be ambiguous. It would
# be best if you gathered all requirements up front before implementing one.
# However, here is a list of characters that can be in a valid decimal number:
# 
#   * Numbers 0-9
#   * Exponent - "e"
#   * Positive/negative sign - "+"/"-"
#   * Decimal point - "."
# 
# Of course, the context of these characters also matters in the input.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: s = "0"
#     Output: true
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: s = "3"
#     Output: true
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= s.length <= 20`
#   * `s` consists of only English letters, digits, space `' '`, plus `'+'`, minus `'-'`, or dot `'.'`.
# 
# 
## @lc code=start
using LeetCode

## Automation
function is_number_65(s::String)::Bool
    ## initialize state
    state = "start"
    ## recognize input state
    function switch(c::Char)::Int
        isdigit(c) && return 1
        c == '.' && return 2
        c in "eE" && return 3
        c in "+-" && return 4
        return 5
    end
    state_shift = Dict{String,Vector{String}}(
        "start" =>[ "num" , "dot_part" , "error" , "sign" ,  "error" ],
        "num"=> [ "num" , "dot_num" , "e_part" , "error" , "error"],
        "dot_num" =>[ "dot_num" , "error" , "e_part" , "error" , "error"],
        "e_num" =>[ "e_num" , "error" , "error", "error" , "error"],
        "sign" =>[ "num" , "dot_part" , "error", "error" , "error"],
        "dot_part" =>[ "dot_num", "error" , "error" , "error" , "error"],
        "e_part" => ["e_num" , "error" , "error" , "e_sign" , "error"],
        "e_sign"=>[ "e_num" , "error" , "error" , "error" , "error"])
    for c in s
        state = state_shift[state][switch(c)]
        state == "error" && return false
    end
    return state in ["num", "dot_num","e_num"]
end
## @lc code=end

## @lc test=start
@testset "65.valid-number.jl" begin
    true_data = ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"]
    false_data = ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53", "3.5e+3.5e+3.5"]
    @test all(is_number_65(s) for s in true_data)
    @test !any(is_number_65(s) for s in false_data)
end
## @lc test=end

## @lc info=start
# link: [solution to 65](https://leetcode-cn.com/problems/valid-number/solution/65-zi-dong-ji-chao-xiang-xi-guo-cheng-hu-5r93/)
## @lc info=end
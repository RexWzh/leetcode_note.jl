# ---
# title: 917. Reverse Only Letters
# id: problem917
# author: zhwang
# date: 2022-02-23
# difficulty: Easy
# categories: String
# link: <https://leetcode.com/problems/reverse-only-letters/description/>
# hidden: true
# ---
# 
# Given a string `S`, return the "reversed" string where all characters that are
# not a letter stay in the same place, and all letters reverse their positions.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: "ab-cd"
#     Output: "dc-ba"
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: "a-bC-dEf-ghIj"
#     Output: "j-Ih-gfE-dCba"
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: "Test1ng-Leet=code-Q!"
#     Output: "Qedo1ct-eeLg=ntse-T!"
#     
# 
# 
# 
# **Note:**
# 
#   1. `S.length <= 100`
#   2. `33 <= S[i].ASCIIcode <= 122` 
#   3. `S` doesn't contain `\` or `"`
# 
# 
## @lc code=start
using LeetCode

function reverse_only_letters(s::String)::String
    right, res = length(s) + 1, Char[]
    for i in s
        if isletter(i)
            right = findlast(isletter, @view s[1:right - 1])
            push!(res, s[right])
        else
            push!(res, i)
        end
    end
    join(res)
end

## @lc code=end
## @lc test=start
@testset "917.reverse-only-letters.jl" begin
    @test reverse_only_letters("ab-cd") == "dc-ba"
    @test reverse_only_letters("a-bC-dEf-ghIj") == "j-Ih-gfE-dCba"
    @test reverse_only_letters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!"
    @test reverse_only_letters("7_28]") == "7_28]"
end
## @lc test=end

## @lc info=start
# link: [solution to 917](https://leetcode-cn.com/problems/reverse-only-letters/solution/python-shuang-zhi-zhen-by-rex-rs-6wmf/)
## @lc info=end

# ---
# title: 567. Permutation in String
# id: problem567
# author: zhwang
# date: 2022-02-17
# difficulty: Medium
# categories: Two Pointers, Sliding Window
# link: <https://leetcode.com/problems/permutation-in-string/description/>
# hidden: true
# ---
# 
# Given two strings **s1** and **s2** , write a function to return true if
# **s2** contains the permutation of **s1**. In other words, one of the first
# string's permutations is the **substring** of the second string.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: s1 = "ab" s2 = "eidbaooo"
#     Output: True
#     Explanation: s2 contains one permutation of s1 ("ba").
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: s1= "ab" s2 = "eidboaoo"
#     Output: False
#     
# 
# 
# 
# **Constraints:**
# 
#   * The input strings only contain lower case letters.
#   * The length of both given strings is in range [1, 10,000].
# 
# 
## @lc code=start
using LeetCode

using DataStructures
function check_inclusion(s1::String, s2::String)::Bool
    equal2c1(c::Accumulator) = all(c[i]==c1[i] for i in keys(c1))
    c1, n1, n2 = counter(s1), length(s1), length(s2)
    n2 < n1 && return false
    c2 = counter(@view(s2[1:n1]))
    equal2c1(c2) && return true 
    for (i, j) in zip(@view(s2[1:(n2 - n1)]), @view(s2[n1 + 1: n2]))
        c2[i] -= 1
        c2[j] += 1
        equal2c1(c2) && return true 
    end
    false
end
## @lc code=end

## @lc test=start
@testset "567.permutation-in-string.jl" begin
    @test check_inclusion("abc", "ccccbbbbaaaa") == false
    @test check_inclusion("ab", "eidbaooo") == true
    @test check_inclusion("ab", "eidboaoo") == false
    @test check_inclusion("hello", "ooolleoooleh") == false
    @test check_inclusion("adc", "dcda") == true
end
## @lc test=end

## @lc info=start
# link: [solution to 567](https://leetcode-cn.com/problems/permutation-in-string/solution/567-zi-fu-chuan-de-pai-lie-by-rex-rs-ac0v/)
## @lc info=end
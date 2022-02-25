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

## Double Pointers
function check_inclusion(s1::String, s2::String)::Bool
    count1, count2 = counter(s1), DefaultDict{Char, Int}(0)
    start, left = true, 1
    for (i, c) in enumerate(s2)
        if !haskey(count1, c)
            start, count2 = true, DefaultDict{Char, Int}(0)
        elseif count2[c] == count1[c]
            pos = findfirst(c, @view s2[left:i - 1])
            for i in 1:pos
                count2[s2[left + i - 1]] -= 1
            end
            left += pos
        else
            start && (start = false; left = i)
            count2[c] += 1
            all(count1[key] == count2[key] for key in keys(count1)) && return true
        end
    end
    return false
end
## @lc code=end


## @lc test=start
@testset "567.permutation-in-string.jl" begin
    @test check_inclusion("abc", "ccccbbbbaaaa") == false
    @test check_inclusion("ab", "eidbaooo") == true
    @test check_inclusion("ab", "eidboaoo") == false
    @test check_inclusion("hello", "ooolleoooleh") == false
end
## @lc test=end

## @lc info=start
# link: [solution to 567](https://leetcode-cn.com/problems/permutation-in-string/solution/567-zi-fu-chuan-de-pai-lie-by-rex-rs-ac0v/)
## @lc info=end
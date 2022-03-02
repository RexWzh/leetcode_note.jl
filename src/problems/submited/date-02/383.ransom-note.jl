# ---
# title: 383. Ransom Note
# id: problem383
# author: zhwang
# date: 2022-02-15
# difficulty: Easy
# categories: String
# link: <https://leetcode.com/problems/ransom-note/description/>
# hidden: true
# ---
# 
# Given an arbitrary ransom note string and another string containing letters
# from all the magazines, write a function that will return true if the ransom
# note can be constructed from the magazines ; otherwise, it will return false.
# 
# Each letter in the magazine string can only be used once in your ransom note.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: ransomNote = "a", magazine = "b"
#     Output: false
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: ransomNote = "aa", magazine = "ab"
#     Output: false
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: ransomNote = "aa", magazine = "aab"
#     Output: true
#     
# 
# 
# 
# **Constraints:**
# 
#   * You may assume that both strings contain only lowercase letters.
# 
# 
## @lc code=start
using LeetCode

function  can_construct(ransom_note::String, magazine::String)::Bool
    words = Dict{Char,Int}(s => 0 for s in 'a':'z')
    for i in magazine
        words[i] += 1
    end
    for i in ransom_note
        words[i] == 0 && return false
        words[i] -= 1
    end
    true
end
## @lc code=end

## @lc test=start
@testset "383.ransom-note.jl" begin
    @test can_construct("a", "b") == false
    @test can_construct("aa", "ab") == false
    @test can_construct("aa", "aba") == true
end
## @lc test=end

## @lc info=start
# link: [solution to 383](https://leetcode-cn.com/problems/ransom-note/solution/383-shu-jin-xin-ji-shu-pan-du-by-rex-rs-o2el/)
## @lc info=end
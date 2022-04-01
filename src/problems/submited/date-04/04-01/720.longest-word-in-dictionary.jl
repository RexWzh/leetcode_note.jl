# ---
# title: 720. Longest Word in Dictionary
# id: problem720
# author: zhwang
# date: 2022-03-17
# difficulty: Easy
# categories: Hash Table, Trie
# link: <https://leetcode.com/problems/longest-word-in-dictionary/description/>
# hidden: true
# ---
# 
# Given a list of strings `words` representing an English Dictionary, find the
# longest word in `words` that can be built one character at a time by other
# words in `words`. If there is more than one possible answer, return the
# longest word with the smallest lexicographical order.
# 
# If there is no answer, return the empty string.
# 
# **Example 1:**  
# 
#     
#     
#     Input: 
#     words = ["w","wo","wor","worl", "world"]
#     Output: "world"
#     Explanation: 
#     The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
#     
# 
# **Example 2:**  
# 
#     
#     
#     Input: 
#     words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
#     Output: "apple"
#     Explanation: 
#     Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".
#     
# 
# **Note:**
# 
# * All the strings in the input will only contain lowercase letters.
# * The length of `words` will be in the range `[1, 1000]`.
# * The length of `words[i]` will be in the range `[1, 30]`.
# 
# 
## @lc code=start
using LeetCode

## use Trie
longest_common_word(words::Vector{String}) = longest_common_word!(words)
function longest_common_word!(words::Vector{String})::String
    root, res = Dict{Char, Dict}(), ""
    for word in sort!(words, by=length)
        node, n = root, length(word)
        for (i, c) in enumerate(word)
            if haskey(node, c)
                node = node[c]
            elseif i == n
                node[c] = Dict{Char, Dict}() ## add new child
                res = word
            else
                break
            end
        end
    end
    res    
end

## @lc code=end

## @lc test=start
@testset "720.longest-word-in-dictionary.jl" begin
    @test longest_common_word(["w","wo","wor","worl", "world"]) == "world"
    @test longest_common_word(["a", "banana", "app", "appl", "ap", "apply", "apple"]) ∈ ("apply", "apple")
end
## @lc test=end

## @lc info=start
# link: [solution to 720]()
## @lc info=end
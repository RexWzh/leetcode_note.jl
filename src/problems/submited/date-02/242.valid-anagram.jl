# ---
# title: 242. Valid Anagram
# id: problem242
# author: zhwang
# date: 2022-02-15
# difficulty: Easy
# categories: Hash Table, Sort
# link: <https://leetcode.com/problems/valid-anagram/description/>
# hidden: true
# ---
# 
# Given two strings _s_ and _t  _, write a function to determine if _t_ is an
# anagram of _s_.
# 
# **Example 1:**
# 
#     
#     
#     Input: _s_ = "anagram", _t_ = "nagaram"
#     Output: true
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: _s_ = "rat", _t_ = "car"
#     Output: false
#     
# 
# **Note:**  
# You may assume the string contains only lowercase alphabets.
# 
# **Follow up:**  
# What if the inputs contain unicode characters? How would you adapt your
# solution to such case?
# 
# 
## @lc code=start
using LeetCode

function is_anagram(s::String, t::String)::Bool
    length(s) != length(t) && return false
    count_s, count_t = Dict{Char, Int}(i => 0 for i in 'a':'z'), Dict{Char, Int}(i => 0 for i in 'a':'z')
    for i in eachindex(s)
        count_s[s[i]] += 1
        count_t[t[i]] += 1
    end
    return all(count_s[c] == count_t[c] for c in 'a':'z')
end

## @lc code=end

## @lc test=start
@testset "242.valid-anagram.jl" begin
    @test is_anagram("nagaram", "anagram") == true
    @test is_anagram("rat", "car") == false
end
## @lc test=end


## @lc info=start
# link: [solution to 242](https://leetcode-cn.com/problems/valid-anagram/solution/242-you-xiao-de-zi-mu-yi-wei-ci-julia-py-czte/)
## @lc info=end
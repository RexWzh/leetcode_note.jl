# ---
# title: 217. Contains Duplicate
# id: problem217
# author: zhwang
# date: 2022-02-10
# difficulty: Easy
# categories: Array, Hash Table
# link: <https://leetcode.com/problems/contains-duplicate/description/>
# hidden: true
# ---
# 
# Given an array of integers, find if the array contains any duplicates.
# 
# Your function should return true if any value appears at least twice in the
# array, and it should return false if every element is distinct.
# 
# **Example 1:**
# 
#     
#     
#     Input: [1,2,3,1]
#     Output: true
# 
# **Example 2:**
# 
#     
#     
#     Input: [1,2,3,4]
#     Output: false
# 
# **Example 3:**
# 
#     
#     
#     Input: [1,1,1,3,3,4,3,2,4,2]
#     Output: true
# 
# 
## @lc code=start
using LeetCode

function contains_duplicate(nums::Vector{Int})::Bool
    hash_table = Int[]
    for i in nums
        if !(i in hash_table)
            push!(hash_table, i)
        else
            return true
        end
    end
    false
end
## @lc code=end

## @lc test=start
@testset "217.contains-duplicate.jl" begin
    @test contains_duplicate([1, 2, 3, 1]) == true
    @test contains_duplicate([1, 2, 3, 4]) == false
    @test contains_duplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) == true
end
## @lc test=end

## @lc info=start
# link: [solution to 217](https://leetcode-cn.com/problems/contains-duplicate/solution/217-cun-zai-zhong-fu-yuan-su-by-rex-rs-ngd7/)
## @lc info=end
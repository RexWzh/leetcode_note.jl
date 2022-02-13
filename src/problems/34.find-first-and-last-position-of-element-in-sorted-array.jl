# ---
# title: 34. Find First and Last Position of Element in Sorted Array
# id: problem34
# author: zhwang
# date: 2022-02-13
# difficulty: Medium
# categories: Array, Binary Search
# link: <https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/>
# hidden: true
# ---
# 
# Given an array of integers `nums` sorted in ascending order, find the starting
# and ending position of a given `target` value.
# 
# If `target` is not found in the array, return `[-1, -1]`.
# 
# **Follow up:**  Could you write an algorithm with `O(log n)` runtime
# complexity?
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: nums = [5,7,7,8,8,10], target = 8
#     Output: [3,4]
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: nums = [5,7,7,8,8,10], target = 6
#     Output: [-1,-1]
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: nums = [], target = 0
#     Output: [-1,-1]
#     
# 
# 
# 
# **Constraints:**
# 
#   * `0 <= nums.length <= 105`
#   * `-109 <= nums[i] <= 109`
#   * `nums` is a non-decreasing array.
#   * `-109 <= target <= 109`
# 
# 
## @lc code=start
using LeetCode

function search_range(nums::Vector{Int}, target::Int)::Vector{Int}
    function get_left_border(target)
        left, right = 1, n
        while left <= right
            mid = (left + right) >> 1
            if nums[mid] >= target
                right = mid - 1
            else
                left = mid + 1
            end
        end
        left
    end
    n = length(nums)
    left_border = get_left_border(target)
    (left_border > n || nums[left_border] != target) && return [-1, -1]
    return [left_border - 1, get_left_border(target + 1) - 2]
end
## @lc code=end

## @lc test=start
@testset "34.find-first-and-last-position-of-element-in-sorted-array.jl" begin
    @test search_range([5,7,7,8,8,10], 8) == [3, 4]
    @test search_range([5,7,7,8,8,10], 6) == [-1, -1]
    @test search_range(Int[], 0) == [-1, -1]
    @test search_range([1,1,1,2,3,3,4,4], 1) == [0, 2]
end
## @lc test=end

## @lc info=start
# link: [solution to 34](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/solution/34-zai-pai-xu-shu-zu-zhong-cha-zhao-yuan-qnr9/)
## @lc info=end
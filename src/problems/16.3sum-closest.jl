# ---
# title: 16. 3Sum Closest
# id: problem16
# author: zhwang
# date: 2022-03-16
# difficulty: Medium
# categories: Array, Two Pointers
# link: <https://leetcode.com/problems/3sum-closest/description/>
# hidden: true
# ---
# 
# Given an array `nums` of _n_ integers and an integer `target`, find three
# integers in `nums` such that the sum is closest to `target`. Return the sum of
# the three integers. You may assume that each input would have exactly one
# solution.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: nums = [-1,2,1,-4], target = 1
#     Output: 2
#     Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
#     
# 
# 
# 
# **Constraints:**
# 
#   * `3 <= nums.length <= 10^3`
#   * `-10^3 <= nums[i] <= 10^3`
#   * `-10^4 <= target <= 10^4`
# 
# 
## @lc code=start
using LeetCode

three_sum_closest(nums::Vector{Int}, target::Int) = three_sum_closest!(copy(nums), target)
function three_sum_closest!(nums::Vector{Int}, target::Int)::Int
    sort!(nums)
    mindiff, n, res = Inf, length(nums), 0
    for (i, first) in enumerate(nums)
        i > 1 && nums[i - 1] == first && continue
        left, right, newtarget = i + 1, n, target - first
        while left < right
            newsum = nums[left] + nums[right]
            newdiff = abs(newsum - newtarget)
            if newdiff < mindiff ## updates minimal difference
                mindiff, res = newdiff, newsum + first
                newdiff == 0 && return target
            elseif newsum > newtarget
                right -= 1
            else
                left += 1
            end
        end
    end
    res
end
## @lc code=end

## @lc test=start
@testset "16.3sum-closest.jl" begin
    @test three_sum_closest([-1,2,1,-4], 1) == 2
    @test three_sum_closest([0, 0, 0], 1) == 0
end
## @lc test=end

## @lc info=start
# link: [solution to 16]()
## @lc info=end
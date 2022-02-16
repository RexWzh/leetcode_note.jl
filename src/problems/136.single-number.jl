# ---
# title: 136. Single Number
# id: problem136
# author: zhwang
# date: 2022-02-15
# difficulty: Easy
# categories: Hash Table, Bit Manipulation
# link: <https://leetcode.com/problems/single-number/description/>
# hidden: true
# ---
# 
# Given a **non-empty**  array of integers `nums`, every element appears _twice_
# except for one. Find that single one.
# 
# **Follow up:**  Could you implement a solution with a linear runtime
# complexity and without using extra memory?
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: nums = [2,2,1]
#     Output: 1
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: nums = [4,1,2,1,2]
#     Output: 4
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: nums = [1]
#     Output: 1
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= nums.length <= 3 * 104`
#   * `-3 * 104 <= nums[i] <= 3 * 104`
#   * Each element in the array appears twice except for one element which appears only once.
# 
# 
## @lc code=start
using LeetCode

function single_number_136(nums::Vector{Int})::Int
    a = 0
    for i in nums
        a ⊻= i
    end
    a
end
## @lc code=end

## @lc test=start
@testset "136.single-number.jl" begin
    @test single_number_136([4,1,2,1,2]) == 4
    @test single_number_136([2, 2, 1]) == 1
end
## @lc test=end


## @lc info=start
# link: [solution to 136](https://leetcode-cn.com/problems/single-number/solution/136-zhi-chu-xian-yi-ci-de-shu-zi-yi-huo-ukdwx/)
## @lc info=end
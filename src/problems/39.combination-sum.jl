# ---
# title: 39. Combination Sum
# id: problem39
# author: zhwang
# date: 2022-02-17
# difficulty: Medium
# categories: Array, Backtracking
# link: <https://leetcode.com/problems/combination-sum/description/>
# hidden: true
# ---
# 
# Given an array of **distinct** integers `candidates` and a target integer
# `target`, return _a list of all **unique combinations** of _`candidates`
# _where the chosen numbers sum to_`target` _._ You may return the combinations
# in **any order**.
# 
# The **same** number may be chosen from `candidates` an **unlimited number of
# times**. Two combinations are unique if the frequency of at least one of the
# chosen numbers is different.
# 
# It is **guaranteed** that the number of unique combinations that sum up to
# `target` is less than `150` combinations for the given input.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: candidates = [2,3,6,7], target = 7
#     Output: [[2,2,3],[7]]
#     Explanation:
#     2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
#     7 is a candidate, and 7 = 7.
#     These are the only two combinations.
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: candidates = [2,3,5], target = 8
#     Output: [[2,2,2,2],[2,3,3],[3,5]]
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: candidates = [2], target = 1
#     Output: []
#     
# 
# **Example 4:**
# 
#     
#     
#     Input: candidates = [1], target = 1
#     Output: [[1]]
#     
# 
# **Example 5:**
# 
#     
#     
#     Input: candidates = [1], target = 2
#     Output: [[1,1]]
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= candidates.length <= 30`
#   * `1 <= candidates[i] <= 200`
#   * All elements of `candidates` are **distinct**.
#   * `1 <= target <= 500`
# 
# 
## @lc code=start
using LeetCode


function combination_sum_39(nums::Union{Vector{Int},SubArray}, target::Int)::Vector{Vector{Int}}
    target == 0 && return [Int[]]
    isempty(nums) && return Vector{Int}[]
    res, num = Vector{Int}[], nums[end]
    for i in 0:target ÷ num
        new = [append!(vec, fill(num, i)) for vec in sorted_combination_sum(@view(nums[1:end-1]), target - i * num)]
        res = cat(res, new; dims = 1)
    end
    return res
end
## @lc code=end
## @lc test=start
@testset "39.combination-sum.jl" begin
    @test combination_sum_39([2,3,6,7], 7) == [[2,2,3],[7]]
    @test combination_sum_39([2,3,5], 8) == [[2,2,2,2],[2,3,3],[3,5]]
    @test combination_sum_39([2], 1) == Vector{Int}[]
end
## @lc test=end

## @lc info=start
# link: [solution to 39](https://leetcode-cn.com/problems/combination-sum/solution/39-zu-he-zong-he-by-rex-rs-uaz0/)
## @lc info=end

# ---
# title: 112. Path Sum
# id: problem112
# author: zhwang
# date: 2022-02-21
# difficulty: Easy
# categories: Tree, Depth-first Search
# link: <https://leetcode.com/problems/path-sum/description/>
# hidden: true
# ---
# 
# Given a binary tree and a sum, determine if the tree has a root-to-leaf path
# such that adding up all the values along the path equals the given sum.
# 
# **Note:**  A leaf is a node with no children.
# 
# **Example:**
# 
# Given the below binary tree and `sum = 22`,
# 
#     
#     
#           **5**
#          **/** \
#         **4**   8
#        **/**   / \
#       **11**  13  4
#      /  **\**      \
#     7    **2**      1
#     
# 
# return true, as there exist a root-to-leaf path `5->4->11->2` which sum is 22.
# 
# 
## @lc code=start
using LeetCode

has_path_sum(::Nothing, ::Int) = false
function has_path_sum(root::TreeNode, target_sum::Int)::Bool
    root.val == target_sum && isnothing(root.left) && isnothing(root.right) && return true
    return has_path_sum(root.left, target_sum -= root.val) || has_path_sum(root.right, target_sum)
end

## @lc code=end
## @lc test=start
@testset "112.path-sum.jl" begin
    @test has_path_sum(TreeNode{Int}([5,4,8,11,nothing,13,4,7,2,nothing,nothing,nothing,1]), 22) == true
    @test has_path_sum(TreeNode{Int}([1,2]), 1) == false
    @test has_path_sum(nothing, 0) == false
end
## @lc test=end

## @lc info=start
# link: [solution to 112](https://leetcode-cn.com/problems/path-sum/solution/112-lu-jing-zong-he-by-rex-rs-qppi/)
## @lc info=end
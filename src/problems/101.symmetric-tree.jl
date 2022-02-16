# ---
# title: 101. Symmetric Tree
# id: problem101
# author: Tian Jun
# date: 2020-10-31
# difficulty: Easy
# categories: Tree, Depth-first Search, Breadth-first Search
# link: <https://leetcode.com/problems/symmetric-tree/description/>
# hidden: true
# ---
# 
# Given a binary tree, check whether it is a mirror of itself (ie, symmetric
# around its center).
# 
# For example, this binary tree `[1,2,2,3,4,4,3]` is symmetric:
# 
#     
#     
#         1
#        / \
#       2   2
#      / \ / \
#     3  4 4  3
#     
# 
# 
# 
# But the following `[1,2,2,null,3,null,3]` is not:
# 
#     
#     
#         1
#        / \
#       2   2
#        \   \
#        3    3
#     
# 
# 
# 
# **Follow up:** Solve it both recursively and iteratively.
# 
# 
## @lc code=start
using LeetCode

is_symmetric_tree(root::TreeNode{Int})::Bool = is_mirror_tree(root.left, root.right)
function is_mirror_tree(t1::Union{TreeNode{Int}, Nothing}, t2::Union{TreeNode{Int}, Nothing})::Bool
    isnothing(t1) && isnothing(t2) && return true
    (isnothing(t1) || isnothing(t2)) && return false
    t1.val != t2.val && return false
    return is_mirror_tree(t1.left, t2.right) && is_mirror_tree(t1.right, t2.left)
end
## @lc code=end

## @lc test=start
@testset "101.symmetric-tree.jl" begin
    @test is_symmetric_tree(TreeNode{Int}([1,2,2,3,4,4,3])) == true
    @test is_symmetric_tree(TreeNode{Int}([1,2,2,nothing,3,nothing,3])) == false
end
## @lc test=end


## @lc info=start
# link: [solution to 101](https://leetcode-cn.com/problems/symmetric-tree/solution/101-dui-cheng-er-cha-shu-by-rex-rs-6kdb/)
## @lc info=end
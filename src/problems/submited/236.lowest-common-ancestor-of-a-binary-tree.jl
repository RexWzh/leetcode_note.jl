# ---
# title: 236. Lowest Common Ancestor of a Binary Tree
# id: problem236
# author: zhwang
# date: 2022-02-10
# difficulty: Medium
# categories: Tree
# link: <https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/>
# hidden: true
# ---
# 
# Given a binary tree, find the lowest common ancestor (LCA) of two given nodes
# in the tree.
# 
# According to the [definition of LCA on
# Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor): "The lowest
# common ancestor is defined between two nodes p and q as the lowest node in T
# that has both p and q as descendants (where we allow **a node to be a
# descendant of itself** )."
# 
# 
# 
# **Example 1:**
# 
# ![](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
# 
#     
#     
#     Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
#     Output: 3
#     Explanation: The LCA of nodes 5 and 1 is 3.
#     
# 
# **Example 2:**
# 
# ![](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
# 
#     
#     
#     Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
#     Output: 5
#     Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: root = [1,2], p = 1, q = 2
#     Output: 1
#     
# 
# 
# 
# **Constraints:**
# 
#   * The number of nodes in the tree is in the range `[2, 105]`.
#   * `-109 <= Node.val <= 109`
#   * All `Node.val` are **unique**.
#   * `p != q`
#   * `p` and `q` will exist in the tree.
# 
# 
## @lc code=start
using LeetCode

function loweset_common_ancestor_236(root::TreeNode{Int}, p::TreeNode{Int}, q::TreeNode{Int})::TreeNode{Int}
    function dfs(node::Union{TreeNode{Int}, Nothing})
        (isnothing(node) || node == p || node == q) && return node
        left, right = dfs(node.left), dfs(node.right)
        isnothing(left) && isnothing(right) && return nothing
        !isnothing(left) && !isnothing(right) && return node
        return !isnothing(left) ? left : right
    end
    dfs(root)
end
## @lc code=end

## @lc test=start
@testset "236.lowest-common-ancestor-of-a-binary-tree.jl" begin
    root = TreeNode{Int}([3,5,1,6,2,0,8,nothing,nothing,7,4])
    @test loweset_common_ancestor_236(root, root.left, root.left.right.right) == root.left
    @test loweset_common_ancestor_236(root, root.left, root.right) == root
    @test loweset_common_ancestor_236(TreeNode{Int}([1,2]), TreeNode{Int}([1,2]), TreeNode(2)) == TreeNode{Int}([1,2])
end
## @lc test=end

## @lc info=start
# link: [solution to 236](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/solution/236-er-cha-shu-de-zui-jin-gong-gong-zu-x-ejib/)
## @lc info=end
# ---
# title: 144. Binary Tree Preorder Traversal
# id: problem144
# author: zhwang
# date: 2022-02-19
# difficulty: Medium
# categories: Stack, Tree
# link: <https://leetcode.com/problems/binary-tree-preorder-traversal/description/>
# hidden: true
# ---
# 
# Given the `root` of a binary tree, return _the preorder traversal of its nodes
# ' values_.
# 
# 
# 
# **Example 1:**
# 
# ![](https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg)
# 
#     
#     
#     Input: root = [1,null,2,3]
#     Output: [1,2,3]
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: root = []
#     Output: []
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: root = [1]
#     Output: [1]
#     
# 
# **Example 4:**
# 
# ![](https://assets.leetcode.com/uploads/2020/09/15/inorder_5.jpg)
# 
#     
#     
#     Input: root = [1,2]
#     Output: [1,2]
#     
# 
# **Example 5:**
# 
# ![](https://assets.leetcode.com/uploads/2020/09/15/inorder_4.jpg)
# 
#     
#     
#     Input: root = [1,null,2]
#     Output: [1,2]
#     
# 
# 
# 
# **Constraints:**
# 
#   * The number of nodes in the tree is in the range `[0, 100]`.
#   * `-100 <= Node.val <= 100`
# 
# 
# 
# **Follow up:**
# 
# Recursive solution is trivial, could you do it iteratively?
# 
# 
# 
# 
## @lc code=start
using LeetCode
preorder_traversal(::Nothing) = Int[]
function preorder_traversal(root::TreeNode)::Vector{Int}
    res, stack = Int[], [(root, -1)] ## -1 for left subtree, 1 for right subtree
    while !isempty(stack)
        cur = last(stack)
        if last(cur) == -1 ## search left subtree
            stack[end] = (cur[1], 1)
            push!(res, cur[1].val) ## key part: push value here (preorder)
            !isnothing(cur[1].left) && push!(stack, (cur[1].left, -1))
        elseif last(cur) == 1 ## search right subtree
            stack[end] = (cur[1], 0)
            !isnothing(cur[1].right) && push!(stack, (cur[1].right, -1))
        else
            cur = pop!(stack)
        end
    end
    return res
end

## @lc code=end
## @lc test=start
@testset "94.binary-tree-inorder-traversal.jl" begin
    @test preorder_traversal(TreeNode{Int}([1])) == [1]
    @test preorder_traversal(nothing) == Int[]
    @test preorder_traversal(TreeNode{Int}([1,nothing,2,3])) == [1,2,3]
    @test preorder_traversal(TreeNode{Int}([1, 2, 3, 4, 5, 6])) == [1,2,4,5,3,6]
    @test preorder_traversal(TreeNode{Int}([3,9,4,nothing, nothing, 5,7])) == [3,9,4,5,7]
end
## @lc test=end

## @lc info=start
# link: [solution to 144](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/144-er-cha-shu-de-qian-xu-bian-li-by-rex-frkw/)
## @lc info=end

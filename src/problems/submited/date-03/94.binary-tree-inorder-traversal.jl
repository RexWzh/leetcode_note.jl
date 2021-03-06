# ---
# title: 94. Binary Tree Inorder Traversal
# id: problem94
# author: zhwang
# date: 2022-02-19
# difficulty: Medium
# categories: Hash Table, Stack, Tree
# link: <https://leetcode.com/problems/binary-tree-inorder-traversal/description/>
# hidden: true
# ---
# 
# Given the `root` of a binary tree, return _the inorder traversal of its nodes
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
#     Output: [1,3,2]
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
#     Output: [2,1]
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

inorder_traversal(::Nothing) = Int[]
function inorder_traversal(root::TreeNode)::Vector{Int}
    res, stack = Int[], []
    while !isempty(stack) || !isnothing(root)
        while !isnothing(root)
            push!(stack, root)
            root = root.left
        end
        root = pop!(stack) 
        push!(res, root.val) ## inorder search
        root = root.right
    end
    res
end

##### code template for inorder traversal and preorder traversal #####
## traversal(::Nothing) = Int[]
## function traversal(root::TreeNode)::Vector{Int}
##     res, stack = Int[], []
##     while !isempty(stack) || !isnothing(root)
##         while !isnothing(root)
##             push!(stack, root)
##             ## preorder traversal: put codes here
##             root = root.left
##         end
##         root = pop!(stack) 
##         ## inorder traversal: put codes here
##         root = root.right
##     end
##     res
## end

## @lc code=end
## @lc test=start
@testset "94.binary-tree-inorder-traversal.jl" begin
    @test inorder_traversal(TreeNode{Int}([1])) == [1]
    @test inorder_traversal(nothing) == Int[]
    @test inorder_traversal(TreeNode{Int}([1,nothing,2,3])) == [1,3,2]
    @test inorder_traversal(TreeNode{Int}([1, 2, 3, 4, 5, 6])) == [4,2,5,1,6,3]
    @test inorder_traversal(TreeNode{Int}([3,9,4,nothing, nothing, 5,7])) == [9,3,5,4,7]
end
## @lc test=end


## @lc info=start
# link: [solution to 94](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/144-er-cha-shu-de-qian-xu-bian-li-by-rex-frkw/)
## @lc info=end

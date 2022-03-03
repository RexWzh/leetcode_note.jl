# ---
# title: 105. Construct Binary Tree from Preorder and Inorder Traversal
# id: problem105
# author: zhwang
# date: 2022-03-02
# difficulty: Medium
# categories: Array, Tree, Depth-first Search
# link: <https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/>
# hidden: true
# ---
# 
# Given preorder and inorder traversal of a tree, construct the binary tree.
# 
# **Note:**  
# You may assume that duplicates do not exist in the tree.
# 
# For example, given
# 
#     
#     
#     preorder = [3,9,20,15,7]
#     inorder = [9,3,15,20,7]
# 
# Return the following binary tree:
# 
#     
#     
#         3
#        / \
#       9  20
#         /  \
#        15   7
# 
# 
## @lc code=start
using LeetCode

## using @view macro
function build_tree_105(preorder::AbstractArray, inorder::AbstractArray)::TreeNode
    root = TreeNode(first(preorder))
    pos = findfirst(==(root.val), inorder)
    pos != 1 && (root.left = build_tree_105(@view(preorder[2:pos]), @view(inorder[1:(pos - 1)])))
    pos != length(preorder) &&
     (root.right = build_tree_105(@view(preorder[(pos + 1):end]), @view(inorder[(pos + 1):end])))
    root
end
## @lc code=end

## @lc test=start
@testset "105.Construct-Binary-Tree-from-Preorder-and-Inorder-Traversal.jl" begin
    @test build_tree_105([3,9,20,15,7], [9,3,15,20,7]) == TreeNode{Int}([3,9,20,nothing,nothing,15,7])
    @test build_tree_105([-1], [-1]) == TreeNode(-1)
    @test build_tree_105([3, 9, 8, 5, 4, 10, 20, 15, 7], [4, 5, 8, 10, 9, 3, 15, 20, 7]) == TreeNode{Int}([3,9,20,8,nothing,15,7,5,10,nothing,nothing,nothing,nothing,4])
end
## @lc test=end


## @lc info=start
# link: [solution to 105](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solution/105-cong-qian-xu-yu-zhong-xu-bian-li-xu-7lzvc/)
## @lc info=end
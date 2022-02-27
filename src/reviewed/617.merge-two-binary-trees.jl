# ---
# title: 617. Merge Two Binary Trees
# id: problem617
# author: zhwang
# date: 2022-02-19
# difficulty: Easy
# categories: Tree
# link: <https://leetcode.com/problems/merge-two-binary-trees/description/>
# hidden: true
# ---
# 
# Given two binary trees and imagine that when you put one of them to cover the
# other, some nodes of the two trees are overlapped while the others are not.
# 
# You need to merge them into a new binary tree. The merge rule is that if two
# nodes overlap, then sum node values up as the new value of the merged node.
# Otherwise, the NOT null node will be used as the node of new tree.
# 
# **Example 1:**
# 
#     
#     
#     Input: 
#     	Tree 1                     Tree 2                  
#               1                         2                             
#              / \                       / \                            
#             3   2                     1   3                        
#            /                           \   \                      
#           5                             4   7                  
#     Output: 
#     Merged tree:
#     	     3
#     	    / \
#     	   4   5
#     	  / \   \ 
#     	 5   4   7
#     
# 
# 
# 
# **Note:** The merging process must start from the root nodes of both trees.
# 
# 
## @lc code=start
using LeetCode

merge_trees(::Nothing, ::Nothing) = nothing
merge_trees(::Nothing, root2::TreeNode) = root2
merge_trees(root1::TreeNode, ::Nothing) = root1
function merge_trees(root1::TreeNode, root2::TreeNode)::TreeNode
    root = TreeNode(root1.val + root2.val)
    root.left = merge_trees(root1.left, root2.left)
    root.right = merge_trees(root1.right, root2.right)
    return root
end
## @lc code=end

## @lc test=start
@testset "617.merge-two-binary-trees.jl" begin
    @test merge_trees(TreeNode{Int}([1,3,2,5]), TreeNode{Int}([2,1,3,nothing, 4, nothing, 7])) == TreeNode{Int}([3,4,5,5,4,nothing,7])
    @test merge_trees(TreeNode{Int}([1]), TreeNode{Int}([1,2])) == TreeNode{Int}([2,2])
    @test merge_trees(nothing, nothing) === nothing
end
## @lc test=end


## @lc info=start
# link: [solution to 617](https://leetcode-cn.com/problems/merge-two-binary-trees/solution/617-he-bing-er-cha-shu-by-rex-rs-tyx3/)
## @lc info=end

# ---
# title: 700. Search in a Binary Search Tree
# id: problem700
# author: zhwang
# date: 2022-02-22
# difficulty: Easy
# categories: Tree
# link: <https://leetcode.com/problems/search-in-a-binary-search-tree/description/>
# hidden: true
# ---
# 
# Given the root node of a binary search tree (BST) and a value. You need to
# find the node in the BST that the node's value equals the given value. Return
# the subtree rooted with that node. If such node doesn't exist, you should
# return NULL.
# 
# For example,
# 
#     
#     
#     Given the tree:
#             4
#            / \
#           2   7
#          / \
#         1   3
#     
#     And the value to search: 2
#     
# 
# You should return this subtree:
# 
#     
#     
#           2     
#          / \   
#         1   3
#     
# 
# In the example above, if we want to search the value `5`, since there is no
# node with value `5`, we should return `NULL`.
# 
# Note that an empty tree is represented by `NULL`, therefore you would see the
# expected output (serialized tree format) as `[]`, not `null`.
# 
# 
## @lc code=start
using LeetCode

function search_bst(root::TreeNode, val::Int)::Union{TreeNode, Nothing}
    while !isnothing(root)
        root.val == val && return root
        root = (root.val > val) ? root.left : root.right
    end
end
## @lc code=end
## @lc test=start
@testset "700.search-in-a-binary-search-tree.jl" begin
    @test search_bst(TreeNode{Int}([4,2,7,1,3]), 2) == TreeNode{Int}([2,1,3])
    @test search_bst(TreeNode{Int}([4,2,7,1,3]), 5) === nothing
end
## @lc test=end

## @lc info=start
# link: [solution to 700](https://leetcode-cn.com/problems/search-in-a-binary-search-tree/solution/700-er-cha-sou-suo-shu-zhong-de-sou-suo-5su23/)
## @lc info=end

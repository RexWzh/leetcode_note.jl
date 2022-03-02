# ---
# title: 235. Lowest Common Ancestor of a Binary Search Tree
# id: problem235
# author: zhwang
# date: 2022-02-23
# difficulty: Easy
# categories: Tree
# link: <https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/>
# hidden: true
# ---
# 
# Given a binary search tree (BST), find the lowest common ancestor (LCA) of two
# given nodes in the BST.
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
# ![](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)
# 
#     
#     
#     Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
#     Output: 6
#     Explanation: The LCA of nodes 2 and 8 is 6.
#     
# 
# **Example 2:**
# 
# ![](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)
# 
#     
#     
#     Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
#     Output: 2
#     Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: root = [2,1], p = 2, q = 1
#     Output: 2
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
#   * `p` and `q` will exist in the BST.
# 
# 
## @lc code=start
using LeetCode

function lowest_common_ancestor_235(root::TreeNode, p::TreeNode, q::TreeNode)::TreeNode
    lv, gv = p.val < q.val ? (p.val, q.val) : (q.val, p.val)
    while true
        lv <= root.val <= gv && return root
        root = root.val < lv ? root.right : root.left
    end
end
## @lc code=end

## @lc test=start
@testset "235.lowest-common-ancestor-of-a-binary-search-tree.jl" begin
    root = TreeNode{Int}([6,2,8,0,4,7,9,nothing,nothing,3,5])
    @test lowest_common_ancestor_235(root, root.left, root.right) == root
    @test lowest_common_ancestor_235(root, root.left, root.left.right) == root.left
    root = TreeNode{Int}([2, 1])
    @test lowest_common_ancestor_235(root, root, root.left) == root
end
## @lc test=end

## @lc info=start
# link: [solution to 235](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/solution/235-er-cha-sou-suo-shu-de-zui-jin-gong-g-yne3/)
## @lc info=end
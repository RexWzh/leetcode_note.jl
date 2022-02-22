# ---
# title: 701. Insert into a Binary Search Tree
# id: problem701
# author: zhwang
# date: 2022-02-22
# difficulty: Medium
# categories: Tree
# link: <https://leetcode.com/problems/insert-into-a-binary-search-tree/description/>
# hidden: true
# ---
# 
# You are given the `root` node of a binary search tree (BST) and a `value` to
# insert into the tree. Return _the root node of the BST after the insertion_.
# It is **guaranteed** that the new value does not exist in the original BST.
# 
# **Notice**  that there may exist multiple valid ways for the insertion, as
# long as the tree remains a BST after insertion. You can return **any of
# them**.
# 
# 
# 
# **Example 1:**
# 
# ![](https://assets.leetcode.com/uploads/2020/10/05/insertbst.jpg)
# 
#     
#     
#     Input: root = [4,2,7,1,3], val = 5
#     Output: [4,2,7,1,3,5]
#     Explanation: Another accepted tree is:
#     ![](https://assets.leetcode.com/uploads/2020/10/05/bst.jpg)
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: root = [40,20,60,10,30,50,70], val = 25
#     Output: [40,20,60,10,30,50,70,null,null,25]
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
#     Output: [4,2,7,1,3,5]
#     
# 
# 
# 
# **Constraints:**
# 
#   * The number of nodes in the tree will be in the range `[0, 104]`.
#   * `-108 <= Node.val <= 108`
#   * All the values `Node.val` are **unique**.
#   * `-108 <= val <= 108`
#   * It's **guaranteed** that `val` does not exist in the original BST.
# 
# 
## @lc code=start
using LeetCode

insert_into_bst(::Nothing, val::Int) = TreeNode(val)
function insert_into_bst(root::TreeNode, val::Int)::TreeNode
    if root.val > val
        root.left = insert_into_bst(root.left, val)
    else
        root.right = insert_into_bst(root.right, val)
    end
    return root
end

## @lc code=end
## @lc test=start
@testset "701.insert-into-a-binary-search-tree.jl" begin
    @test insert_into_bst(TreeNode{Int}([4,2,7,1,3]),5) == TreeNode{Int}([4,2,7,1,3,5])
    @test insert_into_bst(TreeNode{Int}([40,20,60,10,30,50,70]), 25) == TreeNode{Int}([40,20,60,10,30,50,70,nothing,nothing,25])
    @test insert_into_bst(TreeNode{Int}([4,2,7,1,3,nothing,nothing,nothing,nothing,nothing,nothing]), 5) == TreeNode{Int}([4,2,7,1,3,5])
end
## @lc test=end

## @lc info=start
# link: [solution to 701](https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/solution/701-er-cha-sou-suo-shu-zhong-de-cha-ru-c-ca85/)
## @lc info=end

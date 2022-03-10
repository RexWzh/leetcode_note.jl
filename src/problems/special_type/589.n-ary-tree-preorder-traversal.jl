# ---
# title: 589. N-ary Tree Preorder Traversal
# id: problem589
# author: zhwang
# date: 2022-03-10
# difficulty: Easy
# categories: Tree
# link: <https://leetcode.com/problems/n-ary-tree-preorder-traversal/description/>
# hidden: true
# ---
# 
# Given an n-ary tree, return the _preorder_ traversal of its nodes' values.
# 
# _Nary-Tree input serialization  is represented in their level order traversal,
# each group of children is separated by the null value (See examples)._
# 
# 
# 
# **Follow up:**
# 
# Recursive solution is trivial, could you do it iteratively?
# 
# 
# 
# **Example 1:**
# 
# ![](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
# 
#     
#     
#     Input: root = [1,null,3,2,4,null,5,6]
#     Output: [1,3,5,6,2,4]
#     
# 
# **Example 2:**
# 
# ![](https://assets.leetcode.com/uploads/2019/11/08/sample_4_964.png)
# 
#     
#     
#     Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
#     Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
#     
# 
# 
# 
# **Constraints:**
# 
#   * The height of the n-ary tree is less than or equal to `1000`
#   * The total number of nodes is between `[0, 10^4]`
# 
# 
## @lc code=start
using LeetCode
preorder(::Nothing) = Int[]
function preorder(root::TreeNode{Int})::Vector{Int}
    stack, ans = [root], Int[]
    while !isempty(stack)
        node = pop!(stack)
        push!(ans, node.val)
        append!(stack, reverse(node.children))
    end
    ans
end

## @lc code=end

## @lc test=start
@testset "589.n-ary-tree-preorder-traversal.jl" begin
    @test 
end
## @lc test=end

## @lc info=start
# link: [solution to 589]()
## @lc info=end
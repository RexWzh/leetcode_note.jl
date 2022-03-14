# ---
# title: 429. N-ary Tree Level Order Traversal
# id: problem429
# author: zhwang
# date: 2022-03-12
# difficulty: Medium
# categories: Tree, Breadth-first Search
# link: <https://leetcode.com/problems/n-ary-tree-level-order-traversal/description/>
# hidden: true
# ---
# 
# Given an n-ary tree, return the _level order_ traversal of its nodes' values.
# 
# _Nary-Tree input serialization  is represented in their level order traversal,
# each group of children is separated by the null value (See examples)._
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
#     Output: [[1],[3,2,4],[5,6]]
#     
# 
# **Example 2:**
# 
# ![](https://assets.leetcode.com/uploads/2019/11/08/sample_4_964.png)
# 
#     
#     
#     Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
#     Output: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]
#     
# 
# 
# 
# **Constraints:**
# 
#   * The height of the n-ary tree is less than or equal to `1000`
#   * The total number of nodes is between `[0, 104]`
# 
# 
## @lc code=start
using LeetCode


## @lc code=end

## @lc test=start
@testset "429.n-ary-tree-level-order-traversal.jl" begin
    @test 
end
## @lc test=end

## @lc info=start
# link: [solution to 429]()
## @lc info=end
# ---
# title: 226. Invert Binary Tree
# id: problem226
# author: Tian Jun
# date: 2020-10-31
# difficulty: Easy
# categories: Tree
# link: <https://leetcode.com/problems/invert-binary-tree/description/>
# hidden: true
# ---
# 
# Invert a binary tree.
# 
# **Example:**
# 
# Input:
# 
#     
#     
#          4
#        /   \
#       2     7
#      / \   / \
#     1   3 6   9
# 
# Output:
# 
#     
#     
#          4
#        /   \
#       7     2
#      / \   / \
#     9   6 3   1
# 
# **Trivia:**  
# This problem was inspired by [this original
# tweet](https://twitter.com/mxcl/status/608682016205344768) by [Max
# Howell](https://twitter.com/mxcl):
# 
# > Google: 90% of our engineers use the software you wrote (Homebrew), but you
# > can't invert a binary tree on a whiteboard so f*** off.
# 
# 
## @lc code=start
using LeetCode

function invert_tree!(root::Union{TreeNode{Int}, Nothing})::Union{TreeNode, Nothing}
    isnothing(root) && return nothing
    queue = [root]
    while !isempty(queue)
        node = popfirst!(queue)
        if !isnothing(node.left)
            push!(queue, node.left)
        end
        if !isnothing(node.right)
            push!(queue, node.right)
        end
        node.left, node.right = node.right, node.left
    end
    return root
end
## @lc code=end

## @lc test=start
@testset "226.invert-binary-tree.jl" begin
    @test invert_tree!(TreeNode{Int}([4,2,7,1,3,6,9])) == TreeNode{Int}([4,7,2,9,6,3,1])
    @test invert_tree!(TreeNode{Int}([2,1,3])) == TreeNode{Int}([2,3,1])
    @test invert_tree!(nothing) === nothing
end
## @lc test=end


## @lc info=start
# link: [solution to 226](https://leetcode-cn.com/problems/invert-binary-tree/solution/226-fan-zhuan-er-cha-shu-python-julia-by-sbu2/)
## @lc info=end
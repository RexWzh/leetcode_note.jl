# ---
# title: 206. Reverse Linked List
# id: problem206
# author: zhwang
# date: 2022-02-17
# difficulty: Easy
# categories: Linked List
# link: <https://leetcode.com/problems/reverse-linked-list/description/>
# hidden: true
# ---
# 
# Reverse a singly linked list.
# 
# **Example:**
# 
#     
#     
#     Input: 1->2->3->4->5->NULL
#     Output: 5->4->3->2->1->NULL
#     
# 
# **Follow up:**
# 
# A linked list can be reversed either iteratively or recursively. Could you
# implement both?
# 
# 
## @lc code=start
using LeetCode

function reverse_list(head::Union{ListNode, Nothing})::Union{ListNode, Nothing}
    new_head = pre_node = nothing
    while !isnothing(head)
        new_head = ListNode(head.val)
        pre_node, new_head.next = new_head, pre_node
        head = head.next
    end
    new_head
end
## @lc code=end
## @lc test=start
@testset "206.reverse-linked-list.jl" begin
    @test reverse_list(ListNode{Int}([1,2,3,4,5])) == ListNode{Int}([5,4,3,2,1])
    @test reverse_list(ListNode{Int}([1,2])) == ListNode{Int}([2,1])
    @test reverse_list(nothing) === nothing
end
## @lc test=end


## @lc info=start
# link: [solution to 206](https://leetcode-cn.com/problems/reverse-linked-list/solution/206-fan-zhuan-lian-biao-by-rex-rs-zon0/)
## @lc info=end
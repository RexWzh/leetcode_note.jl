## @lc code=start
using LeetCode

function merge_nodes!(head::ListNode)::ListNode
    node, cur = head, head.next
    while !isnothing(cur)
        if cur.val == 0 && !isnothing(cur.next)
            node.next = cur
            node = node.next
        else
            node.val += cur.val
        end
        cur = cur.next
    end
    node.next = nothing
    return head
end
## @lc code=end

## @lc test=start
@testset "2181.merge-nodes-in-between-zeros.jl" begin
    @test merge_nodes!(ListNode{Int}([0,3,1,0,4,5,2,0])) == ListNode{Int}([4, 11])
    @test merge_nodes!(ListNode{Int}([0,1,0,3,0,2,2,0])) == ListNode{Int}([1,3,4])
end
## @lc test=end

## @lc info=start
# link: [solution to 2181](https://leetcode-cn.com/problems/merge-nodes-in-between-zeros/solution/chuang-jian-xin-jie-dian-yuan-di-xiu-gai-dplq/)
## @lc info=end
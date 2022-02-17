# ---
# title: 382. Linked List Random Node
# id: problem382
# author: zhwang
# date: 2022-02-15
# difficulty: Medium
# categories: Reservoir Sampling
# link: <https://leetcode.com/problems/linked-list-random-node/description/>
# hidden: true
# ---
# 
# Given a singly linked list, return a random node's value from the linked list.
# Each node must have the **same probability** of being chosen.
# 
# **Follow up:**  
# What if the linked list is extremely large and its length is unknown to you?
# Could you solve this efficiently without using extra space?
# 
# **Example:**
# 
#     
#     
#     // Init a singly linked list [1,2,3].
#     ListNode head = new ListNode(1);
#     head.next = new ListNode(2);
#     head.next.next = new ListNode(3);
#     Solution solution = new Solution(head);
#     
#     // getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
#     solution.getRandom();
#     
# 
# 
## @lc code=start
using LeetCode

function get_random(head::ListNode)::Int
    node, i, res = head, 1, 0
    while !isnothing(node)
        if rand(1:i) == 1  ## 1/i prob for value change
            res = node.val
        end
        node = node.next
        i += 1
    end
    res
end
## @lc code=end

## @lc test=start
@testset "382.linked-list-random-node.jl" begin
    node = ListNode{Int}([1, 2, 2, 3])
    @test begin
        freq = Dict{Int, Int}(1 => 0, 2 => 0, 3 => 0)
        for _ in 1:10000
            freq[get_random(node)] += 1
        end
        num = freq[1] + freq[2] + freq[3]
        !(freq[1] == 2 * freq[2] == freq[3]) &&
        abs(freq[1] / num - freq[3] / num) + abs(freq[1] / num - freq[2] / num / 2) <= 0.03
    end
end
## @lc test=end


## @lc info=start
# link: [solution to 382](https://leetcode-cn.com/problems/linked-list-random-node/solution/382-lian-biao-sui-ji-jie-dian-by-rex-rs-0g47/)
## @lc info=end
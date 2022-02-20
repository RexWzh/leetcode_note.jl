# ---
# title: 717. 1-bit and 2-bit Characters
# id: problem717
# author: zhwang
# date: 2022-02-20
# difficulty: Easy
# categories: Array
# link: <https://leetcode.com/problems/1-bit-and-2-bit-characters/description/>
# hidden: true
# ---
# 
# We have two special characters. The first character can be represented by one
# bit `0`. The second character can be represented by two bits (`10` or `11`).
# 
# Now given a string represented by several bits. Return whether the last
# character must be a one-bit character or not. The given string will always end
# with a zero.
# 
# **Example 1:**  
# 
#     
#     
#     Input: 
#     bits = [1, 0, 0]
#     Output: True
#     Explanation: 
#     The only way to decode it is two-bit character and one-bit character. So the last character is one-bit character.
#     
# 
# **Example 2:**  
# 
#     
#     
#     Input: 
#     bits = [1, 1, 1, 0]
#     Output: False
#     Explanation: 
#     The only way to decode it is two-bit character and two-bit character. So the last character is NOT one-bit character.
#     
# 
# **Note:**
# 
# * `1 <= len(bits) <= 1000`.
# * `bits[i]` is always `0` or `1`.
# 
# 
## @lc code=start
using LeetCode

function is_one_bit_character(bits::Vector{Int})::Bool
    pos = findlast(x->x==0, @view bits[1:end-1])
    pos === nothing && return length(bits) % 2 == 1
    return (length(bits) - pos) % 2 == 1
end
## @lc code=end

## @lc test=start
@testset "717.1-bit-and-2-bit-characters.jl" begin
    @test is_one_bit_character([1,1,1,1,0]) == true
    @test is_one_bit_character([1,0]) == false
    @test is_one_bit_character([1,1,1,0]) == false
    @test is_one_bit_character([1,0,1,1,0]) == true
end
## @lc test=end


## @lc info=start
# link: [solution to 717](https://leetcode-cn.com/problems/1-bit-and-2-bit-characters/solution/717-1bi-te-yu-2bi-te-zi-fu-by-rex-rs-3aak/)
## @lc info=end
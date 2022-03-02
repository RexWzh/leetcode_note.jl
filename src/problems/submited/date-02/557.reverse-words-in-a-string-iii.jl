# ---
# title: 557. Reverse Words in a String III
# id: problem557
# author: zhwang
# date: 2022-02-15
# difficulty: Easy
# categories: String
# link: <https://leetcode.com/problems/reverse-words-in-a-string-iii/description/>
# hidden: true
# ---
# 
# Given a string, you need to reverse the order of characters in each word
# within a sentence while still preserving whitespace and initial word order.
# 
# **Example 1:**  
# 
#     
#     
#     Input: "Let's take LeetCode contest"
#     Output: "s'teL ekat edoCteeL tsetnoc"
#     
# 
# **Note:** In the string, each word is separated by single space and there will
# not be any extra space in the string.
# 
# 
## @lc code=start
using LeetCode
reverse_words_557(s::String) = join([reverse(i) for i in split(s)], " ")

## @lc code=end

## @lc test=start
@testset "557.reverse-words-in-a-string-iii.jl" begin
    @test reverse_words_557("Let's take LeetCode contest") == "s'teL ekat edoCteeL tsetnoc"
    @test reverse_words_557("God Ding") =="doG gniD"
end
## @lc test=end


## @lc info=start
# link: [solution to 557](https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/solution/557-fan-zhuan-zi-fu-chuan-zhong-de-dan-c-wibs/)
## @lc info=end
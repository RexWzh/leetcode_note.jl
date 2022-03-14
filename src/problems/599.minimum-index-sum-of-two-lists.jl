# ---
# title: 599. Minimum Index Sum of Two Lists
# id: problem599
# author: zhwang
# date: 2022-03-14
# difficulty: Easy
# categories: Hash Table
# link: <https://leetcode.com/problems/minimum-index-sum-of-two-lists/description/>
# hidden: true
# ---
# 
# Suppose Andy and Doris want to choose a restaurant for dinner, and they both
# have a list of favorite restaurants represented by strings.
# 
# You need to help them find out their **common interest** with the **least list
# index sum**. If there is a choice tie between answers, output all of them with
# no order requirement. You could assume there always exists an answer.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]
#     Output: ["Shogun"]
#     Explanation: The only restaurant they both like is "Shogun".
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["KFC","Shogun","Burger King"]
#     Output: ["Shogun"]
#     Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["KFC","Burger King","Tapioca Express","Shogun"]
#     Output: ["KFC","Burger King","Tapioca Express","Shogun"]
#     
# 
# **Example 4:**
# 
#     
#     
#     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["KNN","KFC","Burger King","Tapioca Express","Shogun"]
#     Output: ["KFC","Burger King","Tapioca Express","Shogun"]
#     
# 
# **Example 5:**
# 
#     
#     
#     Input: list1 = ["KFC"], list2 = ["KFC"]
#     Output: ["KFC"]
#     
# 
# 
# 
# **Constraints:**
# 
#   * `1 <= list1.length, list2.length <= 1000`
#   * `1 <= list1[i].length, list2[i].length <= 30`
#   * `list1[i]` and `list2[i]` consist of spaces `' '` and English letters.
#   * All the stings of `list1` are **unique**.
#   * All the stings of `list2` are **unique**.
# 
# 
## @lc code=start
using LeetCode

function find_restaurant(list1::Vector{String}, list2::Vector{String})::Vector{String}
    dic = Dict(st=>(i - 1) for (i, st) in enumerate(list1))
    cost, res = typemax(1), String[]
    for (i, s) in enumerate(list2)
        !haskey(dic, s) && continue
        newcost = i - 1 + dic[s]
        if newcost < cost
            cost, res = newcost, [s]
        elseif newcost == cost
            push!(res, s)
        end
    end
    res
end


## @lc code=end

## @lc test=start
@testset "599.minimum-index-sum-of-two-lists.jl" begin
    list1 = ["Shogun","Tapioca Express","Burger King","KFC"]
    list2 = ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]
    list3 = ["KFC","Shogun","Burger King"]
    list4 = ["KFC","Burger King","Tapioca Express","Shogun"]
    list5 =["KNN","KFC","Burger King","Tapioca Express","Shogun"]
    @test find_restaurant(list1, list2) == ["Shogun"]
    @test find_restaurant(list1, list3) == ["Shogun"]
    @test find_restaurant(list1, list4) == list4
    @test find_restaurant(list1, list5) == ["KFC","Burger King","Tapioca Express","Shogun"]
    @test find_restaurant(["KFC"], ["KFC"]) == ["KFC"]
end
## @lc test=end

## @lc info=start
# link: [solution to 599]()
## @lc info=end

#     Input: 
#     Output: 
#     Explanation: The only restaurant they both like is "Shogun".
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = 
#     Output: ["Shogun"]
#     Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: list1 = 
#     Output: 
#     
# 
# **Example 4:**
# 
#     
#     
#     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = 
#     Output: ["KFC","Burger King","Tapioca Express","Shogun"]
#     
# 
# **Example 5:**
# 
#     
#     
#     Input: list1 = ["KFC"], list2 = ["KFC"]
#     Output: ["KFC"]
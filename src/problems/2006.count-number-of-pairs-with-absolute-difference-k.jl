## @lc info=start
# Date: 2022-02-09
# link: [solution to 2006](https://leetcode-cn.com/problems/count-number-of-pairs-with-absolute-difference-k/solution/2006-chai-de-jue-dui-zhi-wei-k-de-shu-du-q6k9/)
## @lc info=end

## @lc code=start
using LeetCode

## Counting sort
function count_difference(nums::Vector{Int}, k::Int)::Int
    res, mi, ma = 0, minimum(nums), maximum(nums)
    table = Dict{Int, Int}(i => 0 for i in mi:ma)
    for i in nums
        table[i] += 1
    end
    for i in mi:(ma - k)
        res += (table[i] * table[i+k])
    end
    res
end
## @lc code=end

## @lc test=start
@testset "2006.count-number-of-pairs-with-absolute-difference-k.jl" begin
    @test count_difference([1,2,2,1], 1) == 4
    @test count_difference([1,3], 3) == 0
    @test count_difference([3,2,1,5,4], 2) == 3
end
## @lc test=end
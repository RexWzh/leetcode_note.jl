## @lc code=start
using LeetCode

function maximum_difference(nums::Vector{Int})::Int
    mi, max_diff = nums[1], 0
    for num in @view nums[2:end]
        if num < mi
            mi = num
        elseif num - mi > max_diff
            max_diff = num - mi
        end
    end
    max_diff > 0 ? max_diff : -1
end

## @lc code=end
## @lc test=start
@testset "2016.maximum-difference-between-increasing-elements.jl" begin
    @test maximum_difference([7,1,5,4]) == 4
    @test maximum_difference([9,4,3,2]) == -1
    @test maximum_difference([1,5,2,10]) == 9
    @test maximum_difference([2,2,1]) == -1
end
## @lc test=end




## @lc info=start
# link: [solution to 2016]()
## @lc info=end
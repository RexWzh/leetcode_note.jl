## @lc code=start
using LeetCode

function minimum_removal(beans::Vector{Int})::Int
    beans = sort(beans)
    n, same = length(beans), 1
    min_cost = cost = sum(beans) - n * first(beans)
    for k in 2 : n
        if beans[k] > beans[k - 1]
            cost = cost + same * beans[k - 1] - (beans[k] - beans[k-1]) * (n - k + 1)
            min_cost, same = min(cost, min_cost) , 1
        else
            same += 1
        end
    end
    min_cost
end
minimum_removal_oneline(beans::Vector{Int}) = sum(beans) - maximum((length(beans) - i + 1) * v for (i, v) in enumerate(sort(beans)))
## @lc code=end

## @lc test=start
@testset "2171.removing-minimum-number-of-magic-beans.jl" begin
    @test minimum_removal([4,1,6,5]) == 4
    @test minimum_removal([2,10,3,2]) == 7
    @test minimum_removal([25,27,1,10,8,35,17,5,4,16]) == 68
    @test minimum_removal_oneline([4,1,6,5]) == 4
    @test minimum_removal_oneline([2,10,3,2]) == 7
    @test minimum_removal_oneline([25,27,1,10,8,35,17,5,4,16]) == 68
end
## @lc test=end

## @lc info=start
# link: [solution to 2171](https://leetcode-cn.com/problems/removing-minimum-number-of-magic-beans/solution/6006-na-chu-zui-shao-shu-mu-de-mo-fa-dou-bsey/)
## @lc info=end
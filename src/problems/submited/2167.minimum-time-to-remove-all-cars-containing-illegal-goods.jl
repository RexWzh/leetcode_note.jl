## @lc code=start
using LeetCode
function minimum_time_2167(s::String)::Int
    right_cost = n = length(s)
    cost = s[1] == '0' ? 0 : 1
    for i in 2:n
        if s[i] == '1'
            right_cost = min(right_cost, cost + n - i + 1)
            cost = min(right_cost, i, cost + 2)
        end
    end
    cost
end
## @lc code=end

## @lc test=start
@testset "2167.minimum-time-to-remove-all-cars-containing-illegal-goods.jl" begin
    @test minimum_time_2167("1100101") == 5
    @test minimum_time_2167("0010") == 2
    @test minimum_time_2167("010110") == 5
    @test minimum_time_2167("0111001110") == 8
end
## @lc test=end


## @lc info=start
# link: solution to 
## @lc info=end
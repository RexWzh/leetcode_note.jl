## @lc code=start
using LeetCode

function count_operations(num1::Int, num2::Int)::Int
    if num2 > num1
        num1, num2 = num2, num1
    end
    res = 0
    while num1 > 0
        res += num2 ÷ num1
        num1, num2 = num2 % num1, num1
    end
    res
end
## @lc code=end

## @lc test=start
@testset "2169.count-operations-to-obtain-zero.jl" begin
    @test count_operations(2, 3) == 3
    @test count_operations(10, 10) == 1
    @test count_operations(2022, 1077) == 20
end
## @lc test=end


## @lc info=start
# link: [solution to 2169](https://leetcode-cn.com/problems/count-operations-to-obtain-zero/solution/6004-zhan-zhuan-xiang-chu-de-ci-shu-juli-23oc/)
## @lc info=end
## @lc code=start
using LeetCode
count_even(num::Int) = sum(iseven(sum(j-'0' for j in string(i))) for i in 1:num)

## @lc code=end

## @lc test=start
@testset "2180.count-integers-with-even-digit-sum.jl" begin
    @test count_even(4) == 2
    @test count_even(30) == 14
end
## @lc test=end

## @lc info=start
# link: [solution to 2180](https://leetcode-cn.com/problems/count-integers-with-even-digit-sum/solution/python-yi-xing-dai-ma-by-rex-rs-1xty/)
## @lc info=end
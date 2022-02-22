## @lc code=start
using LeetCode
using DataStructures
function number_of_good_subsets(nums::Vector{Int})::Int
    table, MOD = counter(nums), 10 ^ 9 + 7
    primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    good_part = [i for i in 2:30 if haskey(table, i) && all(i % p ^ 2 != 0 for p in primes)]
    good_nums = DefaultDict{Int, Int}(0)
    good_nums[1] = (1 << table[1]) % MOD
    for num in good_part, x in collect(keys(good_nums))
        if gcd(num, x) == 1
            good_nums[num * x] += table[num] * good_nums[x]
            good_nums[num * x] %= MOD
        end
    end
    return (sum(values(good_nums)) - good_nums[1]) % MOD
end
## @lc code=end

## @lc test=start
@testset "1994.the-number-of-good-subsets.jl" begin
    @test number_of_good_subsets([1,2,3,4]) == 6
    @test number_of_good_subsets([4,2,3,15]) == 5
    @test number_of_good_subsets([5,10,1,26,24,21,24,23,11,12,27,4,17,16,2,6,1,1,6,8,13,30,24,20,2,19]) == 5368
end
## @lc test=end

## @lc info=start
# link: [solution to 1994]()
## @lc info=end
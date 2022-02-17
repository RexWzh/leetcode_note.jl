## @lc code=start
using LeetCode
using DataStructures

function minimum_operations(nums::Vector{Int})::Int
    function get_max_and_premax_data(dict::DefaultDict)::Tuple{Int, Int, Int}
        if length(dict) > 1
            (a, b), (c,) = sort!([(freq, num) for (num, freq) in dict], by=i -> i[1], rev=true)
        else
            (a, b), = sort!([(freq, num) for (num, freq) in dict], by=i -> i[1], rev=true)
            c = 0
        end
        return a, b, c
    end
    n = length(nums)
    n == 1 && return 0
    odd, even = DefaultDict{Int,Int}(0), DefaultDict{Int,Int}(0)
    for (i, num) in enumerate(nums)
        if i % 2 == 1
            odd[num] += 1
        else
            even[num] += 1
        end
    end
    odd_max_freq, odd_max_num, odd_premax_freq = get_max_and_premax_data(odd)
    even_max_freq, even_max_num, even_premax_freq = get_max_and_premax_data(even)
    if even_max_num != odd_max_num
        return n - even_max_freq - odd_max_freq
    else
        return n - max(even_max_freq + odd_premax_freq, odd_max_freq + even_premax_freq) 
    end
end
## @lc code=end

## @lc test=start
@testset "2170.minimum-operations-to-make-the-array-alternating.jl" begin
    @test minimum_operations([3,1,3,2,4,3]) == 3
    @test minimum_operations([2,2,2,2,2]) == 2
    @test minimum_operations([2,2,2,2,1,1,1,1]) == 4
    @test minimum_operations([3,1,3,2,4,3]) == 3
    @test minimum_operations([1,2,2,2,2]) == 2
end
## @lc test=end

## @lc info=start
# link: [solution to 2170](https://leetcode-cn.com/problems/minimum-operations-to-make-the-array-alternating/solution/6005-zui-da-pin-ci-he-ci-da-pin-ci-julia-6oz2/)
## @lc info=end
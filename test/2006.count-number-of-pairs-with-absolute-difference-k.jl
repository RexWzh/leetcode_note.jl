@testset "2006.count-number-of-pairs-with-absolute-difference-k.jl" begin
    @test count_difference([1,2,2,1], 1) == 4
    @test count_difference([1,3], 3) == 0
    @test count_difference([3,2,1,5,4], 2) == 3
end
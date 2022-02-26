## @lc code=start
using LeetCode

function find_ball(grid::Vector{Vector{Int}})::Vector{Int}
    function next_pos(line::Vector{Int}, i::Int)::Int
        i == 0 && return 0
        i > 1 && line[i] == line[i-1] == -1 && return i - 1
        i < n && line[i] == line[i+1] == 1 && return i + 1
        return 0
    end
    n = length(grid[1])
    f(ans, line) = [next_pos(line, j) for j in ans]
    foldl(f, [1:n, grid...]).-1
end

## @lc code=end
## @lc test=start
@testset "1706.where-will-the-ball-fall.jl" begin
    @test find_ball([[1,1,1,-1,-1],[1,1,1,-1,-1],[-1,-1,-1,1,1],[1,1,1,1,-1],[-1,-1,-1,-1,-1]]) == [1,-1,-1,-1,-1]
    @test find_ball([[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1],[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1]]) == [0,1,2,3,4,-1]
    @test find_ball([[-1]]) == [-1]
end
## @lc test=end

## @lc info=start
# link: [solution to 1706]()
## @lc info=end
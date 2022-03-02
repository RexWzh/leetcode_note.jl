# ---
# title: 1020. Number of Enclaves
# id: problem1020
# author: zhwang
# date: 2022-02-12
# difficulty: Medium
# categories: Depth-first Search
# link: <https://leetcode.com/problems/number-of-enclaves/description/>
# hidden: true
# ---
# 
# Given a 2D array `A`, each cell is 0 (representing sea) or 1 (representing
# land)
# 
# A move consists of walking from one land square 4-directionally to another
# land square, or off the boundary of the grid.
# 
# Return the number of land squares in the grid for which we **cannot** walk off
# the boundary of the grid in any number of moves.
# 
# 
# 
# **Example 1:**
# 
#     
#     
#     Input: [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
#     Output: 3
#     Explanation:
#     There are three 1s that are enclosed by 0s, and one 1 that isn't enclosed because its on the boundary.
# 
# **Example 2:**
# 
#     
#     
#     Input: [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
#     Output: 0
#     Explanation:
#     All 1s are either on the boundary or can reach the boundary.
#     
# 
# 
# 
# **Note:**
# 
#   1. `1 <= A.length <= 500`
#   2. `1 <= A[i].length <= 500`
#   3. `0 <= A[i][j] <= 1`
#   4. All rows have the same size.
# 
# 
## @lc code=start
using LeetCode

## BFS algorithm
function num_of_enclaves_bfs(grid::Vector{Vector{Int}})::Int
    m, n, queue = length(grid), length(grid[1]), Tuple{Int,Int}[]
    (m <= 2 || n <= 2) && return 0
    for i in 1:m ## left and right border
        grid[i][1] == 1 && push!(queue, (i, 1))
        grid[i][n] == 1 && push!(queue, (i, n))
    end
    for i in 2:n-1
        grid[1][i] == 1 && push!(queue, (1, i))
        grid[m][i] == 1 && push!(queue, (m, i))
    end
    walkoff = copy(queue)
    while length(queue) != 0
        i, j = popfirst!(queue)
        for (a, b) in [(i-1, j), (i+1, j), (i,j-1), (i,j+1)]
            if a >= 1 && b >= 1 && a <= m && b <= n && grid[a][b] != 0 && !((a, b) in walkoff)
                push!(walkoff, (a, b))
                push!(queue, (a, b))
            end
        end
    end
    sum(sum(line) for line in grid) - length(walkoff)
end
## @lc code=end

## @lc test=start
@testset "1020.number-of-enclaves.jl" begin
    @test num_of_enclaves_bfs([[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]) == 3
    @test num_of_enclaves_bfs([[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]) == 0
    @test num_of_enclaves_bfs([[0],[1],[1],[0],[0]]) == 0
    @test num_of_enclaves_bfs(
        [[0,0,0,1,1,1,0,1,0,0],
         [1,1,0,0,0,1,0,1,1,1],
         [0,0,0,1,1,1,0,1,0,0],
         [0,1,1,0,0,0,1,0,1,0],
         [0,1,1,1,1,1,0,0,1,0],
         [0,0,1,0,1,1,1,1,0,1],
         [0,1,1,0,0,0,1,1,1,1],
         [0,0,1,0,0,1,0,1,0,1],
         [1,0,1,0,1,1,0,0,0,0],
         [0,0,0,0,1,1,0,0,0,1]])==3
end
## @lc test=end

## @lc info=start
# link: [solution to 2006](https://leetcode-cn.com/problems/number-of-enclaves/solution/1020-fei-di-de-shu-liang-by-rex-rs-sav5/)
## @lc info=end
# ---
# title: 733. Flood Fill
# id: problem733
# author: zhwang
# date: 2022-02-18
# difficulty: Easy
# categories: Depth-first Search
# link: <https://leetcode.com/problems/flood-fill/description/>
# hidden: true
# ---
# 
# An `image` is represented by a 2-D array of integers, each integer
# representing the pixel value of the image (from 0 to 65535).
# 
# Given a coordinate `(sr, sc)` representing the starting pixel (row and column)
# of the flood fill, and a pixel value `newColor`, "flood fill" the image.
# 
# To perform a "flood fill", consider the starting pixel, plus any pixels
# connected 4-directionally to the starting pixel of the same color as the
# starting pixel, plus any pixels connected 4-directionally to those pixels
# (also with the same color as the starting pixel), and so on. Replace the color
# of all of the aforementioned pixels with the newColor.
# 
# At the end, return the modified image.
# 
# **Example 1:**  
# 
#     
#     
#     Input: 
#     image = [[1,1,1],[1,1,0],[1,0,1]]
#     sr = 1, sc = 1, newColor = 2
#     Output: [[2,2,2],[2,2,0],[2,0,1]]
#     Explanation: 
#     From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected 
#     by a path of the same color as the starting pixel are colored with the new color.
#     Note the bottom corner is not colored 2, because it is not 4-directionally connected
#     to the starting pixel.
#     
# 
# **Note:**
# 
# * The length of `image` and `image[0]` will be in the range `[1, 50]`.
# * The given starting pixel will satisfy `0 <= sr < image.length` and `0 <= sc < image[0].length`.
# * The value of each color in `image[i][j]` and `newColor` will be an integer in `[0, 65535]`.
# 
# 
## @lc code=start
using LeetCode

function flood_fill!(image::Vector{Vector{Int}}, sr::Int, sc::Int, new_color::Int)::Vector{Vector{Int}}
    old_color, image[sr + 1][sc + 1] = image[sr + 1][sc + 1], new_color
    old_color == new_color && return image
    m, n, queue = length(image), length(image[1]), [(sr + 1, sc + 1)]
    while !isempty(queue)
        x, y = popfirst!(queue)
        for (i, j) in [(x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)]
            if 1 <= i <= m && 1 <= j <= n && image[i][j] == old_color
                image[i][j] = new_color
                push!(queue, (i, j))
            end
        end
    end
    image
end
## @lc code=end

## @lc test=start
@testset "733.flood-fill.jl" begin
    @test flood_fill!([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 1) == [[1,1,1],[1,1,0],[1,0,1]]
    @test flood_fill!([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2) == [[2,2,2],[2,2,0],[2,0,1]]
    @test flood_fill!([[0,0,0],[0,1,0]], 1, 1, 2) == [[0,0,0],[0,2,0]]
end
## @lc test=end

## @lc info=start
# link: [solution to 733](https://leetcode-cn.com/problems/flood-fill/solution/733-tu-xiang-xuan-ran-by-rex-rs-fod6/)
## @lc info=end

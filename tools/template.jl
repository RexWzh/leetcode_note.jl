#!/usr/local/bin/julia

using InteractiveUtils
function get_title(title::String)
    title = strip(title) # 去除空格等字符
    # !' ' in title && return title # 已处理过
    ind, name = split(title, '.')
    name = replace(strip(name), ' ' => '-')
    println("Title name: $ind.$name.jl")
    ind, name
end

print("输入标题，生成空白模板：")
ind, name = get_title(readline())
title = "$ind.$name.jl"

text = """## @lc test=start
@testset "$title" begin
    @test 
end
## @lc test=end

## @lc info=start
# link: [solution to $ind]()
## @lc info=end"""
clipboard(text)

println("内容已复制到剪贴板")
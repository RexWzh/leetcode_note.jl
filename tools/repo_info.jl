#!/usr/local/bin/julia
# author: zhwang
# date: 2022-03-01
# description: 分析主仓库的解答文件，比如统计作者名和提交总数之类。

function get_info(body::AbstractString)
    ## 获取代码内容
    code_reg = r"## @lc code=start\n([\s\S]*)\n## @lc code=end"
    code = match(code_reg, body)
    isnothing(code) && throw("未识别到代码内容")
    code = code.captures[1]
    ## 获取函数内容
    func_reg1 = r"^function (\w+!?\([\w:{}, ]*\))"
    func_reg2 = r"^(\w+!?\([\w:{}, ]*\))[\w: ]*="
    funcs = String[]
    for line in split(code, '\n')
        (func = match(func_reg1, line)) ≢ nothing && push!(funcs, func.captures[1])
        (func = match(func_reg2, line)) ≢ nothing && push!(funcs, func.captures[1])
    end
    ## 获取信息部分
    author = match(r"# author: ([\w ]+)", body).captures[1]
    date = match(r"# date: ([\w-]+)", body).captures[1]
    any(isempty, [date, author]) && throw("未检索到信息！")
    (code, unique!(funcs)), (author, date)
end

### 检查和准备阶段 ###
## 检查脚本位置 ##
cd(Base.source_dir()[1:end-5])
current_files = readdir()
!all(file in current_files for file in ["src", "tools"]) && throw("脚本位置有误")
## 获取主仓库文件信息 ##
println("检查主仓库的函数信息")
main_problem_path = "../LeetCode.jl/src/problems/"
main_problems = readdir(main_problem_path)
isempty(main_problems) && throw("未能读取到主仓库文件，脚本位置有误")
deleteat!(main_problems, length(main_problems)) ## 忽略 problems.jl
sort!(main_problems; by=i -> parse(Int, split(i, '.')[1]))
total_num = length(main_problems)

### 提取阶段 ###
# Idnig, 1008, Indig, 91, 918
main_texts = String[]
for file in main_problems
    # println("正在读取文件 $file")
    push!(main_texts, read(open(main_problem_path * file, "r"), String))
    _, (author, _) = get_info(main_texts[end])
end 

### 统计作者和次数 ###
authors = Dict{String, Int}()
for text in main_texts
    _, (author, _) = get_info(text)
    if haskey(authors, author)
        authors[author] += 1
    else
        authors[author] = 1
    end
end

println("读取完毕，共 $(total_num) 个文件，共 $(length(authors)) 个作者提交了解答：")
println("
| author \t| number of commits |
| :----: \t| :--------------: |")
for (author, i) in authors
    println("| $author \t| $i |")
end


#!/usr/local/bin/julia
# author: zhwang
# date: 2022-03-01
# description: 检查待提交文件中的信息，函数名等，并生成函数信息文件 --- 已有函数信息 ---

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
cd(Base.source_dir()[1:end-5])
current_files = readdir()
!all(file in current_files for file in ["src", "tools"]) && throw("Script file misplacing: could not find source path `src/`")

problem_path = "submit/problems/"
test_path = "submit/test/"
problems, tests = readdir.([problem_path, test_path])
isempty(problems) && throw("问题集为空，请检查！")
problems != tests && throw("问题集和测试集不匹配，请检查")
sort!(problems; by=i -> parse(Int, split(i, '.')[1]))
num = length(problems)

### 获取信息 ###
codes, authors, dates, funcs = String[], String[], String[], Vector{String}[]
for file in problems
    # println("正在处理文件 $file")
    content = read(open(problem_path * file, "r"), String)
    (code, func), (author, date) = get_info(content)
    isempty(func) && throw("未识别到函数：$file")
    push!.([authors, dates, codes], [author, date, code])
    append!(funcs, [func])
end 
println("识别完毕，一共 $num 个文件")

### 检查信息 ###
a = findfirst(i->authors[i]!="zhwang", 1:num)
!isnothing(a) && throw("作者信息错误：$(file[a])")
a = findfirst(i->!occursin(r"2022-\d\d-\d\d", dates[i]), 1:num)
!isnothing(a) && throw("日期未修改：$(file[a])")
println("日期和作者名称检查完毕")

### 检查函数信息 ###
# 1. 检查函数派发是否重复信息
# 2. 输出函数名
func_name(func::String) = replace(func, r"(?<name>\w*!?)\(.*\)" => s"\g<name>")
func_method(func::String) = replace(func, r"(?<sym>[(, ]\w+)::[\w{}]+" => s"\g<sym>")

output = "submit/local_functions.md"
io = open(output, "w")
println(io, "# 基本信息\n## 新提交的函数名\n")
println(io, "| 问题编号 | 函数名 |\n| :---: | :---: |")

for (i, file) in enumerate(problems)
    ind = split(file, '.')[1]
    func = unique(func_name.(funcs[i]))
    for f in func
        println(io, "| $ind | `$f` |")
    end
end

println(io, "\n## 函数方法\n")
println(io, "| 问题编号 | 函数方法 |\n| :---: | :---: |")

for (i, file) in enumerate(problems)
    ind = split(file, '.')[1]
    func = unique(func_method.(funcs[i]))
    for f in func
        println(io, "| $ind | `$f` |")
    end
end

close(io)
println("写入完毕，文件保存在 $output 中")

# ## 获取全局信息
# println("检查主仓库的函数信息")
# main_problem_path = "../LeetCode.jl/src/problems/"
# main_problems = readdir(main_problem_path)
# isempty(main_problems) && throw("未能读取到主仓库文件")
# deleteat!(main_problems, length(main_problems))
# sort!(main_problems; by=i -> parse(Int, split(i, '.')[1]))
# total_num = length(main_problems)

# main_funcs = Vector{String}[]
# fails = String[]
# for file in main_problems
#     # println("正在处理文件 $file")
#     content = read(open(main_problem_path * file, "r"), String)
#     (_, func), _ = get_info(content)
#     if isempty(func)
#         println("未识别到函数：$file")
#         push!(fails, file)
#     else
#         append!(main_funcs, [func])
#     end
# end 
# println("识别完毕，$(total_num - length(fails)) 个文件成功识别，$(length(fails)) 个文件识别失败")

# for i in fails
#     print(stdout, i)
# end
# for (i, file) in enumerate(main_problems)
#     file in fails && deleteat!(main_problems, i)
# end

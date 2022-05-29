#!/usr/local/bin/julia
# author: zhwang
# date: 2022-03-01
# description: 文件批量移动脚本，配合 leetcode_note.jl/tools/format_convert.jl 使用，前者生成文件，后者负责移动和提交

cd(Base.source_dir())
files = readdir()
!("leetcode_note.jl" in files) || !("LeetCode.jl" in files) && throw("当前路径出错")

## 文件路径
submit_problems_path = "leetcode_note.jl/submit/problems/"
submit_test_path = "leetcode_note.jl/submit/test/"
problems_path = "LeetCode.jl/src/problems/"
unresolved_path = "LeetCode.jl/src/unresolved/"
test_path = "LeetCode.jl/test/problems/"

## 检查文件是否齐全
reviewed_problems = readdir("leetcode_note.jl/src/reviewed/")
sort!(reviewed_problems; by=i->parse(Int, split(i, '.')[1]))
pfiles = readdir(submit_problems_path)
tfiles = readdir(submit_test_path)
!all(file in pfiles && file in tfiles for file in reviewed_problems) && throw("部分文件未追踪")

problems = readdir(problems_path)
unresolved = readdir(unresolved_path)
tests = readdir(test_path)
print("待处理文件一共$(length(reviewed_problems))个，回车确认：")
readline()
for file in reviewed_problems
    println("正在处理文件$file")
    file in unresolved ? rm(unresolved_path * file) : println("未解问题文件不存在：$file")
    file in problems && println("未解问题文件已存在：",file)
    file in tests && println("测试文件已存在$file")
    cp(submit_problems_path * file, problems_path * file, force=true)
    cp(submit_test_path * file, test_path * file, force=true)
end
println("操作成功，共提交 $(length(reviewed_problems)) 个问题：")
println(join([split(file,'.')[1] for file in reviewed_problems], " "))

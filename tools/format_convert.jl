#!/usr/local/bin/julia
# author: zhwang
# date: 2022-03-01
# description: 将模板代码转化为提交文件，模板放置路径为 `仓库/src/reviewed`，导出路径为 `仓库/submit/problems` 和 `仓库/submit/test`

### 检查和准备阶段 ###
cd(Base.source_dir()[1:end-5])
current_files = readdir()
!all(file in current_files for file in ["src", "tools"]) && throw("脚本文件位置有误")

reviewed_path = "src/reviewed/"
reviewed_files = readdir(reviewed_path)
isempty(reviewed_files) && throw("请将文件放在 src/reviewed 目录下")
mkpath.(["submit", "submit/problems", "submit/test"]) # 创建目录

function get_data(content::String)
    ## 获取测试代码
    test_reg = r"## @lc test=start\n([\s\S]*)\n## @lc test=end"
    test = match(test_reg, content)
    isnothing(test) && throw("未识别到测试信息")
    ## 获取正文代码
    body_reg = r"[\s\S]*## @lc code=end"
    body = match(body_reg, content)
    isnothing(body) && throw("未识别到正文内容")
    return body.match, test.captures[1]
end

### 生成文件 ###
problem_path = "submit/problems/"
test_path = "submit/test/"
for file in reviewed_files
    println("正在处理文件 $file")
    content = read(open(reviewed_path * file, "r"), String)
    body, test = get_data(content)
    open(problem_path * file, "w") do io
        write(io, body)
    end
    open(test_path * file, "w") do io
        write(io, test)
    end
end
println("文件处理完毕，一共写入 $(length(reviewed_files)) 个文件")

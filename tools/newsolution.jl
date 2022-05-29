#!/usr/bin/env julia
# author: zhwang
# date: 2022-04-04
# description: Julia script for creating temp solution; input the order of the problem and it will return a template.

######### initialize #########
## checking the location of this script
cd(Base.source_dir()) # 进入脚本目录
path = "../../LeetCode.jl/" # 仓库相对路径
repofiles = readdir(path)
all(in(repofiles).(["src", "docs", "test"])) ||
    throw("Couldn't find repo files: the script file should be placed in LeetCode.jl/tools/")

## input/output directory
unsolved_problems_dir = path*"src/unresolved/"
solved_problems_dir = path*"src/problems/"
solved_tests_dir = path*"test/problems/"
output_dir = "./presolution/"
mkpath(output_dir)

## repo information
solveds = filter!(!=("problems.jl"), readdir(solved_problems_dir))
tests = filter!(!=("problems.jl"), readdir(solved_tests_dir))
unsolves = readdir(unsolved_problems_dir)

## local testing: each solution is associated with one test
for file in solveds
    file in tests || throw("Solution to $(file) has no test")
end
length(solveds) == length(tests) || throw("TestError: Some tests are redundant")

## user info
".config" ∈ readdir(".") || touch(".config")
config = read(open(".config"), String)
author = match(r"author: (.*)", config)
if !isnothing(author)
    author = author.captures[1]
else
    print("This is your first time to run this script, input author name here:")
    author = readline()
    io = open(".config", "w")
    write(io, "author: $author")
    close(io)
end
date = strip(read(`date "+%Y-%m-%d"`, String))


######### locate target file #########
print("Enter problem index: ")
ind = lstrip(readline(), '0')
## check repo solutions
for file in solveds
    split(file, '.', keepempty=false)[1] == ind && throw("Solution to $(ind) already exist: $(file)")
end
## get filename
filename = ""
for file in readdir(unsolved_problems_dir)
    split(file, '.', keepempty=false)[1] == ind && (global filename = file; break)
end
indnum = parse(Int, ind)
isempty(filename) && indnum <= 1681 && throw("Sorry, membership questions are not supported")
indnum > 1681 && throw("Problems with index exceeding 1681 are not supported yet")
println("File recognized: $filename")
filename in readdir(output_dir) && throw("Local solution to $(ind) already exist! Please check again.")


######### output template file #########
## original text
text = read(open(unsolved_problems_dir * filename, "r"), String)
## edit author/date
if isempty("author") ## no author
    text = replace(text, r"# author: .+\n" => "")
else
    text = replace(text, r"(?<=# author: )(.+)" => author)
end
text = replace(text, r"(?<=# date: )(.+)" => date)
text = replace(text, "## add your code here:" => "")
## add test
text *= """
## @lc test=start
using Test
@testset "$filename" begin
    @test 
end
## @lc test=end"""

## write file
io = open(output_dir * filename, "w")
write(io, text)
close(io)
println("Template succesfully generated
##############################
output directory: $(output_dir)
filename: $(filename)
author: $(isempty(author) ? "None" : author)
date: $date
##############################")
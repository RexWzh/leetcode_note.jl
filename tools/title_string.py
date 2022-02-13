#!/usr/bin/python3
import pyperclip
txt = input("在此处粘贴字符串")
ind, content = txt.split(".")
content = content.strip() # 去掉首尾空格
content = content.replace(" ", "-").lower()
txt = ind + "." + content + '.jl'
pyperclip.copy(txt)
print(txt)
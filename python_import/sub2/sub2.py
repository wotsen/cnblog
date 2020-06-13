# 相对路径导入(实际上会添加sub2前缀，这个前缀是当前目录名称)，只能导入下级文件，不能使用../
from .nsub import nsub
# 绝对路径导入
from sub1 import sub1

import os, json

MY_NAME = "ywl"

print(__name__)
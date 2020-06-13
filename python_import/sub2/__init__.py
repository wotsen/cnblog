# 取别名，在导入sub2 时则可直接使用sub2.n_name
from .sub2 import MY_NAME as n_name
# 与导入包，可直接使用sub2.match 来使用
from re import match
# 限定子模块,在使用from sub2 import *
__all__ = ['nsub']
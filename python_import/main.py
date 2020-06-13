from sub1 import sub1
import sub2
from sub2 import *

sub2.match(r".*", "xxxx")
print(sub2.n_name)

if "__main__" == __name__:
    print(__name__)
    
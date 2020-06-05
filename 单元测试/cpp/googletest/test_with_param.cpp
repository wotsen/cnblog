#include <gtest/gtest.h>
#include <iostream>
#include <vector>
#include <list>

using namespace std;

// 关于参数化，主要是对于同一种测试，只是参数不同，断言都是一样的，这样写多行代码显得十分麻烦
//
// 这里得也不是最全面的，更多要参考官方文档和示例

TEST(WithParam, show) {
    // 繁琐的写法，一百个怎么办
    EXPECT_TRUE(2);
    EXPECT_TRUE(3);
    EXPECT_TRUE(4);
    EXPECT_TRUE(5);
}

// 好的方式是给数据，断言写一次就好
//
// gtest有这样的简便操作
// 你必须添加一个类，继承testing::TestWithParam<T>，其中T就是你需要参数化的参数类型

// 这里将类型指定为int
class IsPrimeParamTest : public testing::TestWithParam<int>
{

};

// parameterized,大概是这个宏P的缩写吧
// 首先第一个参数必须是这个类
TEST_P(IsPrimeParamTest, HandleTrueReturn)
{
    // GetParam方法是内置的，用于获取参数
    // 会发现这个测试用例会执行多次
    int n = GetParam();
    cout << "n = [" << n << "]" << endl;
    EXPECT_TRUE(n);
}

// 使用INSTANTIATE_TEST_CASE_P这宏来告诉gtest你要测试的参数范围，要注意的是一个测试用例只能添加一次
//
// 第一个参数是测试用例的前缀，可以任意取
// 第二个参数是测试用例的名称，需要和之前定义的参数化的类的名称相同，如：IsPrimeParamTest 
// 第三个参数是可以理解为参数生成器，上面的例子使用test::Values表示使用括号内的参数。Google提供了一系列的参数生成的函数
/*
 | Range(begin, end[, step])                      | 范围在begin~end之间，步长为step，不包括end                   |
 | ---------------------------------------------- | ------------------------------------------------------------ |
 | Values(v1, v2, ..., vN)                        | v1,v2到vN的值,枚举                                           |
 | ValuesIn(container) and ValuesIn(begin, end)   | 从一个C类型的数组或是STL容器，或是迭代器中取值               |
 | Bool()                                         | 取`false 和 true 两个值`                                     |
 | Combine(g1, g2, ..., gN)                       | 这个比较强悍，它将g1,g2,...gN进行排列组合，g1,g2,...gN本身是一个参数生成器，
                                                    每次分别从g1,g2,..gN中各取出一个值，组合成一个元组(Tuple)作为一个参数。
                                                    说明：这个功能只在提供了`<tr1/tuple>头的系统中有效。
                                                    gtest会自动去判断是否支持tr/tuple，如果你的系统确实支持，
                                                    而`gtest判断错误的话，你可以重新定义宏`GTEST_HAS_TR1_TUPLE=1`。 |
 */
// INSTANTIATE_TEST_CASE_P(TrueReturn, IsPrimeParamTest, testing::Values(3, 5, 11, 23, 17));
//INSTANTIATE_TEST_CASE_P(TrueReturn, IsPrimeParamTest, testing::Range(3, 7));
const int serial_values[] = {1, 3, 5, 7, 9, 10, 11};
//INSTANTIATE_TEST_CASE_P(TrueReturn, IsPrimeParamTest, testing::ValuesIn(serial_values));

vector<int> v_values(4, 2);
INSTANTIATE_TEST_CASE_P(TrueReturn, IsPrimeParamTest, testing::ValuesIn(v_values.begin(), v_values.end()));

class IsPrimeParamTestBool : public::testing::TestWithParam<bool>
{

};

TEST_P(IsPrimeParamTestBool, HandleTrueReturnBool)
{
    bool n = GetParam();
    EXPECT_TRUE(n);
}
INSTANTIATE_TEST_CASE_P(TrueReturn, IsPrimeParamTestBool, testing::Bool());

int main(int argc, char ** argv)
{
    testing::InitGoogleTest(&argc, argv);

    return RUN_ALL_TESTS();
}

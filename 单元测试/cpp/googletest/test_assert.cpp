#include <gtest/gtest.h>
#include <iostream>

using namespace std;

TEST(TestAssert, example_case) {
  EXPECT_EQ(9, 9);
  // ASSERT_EQ(8, 9); // 会退出
  ASSERT_EQ(9, 9);
}

TEST(TestAssert, add_cout) {
  array<int, 6> arr = {1, 2, 3, 4, 5, 6};

  for (int i = 0; i < arr.size(); i++) {
    EXPECT_NE(arr[i], i+1) << ", index = [" << i << "]" << endl; // 后面追加打印，不过只有出错时才会有打印
  }
}

TEST(TestAssert, ch_string) {
  // *STREQ*和*STRNE*同时支持char*和wchar_t*类型的，*STRCASEEQ*和*STRCASENE*却只接收char*，估计是不常用吧。
    char* pszCoderZh = "CoderZh";
    wchar_t* wszCoderZh = L"CoderZh";
    std::string strCoderZh = "CoderZh";
    std::wstring wstrCoderZh = L"CoderZh";

    EXPECT_STREQ("CoderZh", pszCoderZh);
    EXPECT_STREQ(L"CoderZh", wszCoderZh);

    EXPECT_STRNE("CnBlogs", pszCoderZh);
    EXPECT_STRNE(L"CnBlogs", wszCoderZh);

    EXPECT_STRCASEEQ("coderzh", pszCoderZh);
    // EXPECT_STRCASEEQ(L"coderzh", wszCoderZh); //    不支持

    EXPECT_STREQ("CoderZh", strCoderZh.c_str());
    EXPECT_STREQ(L"CoderZh", wstrCoderZh.c_str());
}

TEST(TestAssert, priv_result) {
  // 自己决定成功或失败
    ADD_FAILURE() << "Sorry"; // None Fatal Asserton，继续往下执行。

    // FAIL(); // Fatal Assertion，不往下执行该用例。

    SUCCEED();
}

int Foo(int a, int b) {
    if (0 == a|| 0 == b) {
        throw "don't do that";
    }

    int c = a % b;

    if (0 == c)
        return b;
    return Foo(b, c);
}

TEST(TestAssert, HandleZeroInput) {
    EXPECT_ANY_THROW(Foo(10, 0));

    EXPECT_THROW(Foo(0, 5), char*); // 希望返回一个char *的异常
}

bool MutuallyPrime(int m, int n) {
    return m > n;
}

TEST(TestAssert, param) {
    int m = 5, n = 6;
    // 自带断言，当函数返回为假时，会出错，并且把传入的这两个参数的值给打印出来，
    // 注意:这个这个宏定义族最多5个参数
    EXPECT_PRED2(MutuallyPrime, m, n); 
    m = 7;
    n = 6;
    EXPECT_PRED2(MutuallyPrime, m, n);
}

testing::AssertionResult AssertFoo(const char* m_expr, const char* n_expr, const char* k_expr, int m, int n, int k) {
  // 成倍的参数个数，不过前半表示后半的原始值
    if (Foo(m, n) == k)
        return testing::AssertionSuccess();
    testing::Message msg;
    msg << m_expr << " 和 " << n_expr << " 的最大公约数应该是：" << Foo(m, n) << " 而不是：" << k_expr;
    return testing::AssertionFailure(msg);
}

TEST(TestAssert, pretty_cout) {
  // 和前面的类似，不过输出更灵活
    EXPECT_PRED_FORMAT3(AssertFoo, 3, 6, 2);
}
/*
template <typename T> class FooType {
public:
    void Bar() { testing::StaticAssertTypeEq<int, T>(); }
};

// 类型检查，检查不通过会编译不通过，并且给出错误信息

TEST(TestAssert, type_check) {
    FooType<bool> fooType;
    fooType.Bar();
}
*/

TEST(TestAssert, running) {
  // PASS
}

int main(int argc, char ** argv)
{
  testing::InitGoogleTest(&argc, argv);

  return RUN_ALL_TESTS();
}

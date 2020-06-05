#include <gtest/gtest.h>
#include <iostream>

using namespace std;
// 关于事件
// 在运行测试用例时可能说需要在整个测试前后、TestSuite前后、TestCase前后添加一些特定的操作:setUp、TearsDown
// 这是后就需要用到事件机制了

/*
 * - 全局的，所有案例执行前后
 * - TestSuite级别的，在某一批案例(组，集)中第一个案例前，最后一个案例执行后
 * - TestCase级别的，每个TestCase前后
 * */

// 全局
// 要实现全局事件，必须写一个类，继承testing::Environment类，实现里面的SetUp和TearDown方法。
// SetUp()方法在所有案例执行前执行
// TearDown()方法在所有案例执行后执行

// 我们还需要告诉gtest添加这个全局事件，我们需要在main函数中通过testing::AddGlobalTestEnvironment方法将事件挂进来，也就是说，我们可以写很多个这样的类，然后将他们的事件都挂上去。
class FooEnvironment : public testing::Environment
{
public:
    virtual void SetUp()
    {
        std::cout << "Foo FooEnvironment SetUp" << std::endl;
    }
    virtual void TearDown()
    {
        std::cout << "Foo FooEnvironment TearDown" << std::endl;
    }
};

// TestSuite事件
// 需要写一个类，继承testing::Test，然后实现两个静态方法
// SetUpTestCase() 方法在第一个TestCase之前执行
// TearDownTestCase() 方法在最后一个TestCase之后执行

class FooTest : public testing::Test {
 protected:
  static void SetUpTestCase() {
    shared_resource_ = new int(5);
    cout << "FooTest SetUpTestCase" << endl;
  }
  static void TearDownTestCase() {
    delete shared_resource_;
    shared_resource_ = NULL;
    cout << "FooTest TearDownTestCase" << endl;
  }
  // Some expensive resource shared by all tests.
  // 测试用例之间共享的数据
  static int* shared_resource_;
};

int * FooTest::shared_resource_ = nullptr;

// 在编写测试案例时，我们需要使用TEST_F这个宏，第一个参数必须是我们上面类的名字，代表一个TestSuite。

TEST_F(FooTest, Test1)
{
  // 直接使用就可以了
  cout << "Test1 : val = " << *shared_resource_ << endl;
  *shared_resource_ = 9;
}

TEST_F(FooTest, Test2)
{
  cout << "Test2 : val = " << *shared_resource_ << endl;
}

// TestCase事件 
// TestCase事件是挂在每个案例执行前后的，实现方式和上面的几乎一样，不过需要实现的是SetUp方法和TearDown方法：
// SetUp()方法在每个TestCase之前执行
// TearDown()方法在每个TestCase之后执行

class FooCalcTest:public testing::Test
{
class FooCalc{
  public:
    void Init(void) {}

    int Calc(int a, int b) {
      return a + b;
    }

    void Finalize(void) {}
};
protected:
    virtual void SetUp()
    {
      cout << "FooCalcTest SetUp" << endl;
        m_foo.Init();
    }
    virtual void TearDown()
    {
      cout << "FooCalcTest TearDown" << endl;
        m_foo.Finalize();
    }

    FooCalc m_foo;
};

TEST_F(FooCalcTest, calc1)
{
    EXPECT_EQ(28, m_foo.Calc(12, 16));
}

TEST_F(FooCalcTest, calc2)
{
    EXPECT_EQ(17, m_foo.Calc(1, 16));
}

int main(int argc, char** argv)
{
  // 添加全局的setUp和tearDown
  testing::AddGlobalTestEnvironment(new FooEnvironment);

  testing::InitGoogleTest(&argc, argv);

  return RUN_ALL_TESTS();
}

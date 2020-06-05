# `C`语言单元测试框架

这里的`C`语言单元测试框架使用`google`的`cmockery`。[地址](https://github.com/google/cmockery)

## 1. 编译安装

- 下载源码:
    ```shell
    git clone https://github.com/google/cmockery
    ```

- 编译安装:
    ```shell
    ./configure
    make && make install
    ```
## 2. 框架使用详解

### 2.1 简单示例及模板

1. 简单示例查看`demo`， 源码`demo.c`:
    ```c
    #ifdef UNIT_TESTING

    #include <stdarg.h>
    #include <stdio.h>
    #include <stddef.h>
    #include <setjmp.h>
    #include <string.h>
    #include <inttypes.h>
    #include <google/cmockery.h>

    static void test(void **state)
    {
    	printf("%s %d\n", __func__, __LINE__);
    }

    int main(int argc, char ** argv)
    {
    	UnitTest tests[] = {
    		unit_test(test),
    		unit_test_setup_teardown(test, NULL, NULL),
    	};

    	return run_tests(tests);
    }

    #endif
    ```
    
    编译`buid.sh`:
    ```shell
    gcc demo.c -o demo  -DUNIT_TESTING -lcmockery -lpthread
    ```
    编译时添加`cmockery`库:`-lcmockery`，该库依赖于线程库`-lpthread`.

    运行结果:
    ```shell
    test: Starting test

    test 11
    test: Test completed successfully.

    test: Starting test

    test 11
    test: Test completed successfully.

    All 2 tests passed
    ```

2. 模板，查看`exmaple`文件夹。

### 2.2 断言

1. 提供`mock_assert`函数，用于覆盖标准库的`assert`函数，避免直接终止程序：
    ```c
    // If unit testing is enabled override assert with mock_assert().
    #if UNIT_TESTING
    extern void mock_assert(const int result, const char* const expression,const char * const file, const int line);
    #undef assert
    #define assert(expression) \
        mock_assert((int)(expression), #expression, __FILE__, __LINE__);
    #endif // UNIT_TESTING
    ```
    
    所以写单元测试时可以这样定义`assert`接口，避免默认行为。

2. 单元测试提供一组断言宏用于断言各种表达式：
    ```c
    assert_true(c)
    assert_false(c)
    assert_int_equal(a, b)
    assert_int_not_equal(a, b)
    assert_string_equal(a, b)
    assert_string_not_equal(a, b)
    assert_memory_equal(a, b, size)
    assert_memory_not_equal(a, b, size)
    assert_in_range(value, minimum, maximum)
    assert_not_in_range(value, minimum, maximum)
    assert_in_set(value, values, number_of_values)
    assert_not_in_set(value, values, number_of_values)
    ```

    使用方式：
    ```c
    #define RUN_TEST(expr) printf("%s\n", #expr); expr

    static void test(void **state)
    {
    	RUN_TEST(assert_false(false));
    	RUN_TEST(assert_true(true));

    	RUN_TEST(assert_int_equal(1, 1));
    	RUN_TEST(assert_int_not_equal(1, 2));

    	RUN_TEST(assert_memory_equal("test", "test", sizeof("test")));
    	RUN_TEST(assert_memory_not_equal("test", "tes2", sizeof("test")));

    	RUN_TEST(assert_string_equal("test", "test"));
    	RUN_TEST(assert_string_not_equal("test", "tes2"));

    	RUN_TEST(assert_in_range(2, 1, 4));
    	RUN_TEST(assert_not_in_range(5, 1, 4));

    	long long sets[] = {1, 10, 6, 4}; // 这里只支持这种类型
    	RUN_TEST(assert_in_set(10, sets, 4));
    	RUN_TEST(assert_in_set(1, sets, 4));
    	RUN_TEST(assert_in_set(6, sets, 4));
    	RUN_TEST(assert_in_set(4, sets, 4));
    	RUN_TEST(assert_not_in_set(11, sets, 4));
    }
    ```

### 2.3 内存申请与释放测试

用于测试用例内的内存操作不当，比如内存未释放，非法地址访问。
此处会重新定义一组内存操作接口用于覆盖`malloc`,`calloc`,`free`:
```c
#if UNIT_TESTING
extern void* _test_malloc(const size_t size, const char* file, const int line);
extern void* _test_calloc(const size_t number_of_elements, const size_t size,const char* file, const int line);
extern void _test_free(void* const ptr, const char* file, const int line);
#define malloc(size) _test_malloc(size, __FILE__, __LINE__)
#define calloc(num, size) _test_calloc(num, size, __FILE__, __LINE__)
#define free(ptr) _test_free(ptr, __FILE__, __LINE__)
#endif // UNIT_TESTING
```

示例：
```c
// extern void* _test_malloc(const size_t size, const char* file, const int line);
// extern void* _test_calloc(const size_t number_of_elements, const size_t size,const char* file, const int line);
// extern void _test_free(void* const ptr, const char* file, const int line);
#define malloc(size) _test_malloc(size, __FILE__, __LINE__)
#define calloc(num, size) _test_calloc(num, size, __FILE__, __LINE__)
#define free(ptr) _test_free(ptr, __FILE__, __LINE__)

#include <assert.h>

// extern void mock_assert(const int result, const char* const expression,
//                         const char * const file, const int line);
#undef assert
#define assert(expression) \
    mock_assert((int)(expression), #expression, __FILE__, __LINE__);

void mem_test1(void)
{
	char *ptr = NULL;

	// assert(ptr);

	// *ptr = 9;
}

void mem_test2(void)
{
	char *ptr = (char *)malloc(20);
}

void mem_test3(void)
{
	free(NULL);
}

static void test_memory(void **state)
{
	// expect_assert_failure(mem_test1());
	expect_assert_failure(mem_test2());
	expect_assert_failure(mem_test3());
}
```

其中`expect_assert_failure`可用于表示预期该测试会失败,配合`assert`使用。

### 2.4 模拟测试

模拟测试是用于要测试的代码依赖外部接口，但是外部接口没有被实现，这时就需要用到模拟测试，模拟外部接口的参数输入，返回值等等。

1. 通过`expect_value`和`check_expected`可以判断传入函数的值是不是期望的值;
2. `will_return`和`mock`则是对应的关系，`will_return`会将值放入到队列中，而每次调用`mock`都会取到队列前端的值。

```c
int mock_mock(int age, char *name)
{
	check_expected(age);
	check_expected(name);

	return (int)mock();
}

static void test_mock(void **state)
{
	expect_value(mock_mock, age, 18);
	expect_string(mock_mock, name, "wotsen");
	will_return(mock_mock, 18);

	assert_int_equal(mock_mock(18, "wotsen"), 18);
}
```

### 2.5 `setup`与`teardown`

某些测试用例可能需要测试前后做一些配置操作，这时后就需要`setup`和`teardown`。测试用例的添加方式也有所不同：
```c
unit_test_setup_teardown(test, setup, teardown),
```

例如:
```c
static void test_setup(void **state)
{
	char *ptr = (char *)malloc(20);

	sprintf(ptr, "test wotsen");

	*state = ptr;

	printf("setup................\n");
}

static void test_teardown(void **state)
{
	printf("teardown................\n");

	printf("state : %s\n", (char *)*state);
}

static void test_setup_teardown(void **state)
{
	free(*state);
	printf("testing............\n");
}

int main(int argc, char ** argv)
{
	UnitTest tests[] = {
		unit_test(test_assert),
		unit_test(test_memory),
		unit_test(test_mock),
		unit_test_setup_teardown(test_setup_teardown, test_setup, test_teardown),
	};
...
```

另外参数中的`state`可以用于他们之间的数据传输.

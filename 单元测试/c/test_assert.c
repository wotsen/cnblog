
#include <stdarg.h>
#include <stdio.h>
#include <stddef.h>
#include <setjmp.h>
#include <string.h>
#include <inttypes.h>
#include <stdbool.h>
#include <google/cmockery.h>

#define RUN_TEST(expr) printf("%s\n", #expr); expr

static void test_assert(void **state)
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

	return run_tests(tests);
}
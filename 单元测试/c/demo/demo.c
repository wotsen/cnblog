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
#include <dlfcn.h>
#include <stdio.h>

typedef void (*ex_fn)(void);

int main(void)
{
	void* ex_lib = dlopen("./libtestlib.so", RTLD_LAZY);

	if (!ex_lib)
	{
		printf("error : %s\n", dlerror());
		return -1;
	}

	ex_fn ex_test = (ex_fn)dlsym(ex_lib, "testlib");

	if (!ex_test)
	{
		printf("error : %s\n", dlerror());
		dlclose(ex_lib);
		return -1;
	}

	ex_test();

	dlclose(ex_lib);

	return 0;
}
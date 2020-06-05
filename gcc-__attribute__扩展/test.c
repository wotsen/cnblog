#include <stdio.h>

// void *malloc(size_t size) __attribute__((alias("mymalloc"), used));

// void *mymalloc(size_t size)
// {
// 	printf("my malloc.\n");
// 	return NULL;
// }

extern int test_var __attribute((alias("__name")));
int __name = 10;

void newprint(size_t size) __attribute__((alias("oldprint")));

void oldprint(size_t size)
{
	printf("input : %zu.\n", size);
	printf("test_var : %d.\n", test_var);
}

int con_val(int a) __attribute__((const));

int con_val(int a)
{
	return a*a;
}

void con_val_test(void)
{
	for (int i = 0; i < 5; i++)
	{
		printf("con_val : %d.\n", con_val(100));
	}
}

struct demo_aligned {
	char i;
	char j;
	int k;
	int l;
}__attribute__((aligned(8)));	// 指定8字节对齐

struct demo {
	char i;
	char j;
	int k;
	int l;
	double m;
}__attribute__((packed));

int main()
{
	newprint(30);
	con_val_test();
	printf("demo_aligned size : %zu.\n", sizeof(struct demo_aligned));
	printf("demosize : %zu.\n", sizeof(struct demo));
	return 0;
}
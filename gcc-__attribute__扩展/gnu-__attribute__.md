# `gnu`扩展之`__attribute__`

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [`gnu`扩展之`__attribute__`](#gnu扩展之__attribute__)
  - [1 简介](#1-简介)
  - [2 函数属性](#2-函数属性)
    - [2-1 `access`](#2-1-access)
    - [2-2 `alias`[*]](#2-2-alias)
    - [2-3 `aligned`](#2-3-aligned)
    - [2-4 `alloc_align`](#2-4-alloc_align)
    - [2-5 `alloc_size`](#2-5-alloc_size)
    - [2-6 `always_inlines`](#2-6-always_inlines)
    - [2-7 `assume_aligned`](#2-7-assume_aligned)
    - [2-8 `cold`](#2-8-cold)
    - [2-9 `const`[*]](#2-9-const)
    - [2-10 `constructor`[*]](#2-10-constructor)
    - [2-11 `destructor`[*]](#2-11-destructor)
    - [2-12 `copy`](#2-12-copy)
    - [2-13 `deprecated`[*]](#2-13-deprecated)
    - [2-14 `error`[*]](#2-14-error)
    - [2-15 `warning`](#2-15-warning)
    - [2-16 `externally_visible`](#2-16-externally_visible)
    - [2-17 `flatten`](#2-17-flatten)
    - [2-18 `format`[*]](#2-18-format)
    - [2-19 `format_arg`](#2-19-format_arg)
    - [2-20 `gnu_inline`](#2-20-gnu_inline)
    - [2-21 `hot`](#2-21-hot)
    - [2-22 `ifunc`](#2-22-ifunc)
    - [2-23 `interrupt`与`interrupt_handler`](#2-23-interrupt与interrupt_handler)
    - [2-24 `leaf`](#2-24-leaf)
    - [2-25 `malloc`](#2-25-malloc)
    - [2-26 `no_icf`](#2-26-no_icf)
    - [2-27 `no_instrument_function`](#2-27-no_instrument_function)
    - [2-28 `no_reorder`](#2-28-no_reorder)
    - [2-29 `no_sanitize`](#2-29-no_sanitize)
    - [2-30 `no_sanitize_address`与`no_address_safety_analysis`](#2-30-no_sanitize_address与no_address_safety_analysis)
    - [2-31 `no_sanitize_thread`](#2-31-no_sanitize_thread)
    - [2-32 `no_sanitize_undefined`](#2-32-no_sanitize_undefined)
    - [2-33 `no_split_stack`](#2-33-no_split_stack)
    - [2-34 `no_stack_limit`](#2-34-no_stack_limit)
    - [2-35 `noclone`](#2-35-noclone)
    - [2-36 `noinline`](#2-36-noinline)
    - [2-37 `noipa`](#2-37-noipa)
    - [2-38 `nonnull`[*]](#2-38-nonnull)
    - [2-39 `noplt`](#2-39-noplt)
    - [2-40 `noreturn`[*]](#2-40-noreturn)
    - [2-41 `nothrow`](#2-41-nothrow)
    - [2-42 `optimize`](#2-42-optimize)
    - [2-43 `patchable_function_entry`](#2-43-patchable_function_entry)
    - [2-44 `pure`](#2-44-pure)
    - [2-45 `returns_nonnull`](#2-45-returns_nonnull)
    - [2-46 `returns_twice`](#2-46-returns_twice)
    - [2-47 `section`](#2-47-section)
    - [2-48 `sentinel`](#2-48-sentinel)
    - [2-49 `simd`](#2-49-simd)
    - [2-50 `stack_protect`](#2-50-stack_protect)
    - [2-51 `target`](#2-51-target)
    - [2-52 `symver`](#2-52-symver)
    - [2-53 `target_clones`](#2-53-target_clones)
    - [2-54 `unused`[*]](#2-54-unused)
    - [2-55 `used`[*]](#2-55-used)
    - [2-56 `visibility`](#2-56-visibility)
    - [2-57 `warn_unused_result`](#2-57-warn_unused_result)
    - [2-58 `weak`与`weakref`](#2-58-weak与weakref)
  - [3 变量属性](#3-变量属性)
    - [3-1 `alias`](#3-1-alias)
    - [3-2 `aligned`[*]](#3-2-aligned)
    - [3-3 `warn_if_not_aligned`](#3-3-warn_if_not_aligned)
    - [3-4 `alloc_size`](#3-4-alloc_size)
    - [3-5 `cleanup`](#3-5-cleanup)
    - [3-6 `common`与`nocommon`](#3-6-common与nocommon)
    - [3-7 `copy`](#3-7-copy)
    - [3-8 `deprecated`](#3-8-deprecated)
    - [3-9 `mode`](#3-9-mode)
    - [3-10 `nonstring`](#3-10-nonstring)
    - [3-11 `packed`[*]](#3-11-packed)
    - [3-12 `section`](#3-12-section)
    - [3-13 `tls_model`](#3-13-tls_model)
    - [3-14 `unused`](#3-14-unused)
    - [3-15 `used`](#3-15-used)
    - [3-16 `vector_size`](#3-16-vector_size)
    - [3-17 `visibility`](#3-17-visibility)
    - [3-18 `weak`](#3-18-weak)
    - [3-19 `noinit`](#3-19-noinit)
  - [4 类型属性](#4-类型属性)
    - [4-1 `aligned`](#4-1-aligned)
    - [4-2 `warn_if_not_aligned`](#4-2-warn_if_not_aligned)
    - [4-3 `alloc_size`](#4-3-alloc_size)
    - [4-4 `copy`](#4-4-copy)
    - [4-5 `deprecated`](#4-5-deprecated)
    - [4-6 `designated_init`](#4-6-designated_init)
    - [4-7 `may_alias`](#4-7-may_alias)
    - [4-8 `mode`](#4-8-mode)
    - [4-9 `packed`](#4-9-packed)
    - [4-10 `scalar_storage_order`](#4-10-scalar_storage_order)
    - [4-11 `transparent_union`](#4-11-transparent_union)
    - [4-12 `unused`](#4-12-unused)
    - [4-13 `vector_size`](#4-13-vector_size)
    - [4-14 `visibility`](#4-14-visibility)
  - [5 其他属性](#5-其他属性)
    - [5-1 枚举属性](#5-1-枚举属性)
      - [5-1-1 `deprecated`](#5-1-1-deprecated)
    - [5-2 标签属性](#5-2-标签属性)
    - [5-3 语句属性](#5-3-语句属性)
  - [6 平台相关](#6-平台相关)

<!-- /code_chunk_output -->

## 1 简介

> `gnu`支持对`c/c++`变量、函数、类型的声明属性扩展，使用关键字`__attribute__`进行说明，格式：
> `__attribute__((attribute-lists))`，例如：
>
> ```c
> int var __attribute__ ((__unused__));
> ```
>
> [官网](https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html)

注意：

- 放置在声明结尾的`;`之前，最少两对外括号，不能省;
- 对于属性名，可以在前后都加上双下划线（如`unused`和`__unused__`相同）， 防止和源码中定义的宏名冲突;
- `__attribute__`应用`c/c++`的声明语句里面， 而不是定义语句里面;
- 一次使用多个属性可重复使用`__attribute__`宏;
- 有些属性会在编译时给出警告，但这需要打开`–Wall`选项。

按照`attribute`语句作用的对象不同， 可以分为3类：

- 函数属性
- 变量属性
- 类型属性

## 2 函数属性

### 2-1 `access`

### 2-2 `alias`[*]

- 作用：为函数/变量取别名；
- 语法：`type newname __attribute__((alias(oldname)));`

如：

```c
extern int test_var __attribute((alias("__name")));
int __name = 10;

void newprint(size_t size) __attribute__((alias("oldprint")));

void oldprint(size_t size)
{
	printf("input : %zu.\n", size);
	printf("test_var : %d.\n", test_var);
}

int main()
{
	newprint(30);
  	return 0;
}
```

配合`weak`使用：若两个或两个以上全局符号（函数或变量名）名字一样，而其中之一声明为weak属性，则这些全局符号不会引发重定义错误。链接器会忽略弱符号，去使用普通的全局符号来解析所有对这些符号的引用，但当普通的全局符号不可用时，链接器会使用弱符号。当有函数或变量名可能被用户覆盖时，该函数或变量名可以声明为一个弱符号。

```c
void newprint(size_t size) __attribute__(weak, (alias("oldprint")));
```

在一些内存池实现方案中就用到这种特性覆盖`glibc`中的`malloc`，[参考](https://wallenwang.com/2018/11/tcmalloc/#ftoc-heading-11)。

### 2-3 `aligned`

### 2-4 `alloc_align`

### 2-5 `alloc_size`

### 2-6 `always_inlines`

### 2-7 `assume_aligned`

### 2-8 `cold`

### 2-9 `const`[*]

- 作用：函数调用优化；
  该属性只能用于带有数值类型参数的函数上。当重复调用带有数值参数的函数时，由于返回值是相同的，所以此时编译器可以进行优化处理，除了第一次需要运算外，其它只需要返回第一次的结果即可，从而提高了效率。该属性主要适用于没有静态状态 (static state) 和副作用的一些函数，并且返回值仅仅依赖输入的参数。
- 用法：`type name __attribute__((alias(const)));`

如：

```c
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
```

主要是用于优化相同参数的函数多次调用时，只进行一次调用；如果是不符合要求，则该属性没作用，比如用了全局变量，原因是函数过程无法预测。

### 2-10 `constructor`[*]

- 作用：用于指定该函数会在`main`函数开始之前执行；
- 用法：`type name __attribute__((alias(constructor[priority])));`。

`priority`用于指定优先级：0-100，值越小越先调用，可以配合`destructor`来控制构造和析构。

### 2-11 `destructor`[*]

- 作用：用于指定该函数会在`main`/`exit`函数结束之后执行。

### 2-12 `copy`

### 2-13 `deprecated`[*]

- 作用：用于标记该函数/变量已经过期了，最好不再使用。

在编译时会给警告。

### 2-14 `error`[*]

- 作用：用于标记该代码及调用错误或警告，如果该代码能编译(没被宏注释)，那么会报错误或警告信息，用于开发者去除该代码；
- 语法：`type name() __attribute__((error("need remove")));`

### 2-15 `warning`

同上。

### 2-16 `externally_visible`

### 2-17 `flatten`

### 2-18 `format`[*]

- 作用：用于格式化函数参数检查；
- 语法：`type name(char *format, ...) __attribute__((archetype, string-index, first-to-check));`
  - archtype  :  指定是哪种风格
  - string-index : 指定传入的第几个参数是格式化字符串
  - first-to-check : 指定从函数的第几个参数开始检查上述规则

参考：

```c
__attribute__((format(printf,m,n)));
__attribute__((format(scanf,m,n)));
```

```c
void self_printf(const char *format,...)__attribute__ ((format(printf,1,2)));

void self_printf(const char *format,...)
{
	// ...
}
```

可以在编译的时候帮助检查函数的格式和后续参数。

### 2-19 `format_arg`

### 2-20 `gnu_inline`

### 2-21 `hot`

### 2-22 `ifunc`

### 2-23 `interrupt`与`interrupt_handler`

### 2-24 `leaf`

### 2-25 `malloc`

### 2-26 `no_icf`

### 2-27 `no_instrument_function`

### 2-28 `no_reorder`

### 2-29 `no_sanitize`

### 2-30 `no_sanitize_address`与`no_address_safety_analysis`

### 2-31 `no_sanitize_thread`

### 2-32 `no_sanitize_undefined`

### 2-33 `no_split_stack`

### 2-34 `no_stack_limit`

### 2-35 `noclone`

### 2-36 `noinline`

### 2-37 `noipa`

### 2-38 `nonnull`[*]

- 作用：用于检查函数参数不能为空；
- 语法：`type name(void *dst, void *src) __attribute__((nonnull[(ar-index,...)]));`

```c
extern void * my_memcpy (void *dest, const void *src, size_t len) __attribute__((nonnull (1, 2)));
```

检查第一个和第二个参数，如果不指定则检查所有参数。

### 2-39 `noplt`

### 2-40 `noreturn`[*]

- 作用：表示函数不会返回；
- 语法：

如：

```c
int myexit(int x) __attribute__((noreturn));

int myexit(int x)
{
	if (x)
	{
		exit(x);
	}
	else
	{
		return 0;
	}
}
```

如果不加该属性，那么编译时会报警告。

### 2-41 `nothrow`

### 2-42 `optimize`

### 2-43 `patchable_function_entry`

### 2-44 `pure`

### 2-45 `returns_nonnull`

### 2-46 `returns_twice`

### 2-47 `section`

### 2-48 `sentinel`

### 2-49 `simd`

### 2-50 `stack_protect`

### 2-51 `target`

### 2-52 `symver`

### 2-53 `target_clones`

### 2-54 `unused`[*]

- 作用：用于表明该函数/变量即使未被使用，编译时也不会包警告。

### 2-55 `used`[*]

- 作用：像编译器说明即使该代码未被使用，也不要报警告，这段代码是有用的。

### 2-56 `visibility`

### 2-57 `warn_unused_result`

### 2-58 `weak`与`weakref`

## 3 变量属性

### 3-1 `alias`

### 3-2 `aligned`[*]

- 作用：用于变量与类型内存对齐，对比[`packed`](#3-11-packed)；
- 语法：`type __attribute__ ((aligned[(n)])`。

可以指定对齐字节数，如果不指定则没效果，默认。

```c
struct demo_aligned {
	char i;
	char j;
	int k;
	int l;
}__attribute__((aligned(8)));	// 指定8字节对齐

printf("demo_aligned size : %zu.\n", sizeof(struct demo_aligned)); // 16
```

### 3-3 `warn_if_not_aligned`

### 3-4 `alloc_size`

### 3-5 `cleanup`

### 3-6 `common`与`nocommon`

### 3-7 `copy`

### 3-8 `deprecated`

### 3-9 `mode`

### 3-10 `nonstring`

### 3-11 `packed`[*]

- 作用：用于变量和类型，用于变量或结构域时，表示使用最小可能的对齐，用于枚举、结构或联合类型时表示该类型使用最小的内存。如对于结构体，就是它告诉编译器取消结构在编译过程中的优化对齐，按照实际占用字节数进行对齐。定义多少用多少；
- 语法：
  ```c
  struct demo {
        char i;
        char j;
        int k;
        int l;
        double m;
  }__attribute__((packed));	// 18

  typedef structdemo1{
        char i;
        char j;
        int k;
        int l;
        double m;
  }__attribute__((packed)) test;
  ```

### 3-12 `section`

### 3-13 `tls_model`

### 3-14 `unused`

### 3-15 `used`

### 3-16 `vector_size`

### 3-17 `visibility`

### 3-18 `weak`

### 3-19 `noinit`

## 4 类型属性

### 4-1 `aligned`

### 4-2 `warn_if_not_aligned`

### 4-3 `alloc_size`

### 4-4 `copy`

### 4-5 `deprecated`

### 4-6 `designated_init`

### 4-7 `may_alias`

### 4-8 `mode`

### 4-9 `packed`

### 4-10 `scalar_storage_order`

### 4-11 `transparent_union`

### 4-12 `unused`

### 4-13 `vector_size`

### 4-14 `visibility`

## 5 其他属性

### 5-1 枚举属性

#### 5-1-1 `deprecated`

### 5-2 标签属性

### 5-3 语句属性

## 6 平台相关

> 另外有些扩展与平台相关，有特有的。

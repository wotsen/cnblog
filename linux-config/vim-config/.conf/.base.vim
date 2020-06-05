"base
"  --------------  My Vim --------------
"  VERSION 1.0


" Set Linux Debian Desktop
runtime! debian.vim

" Not complete with Vi Mode
set nocompatible

set regexpengine=1

" History
set history=9888

" @ Replace <leader> key map to <space>
let mapleader=" "

autocmd FileType apache setlocal commentstring=#\ %s


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM File Format & layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动缩进为4个空格
set sw=4
" Tab 宽度为4  
set ts=4 
" 设置光标超过88列时候折行
"set tw=88 
" 不折行
set nowrap 
" 在行和段开始处使用制表符, 按下删除键直接删除4个空格
set smarttab
" 智能缩进
set smartindent
" 不在单词中间折行
set lbr 
" 自动格式化
set formatoptions=tcrqn
" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
" 使用C样式的缩进
set cindent
" 制表符为4
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

set linespace=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM File Setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑时将所有Tab替换成空格
set et
" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 防止特殊符号无法正常显示
set ambiwidth=double 
" 禁止生成临时文件
set nobackup
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set nowritebackup
set bufhidden=hide
set dictionary+=/usr/share/dict/words
" 打开C/C++风格自动缩进，可以通过:set paste关闭，:set nopaste重新开启
set cin 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Search & Matching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索时高亮显示被找到的文本
set hls
"搜索忽略大小写
set ignorecase
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2
"高亮被搜索的句子 nohlsearch为不高亮
set hlsearch
" 在搜索时，输入的词句的逐字符高亮
set incsearch
" 高亮显示匹配的括号
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 不要闪烁
set noerrorbells
set novisualbell
set t_vb=
" set Undo file
set undofile
set undodir=~/.vim/undo/
set viminfo+=!
" 显示括号配对情况
set sm 
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 打开上色功能, 语法高亮
syntax on 
"高亮光标所在行
set cul 
"set cuc
" 不要图形按钮  
set go=   
" 用浅色高亮当前行
autocmd InsertEnter * se cul 
" 输入的命令显示出来，看的清楚些    
set showcmd          
" 允许折叠      
"set foldenable  
" 手动折叠       
set foldmethod=manual   
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" 使用空格代替制表符
set expandtab
"将tab替换为空格
nmap tt :%s/\t/    /g<CR>
" 显示行号
set number
"set copyindent
"set preserveindent
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"字体设置
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"背景颜色设置
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Status Line &  Command Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开vim状态栏标尺
set ru
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
"状态行显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
"autocmd FileType python,c match Underlined /\%>80v.*/
autocmd FileType python,c match Error /\%>80v.*/
" 命令模式Tab自动补全
set wildmenu 
" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Other Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开断行模式对亚洲语言支持
set fo+=mB
" 启动的时候不显示那个援助乌干达儿童的提示  
set shortmess=atI  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Action Item 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=v
"set selection=exclusive
"set selectmode=mouse,key
" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
"set list listchars=tab:→\ ,extends:>,precedes:<
" 当右键单击窗口的时候，弹出快捷菜单
set mousemodel=popup 
" 删除键可以继续往前删除数据 
set backspace=indent,eol,start 
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Normal Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 与windows共享剪贴板
set clipboard+=unnamed  
" 保存全局变量
set viminfo+=!
" 去掉输入错误的提示声音
set noeb
" 设置当文件被改动时自动载入
set autoread
"代码补全 
set completeopt=preview,menu 
"自动保存
set autowrite
" 突出显示当前行
set cursorline              
" 设置魔术
set magic   
" 隐藏工具栏
set guioptions-=T 
" 隐藏菜单栏          
set guioptions-=m 
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif

" Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码方式
" Encoding setting
set termencoding=utf-8
" 当前字符编码
set encoding=utf8 
" 设置编码自动识别
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030,latin1 
set fileencoding=utf-8
language messages en_US.utf-8

set fenc= 

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"autocmd BufEnter * cd %:p:h

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown  轻量级标记语言
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
au BufRead,BufNewFile *.{py}   set filetype=python
au BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufRead *.ax,*.handlebar,*.mustache,*.tpl set ft=mustache
au BufNewFile,BufRead *.vm,*.stm set ft=velocity

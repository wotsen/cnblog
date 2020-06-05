"plug.conf
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

""Syntastic (静态语法检查)
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_include_dirs = ["includes", "headers", "/usr/include/", "./"]
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
""c
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_errorformat=1
let g:syntastic_c_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_c_config_file=1
let g:syntastic_c_include_dirs = ["includes", "headers", "/usr/include/", "./"]

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚡ '
let g:syntastic_enable_balloons = 1

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
            \   'c++': ['clang++'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \}
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

""code
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:user_emmet_settings = {
            \ 'php'     : {
            \ 'extends' : 'html',
            \ 'filters' : 'c',
            \ },
            \ 'xml'     : {
            \ 'extends' : 'html',
            \ },
            \ 'haml'    : {
            \ 'extends' : 'html',
            \ },
            \ 'phtml'    : {
            \ 'extends' : 'html',
            \ }
            \}

let g:gitgutter_sign_column_always = 0
let g:gitgutter_max_signs = 99999
let g:pydiction_location = '~/.vim/codeComplete/py-complete-dict'
let g:pydiction_menu_height = 20
autocmd FileType python set omnifunc=pythoncomplete#Complete
let python_self_cls_highlight = 1
let g:lastplace_open_folds = 0

let g:better_whitespace_filetypes_blacklist = ['FAR', 'far_vim', 'diff', 'gitcommit', 'unite', 'qf', 'help', '.ignore', 'node_modules']

let g:lt_location_list_toggle_map = '<leader>w'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:mustache_abbreviations = 1
let g:jsx_ext_required = 0
let g:tsuquyomi_disable_quickfix = 1
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1

" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
"let g:NERDToggleCheckAllLines = 1


""auto
let g:AutoPairsLoaded = 1
if !exists('g:AutoPairs')
    let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_path_to_python_interpreter='/usr/bin/python'
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
endif
let g:ycm_key_invoke_completion = '<C-Space>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"nerdtree git 
let NERDTreeWinPos='left'
"let NERDChristmasTree = 1
"let NERDTreeMouseMode = 2
let NERDTreeWinSize=25

"let g:NERDTreeUseSimpleIndicator = 1
"let g:NERDTreeDirArrows=0


""查找ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_line_prefix = '♪ '

let g:ackhighlight = 1
let g:ack_qhandler = "botright copen 15"
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0

""tagbar
"nmap <Leader>tb :TagbarToggle<CR>

let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
let g:tagbar_jsctags_bin = '/usr/local/bin/jsctags'
let g:tagbar_iconchars = ['+', '-']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags (function 跳转工具)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Ignore file config
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.webp,*.psd,*.exe,*.sketch
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git,.svn

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,FAR,far_vim"
let g:lastplace_ignore_buftype = "quickfix,nofile,help,FAR,far_vim"

let NERDTreeIgnore=['\.pyc']
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeRespectWildIgnore=1

""""""""""""""""""""""主题
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ 'Ignored'   : '☒',
"    \ "Unknown"   : "?"
"    \ }


let g:airline_theme= "bubblegum"

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '������'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

"colorscheme space-vim-dark
colorscheme dark_eyes
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\
"hi Comment cterm=italic

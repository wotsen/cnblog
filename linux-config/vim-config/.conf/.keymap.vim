"keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Keyboard Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建一个标签页
map <F2> <Esc>:tabnew<CR>
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
map <C-F3> \be
nnoremap <F4> ggVG:Tab2Space<CR>
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"代码格式优化化
map <F6> :call FormartSrc()<CR><CR>
""tagbar
nmap <F8> :TagbarToggle<CR>

nmap tl :Tlist<cr> 
:nmap <silent> <F9> <ESC>:Tlist<RETURN>
nnoremap <F10> :%s////g<CR>
" shift tab pages
map <F12> gg=G


"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc
"

" -------------- Tooling Function Binding ------------------
" Lookup HighLight Syntax Define
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
        let result = substitute(result, '\t', spccol, 'g')
    endif
    return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
endfunction

" Space2Tab
" Tab2Space
" RetabIndent
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'ag'
        execute 'Ag '.l:pattern
    elseif a:direction == 'replace'
        execut  "%s" . '/'. l:pattern . '/'
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" -------------- Tooling Function Ending ------------------

" Split faster
nnoremap <leader>\ :vs<CR>
nnoremap <leader>- :sp<CR>

" Fast to copy files path
nnoremap <leader>p "+gp
vnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cp :let @+=expand("%:p")<CR>:echo "Copied current file
            \ path '".expand("%:p")."' to clipboard"<CR>

" Vundle keyfire
nnoremap <leader>vi :PlugInstall<CR>
nnoremap <leader>vu :PlugUpdate<CR>

" Tabluer Format
vnoremap <leader>t :Tabularize/
vnoremap <leader>t= :Tabularize/=<CR>
vnoremap <leader>t, :Tabularize/,<CR>
vnoremap <leader>t. :Tabularize/.<CR>
vnoremap <leader>t: :Tabularize/:<CR>
vnoremap <leader>t; :Tabularize/;<CR>
vnoremap <leader>t\ :Tabularize/\|<CR>



" Incsearch
" nnoremap / /\v
" vnoremap / /\v
" Ag bind \ (backward slash) to grep shortcut
"map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map \ :Ag<SPACE>

nmap <C-f> :FZF<CR>
nmap <leader>f :norm yiw<CR>:Ack "<C-R>""
"let mapleader = ","
function! LookUpwards()
    let column_num = virtcol('.')
    let target_pattern = '\%' . column_num . 'v.'
    let target_line_num = search(target_pattern . '*\S', 'bnW')


    if !target_line_num
        return ""
    else
        return matchstr(getline(target_line_num), target_pattern)
    endif
endfunction
imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>

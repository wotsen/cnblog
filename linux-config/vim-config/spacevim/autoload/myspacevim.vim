function! myspacevim#before() abort
    let g:DoxygenTookit_companyName="Astralrovers"
    let g:DoxygenTookit_authorName="astralrovers"
    set t_Co=256
endfunction

function! myspacevim#after() abort
    set t_Co=256
    set norelativenumber
    let g:molokai_original = 1
    let g:rehash256 = 1
endfunction

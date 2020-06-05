" 2018-02-011
" @ Source
" - Basic
for f in split(glob('$HOME/.conf/.*.vim'), '\n')
  exe 'source' f
endfor

"set tags+=/mnt/hgfs/workspace/proj/work/npru/code/npru2.0/tags
"set tags+=/mnt/hgfs/workspace/proj/work/plat-v2/das-au/tags
"set tags+=/mnt/hgfs/workspace/proj/work/plat-v2/das-ru/tags
"set tags+=/mnt/hgfs/workspace/proj/work/shield/code/shield-hpru.bare/tags
set tags+=/mnt/hgfs/workspace/proj/work/npru/code/web/www/tags
set tags+=/mnt/hgfs/workspace/proj/work/npru/code/web/code/tags

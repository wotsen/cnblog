
filetype off

call plug#begin('~/.vim/plugged/')

"style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'flazz/vim-colorschemes'
"Plug 'gorodinskiy/vim-coloresque'
"Plug 'junegunn/limelight.vim'
"Plug 'liuchengxu/space-vim-dark'
"Plug 'neutaaaaan/iosvkem'
"Plug 'skreek/skeletor.vim'
"Plug 'Jimeno0/vim-chito'
Plug 'bf4/vim-dark_eyes'
Plug 'abudden/taghighlight-automirror'
"Plug 'ryanoasis/vim-devicons'
"Plug 'trusktr/seti.vim'

"tag
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
"Plug 'tpope/vim-git'
"Plug 'tpope/vim-fugitive'
"Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/vim-diff-enhanced'

"search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
"Plug 'justinmk/vim-sneak'
"Plug 'haya14busa/incsearch.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

"code
Plug 'jiangmiao/auto-pairs'
"need install python3, clang, build-essential, cmake
", { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 ./install.py --clang-completer' }
""使用这个可以继续安装git submodule update --init --recursive
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'

"code style
"Plug 'junegunn/vim-easy-align'
"Plug 'fatih/vim-go'
Plug 'kh3phr3n/python-syntax'
Plug 'pangloss/vim-javascript'
"Plug 'groenewege/vim-less'
"Plug 'lepture/vim-velocity'
"Plug 'cakebaker/scss-syntax.vim'
"Plug 'rstacruz/vim-ultisnips-css'
Plug 'hail2u/vim-css3-syntax'
"Plug 'leafgarland/typescript-vim'
"Plug 'jason0x43/vim-js-indent'
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'Quramy/tsuquyomi'
Plug 'othree/xml.vim'
Plug 'othree/html5.vim'
"Plug 'othree/yajs.vim'
"Plug 'maksimr/vim-jsbeautify'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ap/vim-css-color'
"Plug 'docunext/closetag.vim'
Plug 'elzr/vim-json'
"Plug 'bcicen/vim-jfmt' " brew install jq
Plug 'plasticboy/vim-markdown'
"Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdcommenter'


""时光机
Plug 'sjl/gundo.vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

if !exists("g:gui_oni")
    Plug 'ap/vim-buftabline'
endif

call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

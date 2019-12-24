set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
"Plugin 'valloric/youcompleteme'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-repeat'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'plasticboy/vim-markdown'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'zxqfl/tabnine-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'luochen1990/rainbow'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'leafgarland/typescript-vim'
Plugin 'elzr/vim-json'
Plugin 'prettier/vim-prettier'
Plugin 'vim/killersheep'

set bg=light
set nospell
set guioptions-=r
set laststatus=2
set binary noeol
set tabstop=2
set expandtab
set number
set updatetime=100
let NERDTreeShowHidden=1
let g:rainbow_active = 1
set listchars=eol:•
set list
syntax on
set backspace=indent,eol,start
set undofile
colorscheme relic
set viminfo='20,<3000
au BufRead,BufNewFile *.ts   setfiletype typescript
"let g:prettier#config#config_precedence = 'prefer-file'
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
nmap <C-p> :Prettier

"VIM + crontab
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

call vundle#end()
filetype plugin indent on
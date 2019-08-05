set nocompatible              
filetype off                 

" Make sure PATH is ok for Vundle!
set rtp+=~/Documents/Vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'

call vundle#end()            
filetype plugin indent on   

set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set lazyredraw
set hlsearch
set clipboard=unnamed
set encoding=utf-8
set fileencoding=utf-8
set splitright
set splitbelow
syntax off
set expandtab
behave mswin
hi Visual ctermbg=white ctermfg=black
let g:airline_theme='base16_paraiso'
let g:go_fmt_command = "goimports"

map <C-n> :tabnew<SPACE>
map <C-j> :tabprev<CR>
map <C-k> :tabnext<CR>
map <C-l> :nohl<CR>
inoremap { {}<left>
inoremap {{ {
inoremap {} {}
inoremap [ []<left>
inoremap [[ [
inoremap [] []
inoremap ( ()<left>
inoremap (( (
inoremap () ()
inoremap " ""<left>
inoremap "" ""
inoremap ' ''<left>
inoremap '' ''

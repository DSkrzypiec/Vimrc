set nocompatible            
filetype off               

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

set number
set relativenumber
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=79
set expandtab
set splitbelow
set splitright
set hlsearch
set laststatus=2
set showcmd
set wildmode=list:full

hi CursorLineNr ctermbg=white ctermfg=black
hi LineNr ctermfg=grey
hi Search ctermbg=13 ctermfg=16
hi Visual ctermbg=13 ctermfg=16

hi SL ctermbg=white ctermfg=black
set statusline=
:set statusline=%1*             " SL color highlight
:set statusline=%F              " Path to the file
:set statusline+=%m             " modified flag
:set statusline+=%r             " readonly flag
:set statusline+=\ [char=%B]    " value under cursor in hex
:set statusline+=\ [bufNum=%n]  " buffor number
:set statusline+=%=             " switch to the right side
:set statusline+=[col=%c]       " current column
:set statusline+=\ [line=%l/%L] " current line
:set statusline+=\ [%p%%]       " perc lines

syntax off

nnoremap <C-l> :nohl<CR>
nnoremap <C-n> :tabnew<Space>
nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>
nmap nm :vertical res +10<CR>
nmap mn :vertical res-10<CR>
nmap rt :res +10<CR>
nmap tr :res -10<CR>
nmap ,n :%s/<C-R><C-W>//g<left><left>
nmap ,m :s/<C-R><C-W>//g<left><left>
nmap ,f :!grep -r --exclude-dir='.*' -iIsnH '<C-R><C-W>'<CR>


" Abbreviations
"

" Creates Go test function template
iab GOTEST 
\<CR>func Test(t *testing.T) {
\<CR>    
\<CR>}

" Go HTTP handler signature
iab GOHTTP 
\<CR>func handler(w http.ResponseWriter, r *http.Request) {
\<CR>
\<CR>}

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'unblevable/quick-scope'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'AndrewRadev/switch.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

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
set path+=**
set list
set listchars=tab:\|\,trail:^
set clipboard=unnamed
set foldmethod=manual

hi CursorLineNr ctermbg=white ctermfg=black
hi LineNr ctermfg=grey
hi Search ctermbg=13 ctermfg=16
hi Visual ctermbg=13 ctermfg=16
hi Pmenu ctermbg=8

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

syntax on

" Quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_hi_priority = 20

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabMappingForward = '<tab>'

" fzf.vim
let g:fzf_preview_window = ['down:40%', 'ctrl-/']

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --line-number --no-heading --color=always -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" C++
nnoremap ,cpf :py3f /opt/homebrew/Cellar/clang-format/12.0.0/share/clang/clang-format.py<CR>
nnoremap ,cpg :YcmCompleter GoTo<CR>
nnoremap ,cpfu :YcmCompleter GoToReferences<CR>
nnoremap ,cpt :YcmCompleter GetType<CR>


" C#
let g:OmniSharp_highlighting = 0
let g:OmniSharp_server_use_mono = 1

nnoremap ,cp :OmniSharpPreviewDefinition<CR>
nnoremap ,cg :OmniSharpGotoDefinition<CR>
nnoremap ,cfu :OmniSharpFindUsages<CR>
nnoremap ,cfs :OmniSharpFindSymbol<Space>
nnoremap ,ct :OmniSharpTypeLookup<CR>
nnoremap ,cu :OmniSharpFixUsings<CR>
nnoremap ,cs :OmniSharpStatus<CR>
nnoremap ,cr :OmniSharpRestartAllServers<CR>

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Options for external plugins
let g:go_fmt_command = "goimports"

" vim-slime
let g:slime_target = "vimterminal"

" Vim remaps
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

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Creates folds
nnoremap ,fl V/^$<CR>kzf:nohl<CR>   " from current line till first empyt line
nnoremap ,fp v/(<CR>%zf:nohl<CR>    " form current line through '(' till matching ')'
nnoremap ,fb v/{<CR>%zf:nohl<CR>    " from current line through '{' till matching '}'

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
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'

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
set listchars=tab:\|\ ,trail:^
set clipboard=unnamed
set foldmethod=manual
let mapleader=" "
set dir=~/tmp/vim
set backupdir=~/tmp/vim

hi CursorLineNr ctermbg=white ctermfg=black
hi LineNr ctermfg=grey
hi Search ctermbg=13 ctermfg=16
hi Visual ctermbg=13 ctermfg=16
hi Pmenu ctermbg=8

hi SL ctermbg=white ctermfg=black
set statusline=
:set statusline=%1*                     " SL color highlight
:set statusline=%{FugitiveStatusline()} " git branch name
:set statusline+=\ %F                   " Path to the file
:set statusline+=%m                     " modified flag
:set statusline+=%r                     " readonly flag
:set statusline+=\ [char=%B]            " value under cursor in hex
:set statusline+=\ [bufNum=%n]          " buffor number
:set statusline+=%=                     " switch to the right side
:set statusline+=[col=%c]               " current column
:set statusline+=\ [line=%l/%L]         " current line
:set statusline+=\ [%p%%]               " perc lines

syntax on

" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_cs_dotnet_format_executable = '/usr/local/share/dotnet/dotnet'
let g:ale_completion_enabled = 1

" git
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>


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

nnoremap <leader>l :Lines<CR>
nnoremap <leader>f :Files
nnoremap <leader>r :Rg<CR>

" C++
nnoremap <leader>cpf :py3f /opt/homebrew/Cellar/clang-format/12.0.0/share/clang/clang-format.py<CR>
nnoremap <leader>cpg :YcmCompleter GoTo<CR>
nnoremap <leader>cpfu :YcmCompleter GoToReferences<CR>
nnoremap <leader>cpt :YcmCompleter GetType<CR>

" C#
let g:OmniSharp_highlighting = 0
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_fzf_options = { 'down': '45%' }

let g:OmniSharp_diagnostic_exclude_paths = [
\ 'obj/',
\ '[Tt]emp/',
\ '/.nuget/',
\ '\<AssemblyInfo\.cs\>'
\]

let g:OmniSharp_popup_mappings = {
\ 'close': ['<Esc>', 'gq'],
\ 'lineDown': '<C-e>',
\ 'lineUp': '<C-y>',
\ 'halfPageDown': '<C-d>',
\ 'halfPageUp': '<C-u>'
\}

let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [1],
\ 'border': [1]
\}

nnoremap <leader>cp :OmniSharpPreviewDefinition<CR>
nnoremap <leader>cc :OmniSharpGlobalCodeCheck<CR>
nnoremap <leader>cg :OmniSharpGotoDefinition<CR>
nnoremap <leader>cgs :OmniSharpGotoDefinition<CR><C-o>:sbuf#<CR>
nnoremap <leader>cfu :OmniSharpFindUsages<CR>
nnoremap <leader>cfs :OmniSharpFindSymbol<Space>
nnoremap <leader>ct :OmniSharpTypeLookup<CR>
nnoremap <leader>cu :OmniSharpFixUsings<CR>
nnoremap <leader>cs :OmniSharpStatus<CR>
nnoremap <leader>cr :OmniSharpRestartAllServers<CR>
nnoremap <leader>crt :OmniSharpRunTestsInFile<CR>

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
nmap <leader>n :%s/<C-R><C-W>//g<left><left>
nmap <leader>m :s/<C-R><C-W>//g<left><left>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Creates folds
nnoremap <leader>zl V/^$<CR>kzf:nohl<CR>   " from current line till first empyt line
nnoremap <leader>zp v/(<CR>%zf:nohl<CR>    " form current line through '(' till matching ')'
nnoremap <leader>zb v/{<CR>%zf:nohl<CR>    " from current line through '{' till matching '}'

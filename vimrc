"
" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo



" vim-plug plugin maganer
" Install vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/autoload'
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Keep Plug commands between plug#begin/end.
call plug#begin('~/.vim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    !./install.py
  endif
endfunction

" plugins on GitHub repo

Plug 'JuliaEditorSupport/julia-vim'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'blueyed/vim-diminactive'
Plug 'bling/vim-bufferline'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'jreybert/vimagit'
Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown'}
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'pbogut/fzf-mru.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-syntastic/syntastic'
Plug 'wincent/loupe'

Plug 'dhruvasagar/vim-prosession' " deps on tpope/vim-obsession
Plug 'gregsexton/gitv' " deps on tpope/vim-fugitive

" All of your Plugins must be added before the following line
call plug#end()
" Put your non-Plugin stuff after this line



" cmey changes:
let mapleader=","
let elite_mode=1

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

set clipboard=unnamed   " yank to osx clipboard (needs macvim?)
set pastetoggle=<F3>    " press <F3> to toggle autoindent ("paste mode")
set autoread    " autoreload files from disk
au CursorHold * checktime   " trigger autoreload with keyboard

" Detect *.md files as markdown (instead of Modula)
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Use github flavored markdown by default
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Vim's new hybrid line number mode
set relativenumber
set number
nnoremap <leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" set mouse+=a    " avoid copy paste line numbers

" highlight tabs and trailing spaces
set encoding=utf-8
set list listchars=tab:→\ ,trail:·

runtime macros/matchit.vim  " match parens, etc.

set updatetime=250  " git statuses

" YouCompleteMe
let g:ycm_python_binary_path = 'python'  " use python binary from virtual env for jedi
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  " fallback default compile flags
let g:ycm_collect_identifiers_from_tags_files = 1   " YouCompleteMe use ctags

" fzf
set rtp+=/usr/local/opt/fzf

" fzf-mru
nnoremap <c-p> :FZF<cr>
nnoremap <leader>p :FZFMru<cr>

" solarized
syntax enable
set background=dark
colorscheme solarized

" vim-slime: send to tmux (instead of the default: screen)
let g:slime_target = "tmux"

" csv.vim: auto format as table
let g:csv_autocmd_arrange = 1

" vim-latex
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*  " already set grepprg above!
" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being
" loaded. The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" vim-bufferline
let g:bufferline_echo = 0

" vim-airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" let g:airline_extensions = ['branch']
" determine whether bufferline will overwrite customization variables
let g:airline#extensions#bufferline#overwrite_variables = 1

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_aggregate_errors = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_post_args="--max-line-length=100"
let g:syntastic_python_flake8_post_args="--max-line-length=100"

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Other mappings configuration
map <leader>f :echo @%<CR>  " print current file name
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
" Better find and replace
map <leader>fr :%s///g<left><left>
map <leader>frl :s///g<left><left>

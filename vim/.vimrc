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

set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.

set shortmess   +=I        " Disable vim intro screen

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


"Work around https://github.com/vim/vim/issues/3117 < https://github.com/vim/vim/issues/3117#issuecomment-402622616 >
if has('python3')
  silent! python3 1
endif


" vim-plug plugin manager
" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Keep Plug commands between plug#begin/end.
call plug#begin('~/.vim/plugged')

" function! BuildYCM(info)
"   if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
"     !./install.py
"   endif
" endfunction

" plugins on GitHub repo

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'blueyed/vim-diminactive'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'godlygeek/tabular'
Plug 'jalvesaq/vimcmdline'
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'jreybert/vimagit'
Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown'}
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'pbogut/fzf-mru.vim'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'keith/swift.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-syntastic/syntastic'
Plug 'wincent/loupe'
Plug 'zirrostig/vim-schlepp'

Plug 'dhruvasagar/vim-prosession' " deps on tpope/vim-obsession
Plug 'gregsexton/gitv' " deps on tpope/vim-fugitive

" Plug 'jeaye/color_coded' is slow and useless

" All of your Plugins must be added before the following line
call plug#end()
" Put your non-Plugin stuff after this line



" cmey changes:
let mapleader=","
let maplocalleader=","
set colorcolumn=120
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

" Enable folding
set foldlevel=99
set foldmethod=indent
" Enable folding with the spacebar
nnoremap <space> za

" Vim's new hybrid line number mode
set relativenumber
set number
nnoremap <leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" set mouse+=a    " avoid copy paste line numbers

" highline current line (very dark grey)
set cursorline
hi CursorLine   cterm=NONE ctermbg=234

" highlight tabs and trailing spaces
set encoding=utf-8
set list listchars=tab:▸\ ,trail:·

runtime macros/matchit.vim  " match parens, etc.
let g:rainbow_active = 1  " rainbow parens, 0 if you want to enable it later via :RainbowToggle

set updatetime=250  " git statuses

" YouCompleteMe
" let g:ycm_python_binary_path    = 'python'  " use python binary from virtual env for jedi
" let g:ycm_collect_identifiers_from_tags_files = 1   " YouCompleteMe use ctags
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g   :YcmCompleter GoToDefinitionElseDeclaration<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" fzf
set rtp+=/usr/local/opt/fzf

" fzf-mru
nnoremap <c-p> :FZF<cr>
nnoremap <leader>p :FZFMru<cr>

" vim-diminactive
" set background color to gray - default is red. !! also sets colorcolumn's color (right max col)
highlight ColorColumn ctermbg=0 guibg=#334551

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
" nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>G :TestVisit<CR>

" vim-schlepp
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" Other mappings configuration
map <leader>f :echo @%<CR>  " print current file name
map <leader>n :NERDTreeToggle<CR>
map <leader>m :TagbarToggle<CR>
" Better find and replace
map <leader>fr :%s///g<left><left>
map <leader>frl :s///g<left><left>

" :grep will search from inside vim (using ripgrep)
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
" open quickfix window automatically
augroup autoquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine any <CR> mapping there so that this feature can work.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" Mappings for <C-m> and <CR> (Enter) are synonymous in Vim
autocmd BufReadPost quickfix nnoremap <buffer> <C-m> <C-m>

" Performance improvements
if has("mac")
  if exists("+relativenumber")
    set norelativenumber
  endif

  "  maybe
  " let loaded_matchparen = 1
endif

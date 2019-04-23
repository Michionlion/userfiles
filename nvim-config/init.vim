call plug#begin('~/.config/nvim/plugged')
" Plugins will go here
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'justinmk/vim-syntax-extra'
Plug 'sheerun/vim-polyglot'
Plug 'Elive/vim-colorscheme-elive'
Plug 'w0rp/ale'
call plug#end()

let mapleader="\<SPACE>"

" NERDTree config

" Open with leader-t
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Quit NERDTree if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree if no command line args are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if (argc() == 0 && !exists("s:std_in")) | NERDTree | endif

" Open NERDTree if a directory is opened
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

let g:signify_vcs_list = [ 'git', 'hg', 'bzr', 'svn', 'cvs', 'perforce' ]
let g:signify_realtime = 1

let g:airline#extensions#ale#enabled = 1

" Relative numbering toggle function
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering with leader-r
nnoremap <Leader>r :call NumberToggle()<cr>

set autoindent
set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab

" indentation settings
filetype on
filetype plugin indent on
let g:indentLine_setConceal = 0
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

set showmatch
set number
set formatoptions+=o
set nostartofline

" show trailing whitespace and tabs
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list

" show them
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$|\t/

" searching
set ignorecase
set smartcase
set gdefault

" disable beep / flash
set vb t_vb=

" enable line and column display
set ruler

" disable showmode -- using vim-airline
set noshowmode

" syntax
syntax enable

" colorscheme
let badwolf_background = 4
colorscheme elive

" markdown
let g:vim_markdown_folding_disabled = 1

" splits shold open to the right and below
set splitright
set splitbelow

" highlight current line
"autocmd BufEnter * setlocal cursorline
"autocmd WinEnter * setlocal cursorline
"autocmd BufLeave * setlocal nocursorline
"autocmd WinLeave * setlocal nocursorline

" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline_solarized_bg='dark'

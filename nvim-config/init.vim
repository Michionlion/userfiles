call plug#begin('~/.config/nvim/plugged')
" Plugins will go here
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

nnoremap <C-p> :FZF<CR>

let mapleader="\<SPACE>"

" Relative numbering
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

" indentation settings
filetype on
filetype plugin indent on

autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" set autoindent
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab

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




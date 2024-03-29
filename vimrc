set nocompatible              " required for Vundle
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'itchyny/lightline.vim'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'

" Keep Plugin commands between vundle#begin/end.
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Lightline
set laststatus=2

" Disable markdown package folding
let g:vim_markdown_folding_disabled = 1

" Nerdtree shortcut (ctrl-n)
map <C-n> :NERDTreeToggle<CR>
" Close vim if only window left open is Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


set number
set hidden
set history=100

filetype indent on
" set nowrap
set smartindent
set autoindent

" Highlight current line
set cursorline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Highlight search results
set hlsearch

" Show matching parenthesis
set showmatch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines,
" set cmdheight=2


" colorscheme Tomorrow-Night
colorscheme lilypink
syntax enable
set t_Co=256


" Remap escape key to jj
inoremap jj <ESC>

" Change the leader key
let mapleader = "\<Space>"


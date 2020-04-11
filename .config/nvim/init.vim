" General
set nocompatible
set number	" Show line numbers
set noswapfile  " No swap file
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
"set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set errorbells	" Beep or flash screen on errors
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set gdefault	" Always substitute all matches in a line
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set cindent	" Use 'C' style program indenting
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set confirm	" Prompt confirmation dialogs
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'lervag/vimtex'
Plugin 'vim-airline/vim-airline'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'chrisbra/csv.vim'
Plugin 'vimwiki/vimwiki'
call vundle#end()

filetype plugin on
syntax on


" Colourscheme
"colorscheme gruvbox
colorscheme industry

let g:vimwiki_list = [{'path':'~/sync/wiki', 'path_html':'~/export/html/'}]

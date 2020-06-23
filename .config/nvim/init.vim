" General
set nocompatible   " VIm not VI
filetype plugin on " Turn on built in file plugin
syntax enable      " Nice colours

set number	   " Show line numbers
set noswapfile     " No swap file

" Finding files
" Terrible idea. Use fzf instead.
"set path +=**      " Tab completion for files
"set wildmenu       " Display all matching files when we tab

""set linebreak	" Break lines at word (requires Wrap lines)
""set showbreak=+++ 	" Wrap-broken line prefix
""set textwidth=100	" Line wrap (number of cols)
"set showmatch	" Highlight matching brace
"set errorbells	" Beep or flash screen on errors
"set visualbell	" Use visual bell (no beeping)
" 
"set hlsearch	" Highlight all search results
"set smartcase	" Enable smart-case search
"set gdefault	" Always substitute all matches in a line
"set ignorecase	" Always case-insensitive
"set incsearch	" Searches for strings incrementally
" 
"set autoindent	" Auto-indent new lines
"set cindent	" Use 'C' style program indenting
"set expandtab	" Use spaces instead of tabs
"set shiftwidth=2	" Number of auto-indent spaces
"set smartindent	" Enable smart-indent
"set smarttab	" Enable smart-tabs
"set softtabstop=2	" Number of spaces per Tab
" 
""" Advanced
"set confirm	" Prompt confirmation dialogs
"set ruler	" Show row and column ruler information
" 
"set undolevels=1000	" Number of undo levels
"set backspace=indent,eol,start	" Backspace behaviour

" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Konfekt/FastFold'
Plugin 'chrisbra/csv.vim'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vimwiki/vimwiki'
"Plugin 'lervag/vimtex'
"Plugin 'aserebryakov/vim-todo-lists'
"Plugin 'scrooloose/nerdcommenter'
call vundle#end()

" Enable syntax and plugins
" nerdtree config
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :tabe .<CR>
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>

" tagbar
nnoremap <C-m> :TagbarToggle<CR>


" Colourscheme
colorscheme gruvbox
"colorscheme industry

" indentation/folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

let g:vimwiki_list = [{'path':'~/sync/wiki', 'path_html':'~/export/html/'}]

" run Python3 
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

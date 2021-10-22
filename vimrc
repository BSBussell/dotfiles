syntax on

set nocompatible
set backspace=eol,indent,start

" don't highlight the last search upon startup
set viminfo="h"

" 4 Space tabs are holy
set tabstop=4
set softtabstop=4
set shiftwidth=4

" I believe if I use tab instead of spaces it is less likely that 
" we might accidentally delete a space from the tab or something
" Ensure no accidental 3 space tabs are created
set noexpandtab

" Indent Rules
set autoindent
set smartindent 
set cindent

set background=dark

set showmatch               " When () or [] inserted jump to matching one

set report=0                " Always report when lines have been changed 

set scrolloff=5             " Minimum number of lines to keep above and below the cursor 
set wildmode=longest,list   " Completion mode used, list all matches, and go till longest common string
set incsearch               " When searching show the pattern as typed 
set hlsearch                " High search after searched
set smartcase               " When searching ignore case when pattern is all lowercase

set number                  " Enable Line numbers
set nuw=6                   " Set line number 6 spaces from edge
set noswapfile              " No more swp files, please be smart
set spell                   " Spell checker
set title                   " Set terminal title
set titlestring=%t          " Set terminal title to filename
set noerrorbells            " No error noise
set visualbell              " Flash on err
set wildmenu                " Auto complete
set undolevels=1000         " Can undo up to 1000 times B)

" use ' as leader key
let mapleader = "'"

" use double-Esc to completely clear the search buffer
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" C++ template
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp

" ensure colors are consistient likely redundant
set termguicolors
set t_Co=255

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Airplane will already shows the mode
set noshowmode

" Plugins

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Start vim-plug
call plug#begin('~/.vim/plugged')

    " Automatically install missing plugins on startup
    if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
        autocmd VimEnter * PlugInstall | q
    endif

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Syntax Checker
    Plug 'scrooloose/syntastic'
    
    " SuperTab Autocomplete Tool
    Plug 'ervandew/supertab'
    
    " Git Gutter
    Plug 'airblade/vim-gitgutter'

    " The Nerd Tree
    Plug 'scrooloose/nerdtree'

    " The Nerd Tree Git
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Comfortable Motion
    Plug 'yuttie/comfortable-motion.vim'

    " Colorschemes
    Plug 'flazz/vim-colorschemes'
    " One Half Theme
    Plug 'sonph/onehalf', { 'rtp': 'vim' }


call plug#end()

" Nerdtree hotkeys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Set Colorscheme if onehalfdark isn't found on first start up try again
silent! colorscheme onehalfdark

" AirPlane Config
silent! let g:airline_theme='onehalfdark'

" We have powerline
let g:airline_powerline_fonts = 1
let g:aitline#extensions#tabline#enabled = 1 " Enable the list of buffers

" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" Fancy Section Configuration
let g:airline_section_z = "%p%% | Line: %l/%L | Col: %c"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = "-Wall -Wextra -std=c++98"
let g:syntastic_cpp_include_dirs = ["include"]


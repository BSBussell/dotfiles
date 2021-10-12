

syntax on

set t_kb=
set nocompatible
set backspace=eol,indent,start

" don't highlight the last search upon startup
set viminfo="h"

" Do C-style auto indentation on C/C++/Perl files only :)
"filetype plugin indent on
"autocmd FileType c,cpp,perl :set cindent

" 4 Space tabs are holy
set tabstop=4
set shiftwidth=4

" Less likely to mess up indentation if we use \t
set noexpandtab

" Indent Rules
set autoindent
set smartindent 
set cindent

" set ruler
set background=dark

"match parenthesis, i.e. ) with (  and } with {
set showmatch

"ignore case when doing searches
set ignorecase
set smartcase

"tell you how many lines have been changed
set report=0

set scrolloff=5
set wildmode=longest,list
set incsearch
set hlsearch

" C++ template
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp

set number              " Enable Line numbers
set nuw=6               " Set line number 6 spaces from edge
set noswapfile          " No more swp files, just do it right
set spell               " Spell checker
set title               " Set terminal title
set noerrorbells        " No error noise
set visualbell          " Flash on err
set wildmenu            " Auto complete
set undolevels=1000

" use ' as leader key
let mapleader = "'"

" use double-Esc to completely clear the search buffer
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" ensure colors are consistient
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
" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

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

" Set Colorscheme
colorscheme onehalfdark

" AirPlane Config
let g:airline_theme='onehalfdark'

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

" Highlights
" hi cCustomFunc  gui=bold guifg=yellowgreen
" hi cCustomClass gui=reverse guifg=#00FF00

" Ensure Comments are visible on most Themes
" hi Comment guifg=#8594ab
" hi LineNr guifg=#8594ab




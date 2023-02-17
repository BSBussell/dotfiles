" General Settings
source $HOME/.config/nvim/general/settings.vim
" Plug-in Settings
source $HOME/.config/nvim/vim-plug/plugins.vim

let mapleader = "'"

" Some wacky things I want to keep here
syntax on " turning on syntax highlighting
set number " Yes I do want line numbers
set noswapfile " No more scary swap files
set hlsearch
set ignorecase " Ignores case
set smartcase " Smart telling if should ignore case
set incsearch
set spell spelllang=en_us

" Things to make sure tabs are always 4 spaces as god intended :3
set tabstop=4
set shiftwidth=4
set expandtab

" Template Files
autocmd BufNewFile *.cpp 0r $HOME/.config/nvim/templates/skeleton.cpp

" AirPlane Config
let g:airline_theme='fruit_punch'
" lightline in case we want to use the light color scheme...
" let g:lightline = { 'colorscheme': 'onehalfdark' }

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

" Syntastic C++ Options
let g:syntastic_cpp_compiler_options = "-Wall -Wextra -std=c++17"
let g:syntastic_cpp_include_dirs = ["src", "src/*"]

" Git Gutter
let g:gitgutter_set_sign_backgrounds = 1

" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Just making sure we get the real colors
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" Theme
colorscheme pink-moon

" Ensure Background is Transparent
" This is at the end because I don't want anything to overwrite this
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" Ensure Comments are visible on most Themes
hi Comment guifg=#8594ab

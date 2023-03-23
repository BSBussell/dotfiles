" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Comfortable Motion
    Plug 'yuttie/comfortable-motion.vim'

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


    Plug 'kassio/neoterm'

    "Themes

    " Vim Pink Moon Theme
    Plug 'sts10/vim-pink-moon'
    " Vim Sun Bather Theme
    Plug 'nikolvs/vim-sunbather'
    " One Half Theme
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    "NightFox
    Plug 'EdenEast/nightfox.nvim' " Vim-Plug

    " Icons :3
    Plug 'ryanoasis/vim-devicons'

    " COC.nvim
    "Plug 'neoclide/coc.nvim'

    " Github Copilot
    Plug 'github/copilot.vim'

    call plug#end()

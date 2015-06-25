set nocompatible              " be iMproved, required
filetype off                  " required

autocmd filetype crontab setlocal nobackup nowritebackup

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Pathoegn
Plugin 'tpope/vim-pathogen'

" Color scheme
Plugin 'chriskempson/base16-vim'
Plugin 'blueshirts/darcula'

" vim-go
Plugin 'fatih/vim-go'

Plugin 'mbbill/undotree'

Plugin 'scrooloose/nerdtree'

Plugin 'spf13/vim-autoclose'

Plugin 'Valloric/YouCompleteMe'

Plugin 'nsf/gocode', {'rtp': 'vim/'}

Plugin 'rust-lang/rust.vim'

Plugin 'phildawes/racer'

Plugin 'eagletmt/neco-ghc'

Plugin 'elixir-lang/vim-elixir'

call vundle#end()            " required

" neco-ghc
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Color scheme
" background=dark
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-ocean
colorscheme darcula

" Autoclose
let g:autoclose_vim_commentmode = 1

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Rust
set hidden
let g:racer_cmd = "/Users/lander/development/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src/"

" Misc
set number
set mouse=a
set backspace=2 " make backspace work like most other apps

" Use tabs instead of spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

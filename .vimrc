set nocompatible              " be iMproved, required
filetype off                  " required

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

" vim-go
Plugin 'fatih/vim-go'

Plugin 'mbbill/undotree'

Plugin 'scrooloose/nerdtree'

Plugin 'spf13/vim-autoclose'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Color scheme
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-chalk

" Autoclose
let g:autoclose_vim_commentmode = 1

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Misc
set number
set mouse=a

" Use tabs instead of spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

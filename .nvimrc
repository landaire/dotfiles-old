set nocompatible              " be iMproved, required
filetype off                  " required

autocmd filetype crontab setlocal nobackup nowritebackup

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'scrooloose/syntastic'

Plugin 'szw/vim-ctrlspace'

Plugin 'Chiel92/vim-autoformat'

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

Plugin 'idanarye/vim-dutyl'
Plugin 'kiith-sa/DSnips'
Plugin 'JesseKPhillips/d.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'spf13/vim-autoclose'

Plugin 'Valloric/YouCompleteMe'

Plugin 'nsf/gocode', {'rtp': 'vim/'}

Plugin 'rust-lang/rust.vim'

Plugin 'phildawes/racer'

Plugin 'eagletmt/neco-ghc'

Plugin 'kien/ctrlp.vim'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'elixir-lang/vim-elixir'

Plugin 'majutsushi/tagbar'

call vundle#end()            " required

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

au FileType gitcommit set tw=72 |  set colorcolumn=50 

" Color scheme
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean
let g:base16_shell_path="$HOME/.config/base16-shell"
" colorscheme darcula

" Autoclose
let g:autoclose_vim_commentmode = 1

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeHijackNetrw=0
":let g:loaded_netrw       = 1
":let g:loaded_netrwPlugin = 1

" Rust
set hidden
let g:racer_cmd = "/Users/lander/development/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src/"

" Misc
set number
set mouse=a
set backspace=2 " make backspace work like most other apps
set clipboard=unnamed " make clipboard work
set ruler

" Use tabs instead of spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" neco-ghc
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" D config
let g:dutyl_stdImportPaths=['/usr/local/include/d2/']

call dutyl#register#tool('dcd-client','/usr/local/bin/dcd-client')
call dutyl#register#tool('dcd-server','/usr/local/bin/dcd-server')
call dutyl#register#tool('dscanner','/Users/lander/development/Dscanner/bin/scanner')
call dutyl#register#tool('dfmt','/Users/lander/development/dfmt/bin/dfmt')
call dutyl#register#tool('dub','/usr/local/bin/dub')

let g:formatdef_dfmt = '"/Users/lander/development/dfmt/bin/dfmt"'
let g:formatters_d = ['dfmt']


" Autochdir
" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Go
let g:go_fmt_command = "/Users/lander/go/bin/goimports"

" map <Leader>n <plug>NERDTreeTabsToggle<CR>


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Move text blocks up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

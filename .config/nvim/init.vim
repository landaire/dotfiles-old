set nocompatible              " be iMproved, required
filetype off                  " required

autocmd filetype crontab setlocal nobackup nowritebackup


call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plug 'MattesGroeger/vim-bookmarks'

Plug 'scrooloose/syntastic'

Plug 'szw/vim-ctrlspace'

Plug 'Chiel92/vim-autoformat'

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" Pathoegn
Plug 'tpope/vim-pathogen'

" Color scheme
Plug 'chriskempson/base16-vim'
Plug 'blueshirts/darcula'

" vim-go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go'

Plug 'mbbill/undotree'

Plug 'idanarye/vim-dutyl'
Plug 'kiith-sa/DSnips'
Plug 'JesseKPhillips/d.vim'

Plug 'scrooloose/nerdtree'

Plug 'Shougo/deoplete.nvim'

Plug 'nsf/gocode', {'rtp': 'vim/'}

Plug 'rust-lang/rust.vim'

Plug 'phildawes/racer'

Plug 'eagletmt/neco-ghc'

" Interface
Plug 'kien/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'spf13/vim-autoclose'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'

Plug 'elixir-lang/vim-elixir'

call plug#end()            " required

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Show the 80-char color column in all files
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

" Show athe colorcolumn when editing a git commit
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
" let g:ycm_semantic_triggers = {'haskell' : ['.']}

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
call dutyl#register#tool('dfmt','/Users/lander/development/dfmt/bin/dfmt --brace_style=otbs')
call dutyl#register#tool('dub','/usr/local/bin/dub')

let g:deoplete#enable_at_startup = 1

noremap <F3> :Autoformat<CR>

let g:formatdef_dfmt = '"/Users/lander/development/dfmt/bin/dfmt --brace_style=otbs"'
let g:formatters_d = ['dfmt']

let g:formatdef_rustfmt = '"/Users/lander/development/rust/rustfmg/target/release/rustfmt"'
let g:formatters_rs = ['rustfmt']


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
let g:syntastic_mode_map = { 'passive_filetypes': ['d'] }

" Move text blocks up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
noremap <A-k> :m '<-2<CR>gv=gv

if has('gui_running')
  set guifont=Fira\ Code:h11
endif


set nocompatible              " be iMproved, required
filetype off                  " required

autocmd filetype crontab setlocal nobackup nowritebackup

call plug#begin('~/.vim/plugged')

Plug 'MattesGroeger/vim-bookmarks'

" Syntax checker
Plug 'scrooloose/syntastic'

" Buffer, tab, file management/fuzzy searching
Plug 'szw/vim-ctrlspace'

Plug 'Chiel92/vim-autoformat'

" Color scheme
Plug 'chriskempson/base16-vim'
Plug 'blueshirts/darcula'

" vim-go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go'           " Go autocomplete hook for deoplete
Plug 'nsf/gocode', {'rtp': 'vim/'} " Go autocomplete daemon

Plug 'mbbill/undotree'             " Show history

Plug 'idanarye/vim-dutyl'          " D utils (autocomplete, fmt, etc.)
Plug 'kiith-sa/DSnips'             " D snippets
Plug 'JesseKPhillips/d.vim'        " D highlighting

Plug 'scrooloose/nerdtree'         " File tree

Plug 'Shougo/deoplete.nvim'        " Async autocomplete for neovim

Plug 'rust-lang/rust.vim'          " Rust highlighting and other stuff
Plug 'phildawes/racer'             " Rust autocomplete

Plug 'eagletmt/neco-ghc'           " Haskell autocomplete

" Utilities
Plug 'jeetsukumaran/vim-buffergator'
Plug 'osyo-manga/vim-over'           " Substitution preview
Plug 'scrooloose/nerdcommenter'      " Commenting crap
Plug 'godlygeek/tabular'             " Align things at their equal sign
Plug 'benekastah/neomake'

" Interface
Plug 'kien/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'spf13/vim-autoclose'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'myusuf3/numbers.vim'
Plug 'mhinz/vim-startify' " Start screen
Plug 'junegunn/goyo.vim'  " Distraction-free writing

Plug 'elixir-lang/vim-elixir'

call plug#end()            " required

" ===== General settings ====
set termencoding=utf-8
set autoindent            " Indent based off the last line

set ruler                 " Show the line number and column

set textwidth=250         " Maximum width of text that is being inserted. A longer
                          " line will be broken after white space to get this width.

set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                          " automatic formatting is to be done.
                          "
                          " letter    meaning when present in 'formatoptions'
                          " ------    ---------------------------------------
                          " c         Auto-wrap comments using textwidth, inserting
                          " the current comment leader automatically.
                          " q         Allow formatting of comments with                  " gq " .
                          " r         Automatically insert the current comment leader
                          " after hitting <Enter> in Insert mode.
                          " t         Auto-wrap text using textwidth (does not apply
                          " to comments)<Paste>

set showmatch             " Jump to matching bracket when one is inserted

set hlsearch              " When there is a previous search pattern highlight all of its
                          " matches

set incsearch             " Show matches while typing

set ignorecase            " Ignore case when searching

set smartcase             " Override ignorecase if an uppercase char is in the search

" Misc
set number
set mouse=a
set backspace=2       " make backspace work like most other apps
set clipboard=unnamed " make clipboard work

" Use tabs instead of spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Show the 80-char color column in all files
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

" Show athe colorcolumn when editing a git commit
au FileType gitcommit set tw=72 |  set colorcolumn=50

" ======== UI Config =========
" Enable TrueColor support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Color scheme
set background=dark
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean
let g:base16_shell_path="$HOME/.config/base16-shell"
" colorscheme darcula

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "base16_ocean"
let g:airline#extensions#tabline#enabled = 1

" ========= Utility Config ===========

" === Key bindings ===
" Remap leader to <SPC>
let mapleader=' '

" Map ,e to go out of term mode to normal mode
tnoremap <ESC> <C-\><C-n>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tabular config
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
endif

" Undotree
nnoremap <Leader>ut :UndotreeToggle<cr>

" Nerdtree
map <Leader>ft :NERDTreeToggle<CR>

noremap <Leader>af :Autoformat<CR>

" Move text blocks up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
noremap <A-k> :m '<-2<CR>gv=gv


" === Utility configuration ===

" Enable matchit
runtime macros/matchit.vim

" Autoclose
let g:autoclose_vim_commentmode = 1

" Rust
set hidden
let g:racer_cmd = "/Users/lander/development/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src/"

" neco-ghc
" let g:ycm_semantic_triggers = {'haskell' : ['.']}

" ctrlp
let g:ctrlp_map = '<Leader>p'
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

" Deoplete
let g:deoplete#enable_at_startup = 1

" Autoformat configs
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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['d'] }
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy' " Override for HTML5 tidy
let g:syntastic_html_tidy_blocklevel_tags = ['nav']

" ====== Other Vim config ======
" Automatically highlight symbol under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

if has('gui_running')
  set guifont=Fira\ Code:h11
endif

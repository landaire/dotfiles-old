set nocompatible							" be iMproved, required
filetype off									" required

autocmd filetype crontab setlocal nobackup nowritebackup

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'MattesGroeger/vim-bookmarks'

" Syntax checker
Plug 'benekastah/neomake'

" Buffer, tab, file management/fuzzy searching
" Plug 'szw/vim-ctrlspace'

Plug 'Chiel92/vim-autoformat'

" Color scheme
Plug 'chriskempson/base16-vim'
Plug 'blueshirts/darcula'

" Languages
Plug 'keith/swift.vim'

" vim-go
Plug 'fatih/vim-go'
Plug 'nsf/gocode', {'rtp': 'vim/'}				" Go autocomplete daemon
Plug 'zchee/deoplete-go', { 'do': 'make'} " Go autocomplete hook for deoplete

" HTML
Plug 'othree/html5.vim'

Plug 'zchee/deoplete-jedi'								" Python autocompletion

Plug 'landaire/deoplete-d'								" D autocompletion

Plug 'landaire/deoplete-swift'

"Plug 'zchee/deoplete-clang'								" C/C++ autocompletion

Plug 'Shougo/echodoc.vim'                                   " Show messages in echo area
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Async autocomplete for neovim

Plug 'zchee/deoplete-clang'

Plug 'mbbill/undotree'         " Show history

Plug 'idanarye/vim-dutyl'      " D utils (autocomplete, fmt, etc.)
Plug 'kiith-sa/DSnips'         " D snippets
Plug 'JesseKPhillips/d.vim'    " D highlighting

Plug 'scrooloose/nerdtree'     " File tree

Plug 'rust-lang/rust.vim'      " Rust highlighting and other stuff
Plug 'racer-rust/vim-racer'    " Rust autocomplete

Plug 'eagletmt/neco-ghc'       " Haskell autocomplete

Plug 'plasticboy/vim-markdown' " Markdown mode

Plug 'fidian/hexmode'          " Binary files

" Utilities
Plug 'tpope/vim-sleuth'         " Detect tabwidth from file
Plug 'rking/ag.vim'
Plug 'airblade/vim-rooter'      " Automatically set project root
Plug 'osyo-manga/vim-over'      " Substitution preview
Plug 'scrooloose/nerdcommenter' " Commenting crap
Plug 'godlygeek/tabular'        " Align things at their equal sign
Plug 'vim-scripts/Smart-Tabs'   " Smart tabs
Plug 'jceb/vim-orgmode'         " Orgmode
Plug 'vimwiki/vimwiki'          " Wiki
Plug 'vim-scripts/utl.vim'      " Universal text linking
Plug 'vim-scripts/repeat.vim'   " Repeat actions
Plug 'chrisbra/NrrwRgn'         " Narrow regions
Plug 'tpope/vim-speeddating'    " Increment/decrement dates
Plug 'mattn/calendar-vim'       " Calendar window
Plug 'vim-scripts/SyntaxRange'  " Change the syntax for a range
Plug 'Konfekt/FastFold'         " Speeds up folding
Plug 'editorconfig/editorconfig-vim' " Editorconfig support


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'			" Required for easytags
Plug 'xolox/vim-easytags' " ctags integration
Plug 'easymotion/vim-easymotion'
Plug 'ap/vim-css-color'

" Interface
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'majutsushi/tagbar'
Plug 'spf13/vim-autoclose'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'myusuf3/numbers.vim'
Plug 'mhinz/vim-startify'  " Start screen
Plug 'junegunn/goyo.vim'	 " Distraction-free writing
Plug 'Yggdroot/indentLine' " Indent indicators and lines
Plug 'vim-scripts/restore_view.vim' " Save/restore views
" Plug 'roman/golden-ratio' " Golden ratio for windows

Plug 'elixir-lang/vim-elixir'

call plug#end()						 " required

" ===== General settings ====
set conceallevel=1

" Folding
"set foldenable
"set foldlevelstart=20		" open most folds by default
"set foldnestmax=10			" 10 nested fold max

" f open/closes folds
nnoremap f za
"set foldmethod=syntax

" Move around "visual" lines instead of actual lines
nnoremap j gj
nnoremap k gk

set hidden " Allow having multiple dirty buffers

set termencoding=utf-8
set autoindent						" Indent based off the last line

set ruler									" Show the line number and column

set textwidth=80                                     " Maximum width of text that is being inserted. A longer
													 " line will be broken after white space to get this width.

set formatoptions=c,q,r,t " This is a sequence of letters which describes how
													" automatic formatting is to be done.
													"
													" letter		meaning when present in 'formatoptions'
													" ------		---------------------------------------
													" c					Auto-wrap comments using textwidth, inserting
													" the current comment leader automatically.
													" q					Allow formatting of comments with " gq " .
													" r					Automatically insert the current comment leader
													" after hitting <Enter> in Insert mode.
													" t					Auto-wrap text using textwidth (does not apply
													" to comments)<Paste>

set showmatch							" Jump to matching bracket when one is inserted

set hlsearch							" When there is a previous search pattern highlight all of its
													" matches

set incsearch							" Show matches while typing

set ignorecase						" Ignore case when searching

set smartcase							" Override ignorecase if an uppercase char is in the search

" Misc

" Load .vimrc files in the current dir
set exrc

" Show the line number
set number

hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

set mouse=a

" Set backspace stuff
set backspace=indent,eol,start
set clipboard=unnamed " make clipboard work

" Tab config
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shiftround                        " always indent by multiple of shiftwidth

set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

if has('linebreak')
  let &showbreak='⤷ '                 " ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
endif

if v:progname !=# 'vi'
  set softtabstop=-1                  " use 'shiftwidth' for tab/bs at end of line
endif

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

" Show the X-char color column in all files
if exists('+colorcolumn')
  " Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif
" highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" set colorcolumn=80

" Show the colorcolumn when editing a git commit
au FileType gitcommit set tw=72 |  set colorcolumn=50

" Enable spellcheck
setlocal spell spelllang=en_us

" ======== UI Config =========
" Enable truecolor support
set termguicolors
" Enable pipe cursor when in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:terminal_color_0  = '#2b303b'
let g:terminal_color_1  = '#bf616a'
let g:terminal_color_2  = '#a3be8c'
let g:terminal_color_3  = '#ebcb8b'
let g:terminal_color_4  = '#8fa1b3'
let g:terminal_color_5  = '#b48ead'
let g:terminal_color_6  = '#96b5b4'
let g:terminal_color_7  = '#c0c5ce'
let g:terminal_color_8  = '#65737e'
let g:terminal_color_9  = '#2b303b'
let g:terminal_color_10 = '#bf616a'
let g:terminal_color_11 = '#a3be8c'
let g:terminal_color_12 = '#ebcb8b'
let g:terminal_color_13 = '#8fa1b3'
let g:terminal_color_14 = '#b48ead'
let g:terminal_color_15 = '#eff1f5'
let g:terminal_color_16 = '#d08770'
let g:terminal_color_17 = '#ab7967'
let g:terminal_color_18 = '#343d46'
let g:terminal_color_19 = '#4f5b66'
let g:terminal_color_20 = '#a7adba'
let g:terminal_color_21 = '#dfe1e8'

" Color scheme
set background=dark
" let base16colorspace=256	" Access colors present in 256 colorspace
colorscheme base16-ocean
let g:base16_shell_path="$HOME/.config/base16-shell"

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "base16_ocean"
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_left_alt_sep=''
"let g:airline_right_alt_sep=''

" View saving
set viewoptions=cursor,folds,slash,unix

" Indent indicators
set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
let g:indentLine_char = '│'
let g:indentLine_enabled=1
"let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'

" ========= Utility Config ===========
autocmd BufWritePre * StripWhitespace

" === Key bindings ===

" From http://ddrscott.github.io/blog/2016/vim-toggle-movement/
function! ToggleMovement(firstOp, thenOp)
	let pos = getpos('.')
	execute "normal! " . a:firstOp
	if pos == getpos('.')
		execute "normal! " . a:thenOp
	endif
endfunction

" The original carat 0 swap
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" How about ; and ,
nnoremap <silent> ; :call ToggleMovement(';', ',')<CR>
nnoremap <silent> , :call ToggleMovement(',', ';')<CR>

" How about H and L
nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>

" How about G and gg
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

" Press shift-enter to add a new line without moving cursor
inoremap <silent> <s-cr> <esc>m`o<esc>``a

" Disable search highlighting when backspace is pressed
nmap <silent> <BS>	:nohlsearch<CR>

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
"map <Leader>ft :call OpenRanger()<CR>
"
autocmd FileType swift imap <buffer> <C-j> <Plug>(deoplete_swift_jump_to_placeholder)

" Tagbar
let g:tagbar_type_d = {
						\ 'ctagstype' : 'd',
						\ 'kinds'			: [
								\ 'c:classes:1:1',
								\ 'f:functions:1:1',
								\ 'T:template:1:1',
								\ 'g:enums:1:1',
								\ 'e:enumerators:0:0',
								\ 'u:unions:1:1',
								\ 's:structs:1:1',
								\ 'v:variables:1:0',
								\ 'i:interfaces:1:1',
								\ 'm:members',
								\ 'a:alias'
						\ ],
						\'sro': '.',
								\ 'kind2scope' : {
								\ 'c' : 'class',
								\ 'g' : 'enum',
								\ 's' : 'struct',
								\ 'u' : 'union',
								\ 'T' : 'template'
						\},
						\ 'scope2kind' : {
								\ 'enum'			: 'g',
								\ 'class'			: 'c',
								\ 'struct'		: 's',
								\ 'union'			: 'u',
								\ 'template'	: 'T'
						\ },
						\ 'ctagsbin' : 'dscanner',
						\ 'ctagsargs' : ['--ctags']
						\ }

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

" Orgmode
let g:org_export_emacs="~/bin/emacs"

" Markdown
let g:vim_markdown_conceal=0

" Rust
let g:rustfmt_autosave = 1
let $RUST_SRC_PATH="/usr/local/src/rust/src/"

" neco-ghc
" let g:ycm_semantic_triggers = {'haskell' : ['.']}

" fzf
nnoremap <silent> <leader>p :FZF<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>pc :Commits<CR>
nnoremap <silent> <leader>gc :BCommits<CR>

" ctrlp
"let g:ctrlp_map = '<Leader>p'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip			" MacOSX/Linux
"let g:ctrlp_custom_ignore = {
	"\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	"\ 'file': '\v\.(exe|so|dll)$',
	"\ }

" D config
let g:dutyl_stdImportPaths=['/usr/local/include/dlang/dmd']
call dutyl#register#tool('dcd-client','/usr/local/bin/dcd-client')
call dutyl#register#tool('dcd-server','/usr/local/bin/dcd-server')
call dutyl#register#tool('dscanner','/Users/lander/bin/dscanner')
call dutyl#register#tool('dfmt','/Users/lander/development/dfmt/bin/dfmt --brace_style=otbs')
call dutyl#register#tool('dub','/usr/local/bin/dub')

" Echodoc
set noshowmode
let g:echodoc_enable_at_startup=1

" Deoplete
" neocomplete like
" https://github.com/Shougo/deoplete.nvim/blob/master/doc/deoplete.txt
set completeopt+=noinsert

" Set before than deoplete
" deoplete#mappings#_set_completeopt() in
" https://github.com/Shougo/deoplete.nvim/blob/master/autoload/deoplete/mappings.vim
" https://github.com/Shougo/deoplete.nvim/blob/master/rplugin/python3/deoplete/deoplete.py
set completeopt+=noselect

set completeopt-=preview

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/opt/python3/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_camel_case = 1

" Deoplete-clang
" let g:deoplete#sources#clang#clang_header = '/usr/local/include/clang/'
" let g:deoplete#sources#clang#libclang_path = '/usr/local/lib/libclang.dylib'

" Deoplete
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
set isfname-==

" PHP config
let g:phpcomplete_index_composer_command='composer'

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

" Neomake
set statusline+=%#warningmsg#
set statusline+=%*
let g:neomake_always_populate_loc_list = 1
let g:neomake_auto_loc_list = 0
let g:neomake_check_on_open = 1
" autocmd! BufWritePost * Neomake
let g:neomake_check_on_wq = 0
let g:neomake_mode_map = { 'passive_filetypes': ['d'] }
let g:neomake_html_tidy_exec = '/usr/local/bin/tidy -config ~/.config/tidy/tidy.conf' " Override for HTML5 tidy
let g:neomake_html_tidy_blocklevel_tags = ['nav']

" ====== Other Vim config ======
" Automatically highlight symbol under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

if has('gui_running')
	set guifont=Hack:h11
endif

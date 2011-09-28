" disable vi compatibility mode
set nocompatible
let mapleader=","
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" call togglebg to autoload the togglebg plugin
call togglebg#map("")

" Tab, shifting & indent settings

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent

" Other usefull settings

set encoding=utf-8
" prefer unix fileformatting over dos, even on Windows
set fileformats=unix,dos
set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
"set visualbell
set noerrorbells
set ttyfast
set ruler
set laststatus=2
if version >= 703
    set relativenumber
else
    set number
endif
set backspace=indent,eol,start
set hidden
set history=1000
set title
set titleold=""
syntax enable
filetype on
filetype plugin on
filetype indent on
set shortmess=atI
set nojoinspaces

" show whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>ws :set nolist!<cr>

" Searching

set incsearch
set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch
" clear search highlighting
nnoremap <silent> <leader><space> :noh<cr>
" Regexp changes
nnoremap / /\v
vnoremap / /\v

" Text width
set wrap
set textwidth=79
set formatoptions=coqrnlb1
set linebreak
set showbreak=>\ 

" better % matching
runtime macros/matchit.vim

" folding
set foldenable
set foldmethod=indent
set foldlevel=100

" Bubble single lines
nmap <S-k> [e
nmap <S-j> ]e
" Bubble multiple lines
vmap <S-k> [egv
vmap <S-j> ]egv

nnoremap <S-u> J
vnoremap <S-u> J

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" edit .vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>eg <C-w><C-v><C-l>:e $MYGVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
    map <leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map <leader>ee :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

" move by screen lines, not file lines
"nnoremap j gj
"nnoremap k gk

" ; works like :
nnoremap ; :
vnoremap ; :

" window control
set splitright
set splitbelow
nnoremap <leader>wv <C-w><C-v>l
nnoremap <leader>wh <C-w><C-n>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab mappings
map <Leader>tc :tabclose
map <Leader>tn :tabnew

" Color settings
set background=dark
let g:solarized_termcolors=16
colorscheme solarized
map <leader>cl :set background=light<CR>:colorscheme solarized<CR>
map <leader>cd :set background=dark<CR>:colorscheme solarized<CR>
map <leader>bg :ToggleBG<CR>

" other settings to review/cleanup

" enable the mouse to move windows
set mouse=a
" indent a block of text between { }
map <F4> my?{%kmzj%j:.,'zs/^.*$/  &/`y 
" unindent a block of text between { }
map <F3> my?{%kmzj%j:.,'zs/^  \\|^  //`y
" html/xml comment
map <F5> mzI<!-- A -->`z5l
" html/xml uncomment
map <F6> mz0/<!-- df / -->df>`z5h
" MiniBufExplorer settings
let g:miniBufExplSplitBelow = 0
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplTabWrap = 1
let g:miniBufExplUseSingleClick = 1

map  :WMToggle
map  :FirstExplorerWindow
map  :BottomExplorerWindow

" edit file in new tab

" jump to current window/tab if buffer is already open
"set switchbuf=usetab


" Abbreviations
ab pfn /*/function () {}<Up><Right><Right><Right><Right><Right><Right><Right><Right><BS>

nnoremap <leader>lpu /\vend.*customO<c-r>*<esc>


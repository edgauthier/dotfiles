" disable vi compatibility mode
set nocompatible
let mapleader=","

" Tab, shifting & indent settings

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set autoindent

" Other usefull settings

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
"set noerrorbells
set ttyfast
set ruler
set laststatus=2
set number
set backspace=indent,eol,start
set hidden
set history=1000
set title
syntax enable
filetype on
filetype plugin on
filetype indent on

" Searching

set incsearch
set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch
" Regexp changes
nnoremap / /\v
vnoremap / /\v

" Text width
set wrap
set textwidth=79
set formatoptions=cqrnlb1

" better % matching
runtime macros/matchit.vim

" Mappings

" clear search highlighting
nnoremap <silent> <leader><space> :noh<cr>

" select last pasted block
nnoremap <leader>v V`]

" edit .vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>eg <C-w><C-v><C-l>:e $MYGVIMRC<cr>

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

" disable F1 key - turn it into another ESC key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" map jj to <esc> in insert mode
inoremap jj <ESC>

" ; works like :
nnoremap ; :

" window control
nnoremap <leader>w <C-w><C-v>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab mappings
map <Leader>tc :tabclose
map <Leader>tn :tabnew

" other settings to review/cleanup

" enable the mouse to move windows
set mouse=a
" better colors on light background
set background=dark
" syntax highlighting on
" mappings do not work recursively
set noremap
" indent a block of text between { }
map <F4> my?{%kmzj%j:.,'zs/^.*$/  &/`y 
" unindent a block of text between { }
map <F3> my?{%kmzj%j:.,'zs/^  \\|^  //`y
" splitting of window places new window at right
set splitright
" splitting of window places new window below
set splitbelow
" turn on folding
set foldenable
" set syntax folding
set foldmethod=indent
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

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
set statusline=%<%f\ %{fugitive#statusline()}%h%m%r%=%-14.(%l,%c%V%)\ %P
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
set shortmess=atI
set nojoinspaces
syntax enable
filetype on
filetype plugin on
filetype indent on
" make new empty files markdown by default
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif
" save markdown file with first line as filename
nnoremap <leader>wm :execute "w ".fnameescape(strpart(getline(1),2)."\.md")<cr>

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
"set showbreak=>\ 

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

noremap <S-u> J

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Make CTRL-U and CTRL-W 'undoable'
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" YankRing settings
" Bypass single letter deletes
let g:yankring_min_element_length = 2
let g:yankring_history_file = '.yankring_history'

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

" Set working directory to current directory
nnoremap <leader>wd :cd %:p:h<cr>

" move by screen lines, not file lines 
" Map for both Windows and Mac.
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g0
nmap <A-j> gj
nmap <A-k> gk
nmap <A-4> g$
nmap <A-6> g^
nmap <A-0> g0
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g0
vmap <A-j> gj
vmap <A-k> gk
vmap <A-4> g$
vmap <A-6> g^
vmap <A-0> g0

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

" Buffer mappings
nnoremap <leader>bb :b#
nnoremap <leader>bd :bdelete

" Color settings
set background=dark
let g:solarized_termcolors=16
"let g:solarized_termcolors=256
colorscheme solarized
map <leader>cl :set background=light<CR>:colorscheme solarized<CR>
map <leader>cd :set background=dark<CR>:colorscheme solarized<CR>
map <leader>bg :ToggleBG<CR>

"
noremap <leader>f :NERDTreeToggle<CR>
noremap <leader>F :NERDTreeFind<CR>

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

" edit file in new tab

" jump to current window/tab if buffer is already open
"set switchbuf=usetab


nnoremap <leader>lpu /\vend.*customO<c-r>*<esc>


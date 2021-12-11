" Disable vi compatibility mode
set nocompatible

" Set custom leader character
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundle management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off "required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Color schemes
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'baeuml/summerfruit256.vim'
"Plugin 'chriskempson/base16-vim'

" File/buffer management
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'dhruvasagar/vim-table-mode'

" Other plugins
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-obsession'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" call togglebg to autoload the togglebg plugin as part of Solarized
" call togglebg#map("")
"map <leader>bg :ToggleBG<CR>

set background=dark

" leave the default colorscheme for now

"let g:solarized_termcolors=256 " Uncomment if terminal isn't using solarized colors
"colorscheme solarized

" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden
nnoremap <leader>bb :b#
nnoremap <leader>bd :bdelete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitright
set splitbelow
nnoremap <leader>wv :vnew
nnoremap <leader>wh :new
let g:tmux_navigator_disable_when_zoomed = 1

" enable the mouse to move windows
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>tc :tabclose
map <Leader>tn :tabnew

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab, shift, and indent settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch
set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch
nnoremap <silent> <leader><space> :noh<cr> " clear search highlighting

" Regexp searches by default
nnoremap / /\v
vnoremap / /\v

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make new empty files markdown by default
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

" save markdown file with first line as filename
nnoremap <leader>wm :execute "w ~/Desktop/".fnameescape(strpart(getline(1),2)."\.md")<cr>

" Markdown settings
let g:vim_markdown_initial_foldlevel=100

" Table formatting
if exists(":Tabularize")
    nmap <leader>mt :Tabularize /\|<CR>
    vmap <leader>mt :Tabularize /\|<CR>
endif

" Table
let g:table_mode_always_active = 0
let g:table_mode_corner = '|'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File/directory settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" File browser
noremap <leader>f :NERDTreeToggle<CR>
noremap <leader>F :NERDTreeFind<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
if has("unix")
    map <leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map <leader>ee :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

" Set working directory to current directory
nnoremap <leader>wd :cd %:p:h<cr>

set encoding=utf-8
set fileformats=unix,dos " prefer unix fileformatting over dos, even on Windows
filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deleting/joining across lines
set backspace=indent,eol,start
set nojoinspaces

" Keep 3 lines at the top/bottom when scrolling
set scrolloff=3

" mapping to show whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>ws :set nolist!<cr>

" Text width
set wrap
set textwidth=76
set formatoptions=coqrnlb1
set linebreak

" autocomplete settings
set wildmenu
set wildmode=list:longest

" better % matching
runtime macros/matchit.vim

" map tab/shift+tab to indent/outdent
nmap <Tab> >>
nmap <S-Tab> <<
imap <Tab> <C-t>
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" html/xml comment
map <F5> mzI<!-- A -->`z5l
" html/xml uncomment
map <F6> mz0/<!-- df / -->df>`z5h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bubble single lines
nmap <S-k> [e
nmap <S-j> ]e

" Bubble multiple lines
vmap <S-k> [egv
vmap <S-j> ]egv

" Remap J to U since we use J above for bubbling lines
noremap <S-u> J

" Remap K to M since we use K above for bubbling lines
noremap <S-m> K

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/paste undo/redo settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make CTRL-U and CTRL-W 'undoable'
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" YankRing settings
" Bypass single letter deletes
let g:yankring_min_element_length = 2
let g:yankring_history_file = '.yankring_history'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim chrome/behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmode
set showcmd
auto BufEnter * let &titlestring=@%
set title
set titleold=""

" Status line settings
set ruler
set laststatus=2
set statusline=%<%f\ %{fugitive#statusline()}%h%m%r%=%-14.(%l,%c%V%)\ %P

" Line numbers
if version >= 703
    set relativenumber
else
    set number
endif

set ttyfast
set noerrorbells
set shortmess=atI
set history=1000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Meta
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ; works like :
nnoremap ; :
vnoremap ; :

" edit/source .vimrc/.gvimrc file
" nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" nnoremap <leader>eg <C-w><C-v><C-l>:e $MYGVIMRC<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>eg :e $MYGVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Custom shortcut for pasting into Perforce protect file
nnoremap <leader>lpu /\vend.*customO<c-r>*<esc>

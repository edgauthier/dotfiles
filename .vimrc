" set no compatibility mode
set nocompatible
" make sure the ruler is on
set ruler
" make sure a status line is always there
set laststatus=2
" enable command completion
set wildmenu
" enable line numbering
set number
" enable the mouse to move windows
set mouse=a
" set backspace to wrap to the next line
set backspace=2
" incremental searching
set incsearch
" ignore case when searching
set ignorecase
" smartcase - all lower ignores case, some upper matches case
set smartcase
" turn on highlighting when searching
set hlsearch
" number of spaces a tab equals
set tabstop=2
" set shiftwidth for number of space used when autoindenting
set shiftwidth=2
" set tabs to be inserted instead of spaces
set expandtab
" keeps indent from previous line
set autoindent
" inserts a tab based on shiftwidth
set smarttab
" round shifting to nearset shiftwidth
set shiftround
" use c indenting
set cindent
" better colors on light background
set background=dark
" no error bell
set noerrorbells
" show matching bracket
set showmatch
" syntax highlighting on
syntax enable
" show mode
set showmode
" Show a command when it's in progress
set showcmd
" mappings do not work recursively
set noremap
" indent a block of text between { }
map <F4> my?{%kmzj%j:.,'zs/^.*$/  &/`y 
" unindent a block of text between { }
map <F3> my?{%kmzj%j:.,'zs/^  \\|^  //`y
" used for formating long lines
set textwidth=70
" set format options
set formatoptions=cqrolb
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

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

" copy text to the windows clipboard
" don't use until I figure out what to do when deleteing text, etc
" overwrites the clipboard...
"set clipboard=unnamed
" font
set guifont=Consolas:h12.00
set guioptions=begmrLtT

map  :WMToggle
map  :FirstExplorerWindow
map  :BottomExplorerWindow

" Tab mappings
" close tab
map <Leader>c :tabclose
" create a new tab
map <Leader>t :tabnew
" edit file in new tab

" jump to current window/tab if buffer is already open
"set switchbuf=usetab


" Abbreviations
ab pfn /*/function () {}<Up><Right><Right><Right><Right><Right><Right><Right><Right><BS>

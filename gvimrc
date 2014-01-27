set lines=40
set columns=140

" copy text to the windows clipboard
" don't use until I figure out what to do when deleteing text, etc
" overwrites the clipboard...
"set clipboard=unnamed

if has("macunix")
    set guifont=Menlo_Regular:h15
else
    set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
endif

set guioptions+=b

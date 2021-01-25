" my filetype file
    if exists("did_load_filetypes")
        finish 
    endif
	augroup filetypedetect
        au! BufRead,BufNewFile *.module
        au BufRead,BufNewFile *.module  setfiletype php
        au BufRead,BufNewFile *.module  set shiftwidth=2 softtabstop=2 tabstop=2

        au! BufRead,BufNewFile *.include
        au BufRead,BufNewFile *.include  setfiletype php
        au BufRead,BufNewFile *.include  set shiftwidth=2 softtabstop=2 tabstop=2

        au! BufRead,BufNewFile *.inc
        au BufRead,BufNewFile *.inc     setfiletype php
        au BufRead,BufNewFile *.inc     set shiftwidth=2 softtabstop=2 tabstop=2

        au BufRead,BufNewFile *.yaml     set shiftwidth=2 softtabstop=2 tabstop=2

        au! BufRead,BufNewFile *.md
        au BufRead,BufNewFile *.md     setfiletype markdown
    augroup END


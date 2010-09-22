" my filetype file
	if exists("did_load_filetypes")
	  finish
	endif
	augroup filetypedetect
	  au! BufRead,BufNewFile *.module		setfiletype php
	  au! BufRead,BufNewFile *.include		setfiletype php
	  au! BufRead,BufNewFile *.inc		setfiletype php
	augroup END


" Vim color file
" hacker niejieqiang
" Last Change:  %[% 2005年12月15日 星期四 15时40分34秒 %]%

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="softblack"

hi CursorLine guibg=#2d2d2d
hi Pmenu 		guifg=#c6c6c6 guibg=#444444
hi PmenuSel 	guifg=#000000 guibg=#cae682

hi Normal	    guibg=#121212   guifg=#9090a0
hi Cursor	    guibg=#b3b3df   guifg=#4d4d4d
hi VertSplit	guibg=#505050   guifg=#7f7f7f    gui=none
hi Folded	    guibg=#252525   guifg=#cdad00
hi FoldColumn	guibg=#252525   guifg=#cdad00
hi IncSearch	guifg=#708090 guibg=#f0e68c
hi LineNr		guifg=#4d4d4d
hi ModeMsg	    guifg=#cd9b1d
hi MoreMsg	    guifg=#2e8b57
hi NonText	    guifg=#add8e6 guibg=#252525
hi Question	    guifg=#28a45c
hi Search	    guibg=#b17733   guifg=#f5deb3
hi SpecialKey	guifg=#BF932D
hi StatusLine	guibg=#B2AFAD   guifg=#000000 gui=none
hi StatusLineNC	guibg=#606050   guifg=#303030 gui=none
hi Title	    guifg=#6F1A93
hi Visual	    guifg=#d0d0d0   guibg=#6d8824   gui=none
hi WarningMsg	guifg=#b03030
hi ErrorMsg     guifg=#f7f7f7   guibg=#b03030
hi Directory 	guibg=#121212   guifg=#3784A8

hi Comment	    guifg=#5080a0 gui=italic
hi Constant	    guifg=#a16261
hi Identifier	guifg=#308040   
hi Statement	guifg=#a4a338   
hi Type 		guifg=#6B4D24   
hi PreProc	    guifg=#308040
hi Special	    guifg=#c9b37e
hi Ignore 	    guifg=#666666
"hi Error        guifg=#e0e0e0 guibg=#b03030
hi Error        guifg=#308040 guibg=#121212
hi Todo		    guifg=#802c13   guibg=#c3bc44   gui=none
hi Underlined   guifg=#3784A8 
hi Operator     guifg=#a4a338

"vim:ts=4:tw=4

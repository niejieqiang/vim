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

hi CursorLine guibg=#2d2d2d  gui=none
hi Pmenu 		guifg=#c6c6c6 guibg=#444444  gui=none
hi PmenuSel 	guifg=#000000 guibg=#cae682  gui=none

hi Normal	    guibg=#121212   guifg=#9090a0  gui=none
hi Cursor	    guibg=#b3b3df   guifg=#4d4d4d  gui=none
hi VertSplit	guibg=#505050   guifg=#7f7f7f    gui=none
hi Folded	    guibg=#252525   guifg=#cdad00  gui=none
hi FoldColumn	guibg=#252525   guifg=#cdad00  gui=none
hi IncSearch	guifg=#708090 guibg=#f0e68c  gui=none
hi LineNr		guifg=#4d4d4d  gui=none
hi ModeMsg	    guifg=#cd9b1d  gui=none
hi MoreMsg	    guifg=#2e8b57  gui=none
hi NonText	    guifg=#add8e6 guibg=#252525  gui=none
hi Question	    guifg=#28a45c  gui=none
hi Search	    guibg=#b17733   guifg=#f5deb3  gui=none
hi SpecialKey	guifg=#BF932D  gui=none
hi StatusLine	guibg=#B2AFAD   guifg=#000000 gui=none
hi StatusLineNC	guibg=#606050   guifg=#303030 gui=none
hi Title	    guifg=#6F1A93  gui=none
hi Visual	    guifg=#d0d0d0   guibg=#6d8824   gui=none
hi WarningMsg	guifg=#b03030  gui=none
hi ErrorMsg     guifg=#f7f7f7   guibg=#b03030  gui=none
hi Directory 	guibg=#121212   guifg=#3784A8  gui=none

hi Comment	    guifg=#5080a0 gui=italic  
hi Constant	    guifg=#a16261  gui=none
hi Identifier	guifg=#308040     gui=none
hi Statement	guifg=#a4a338     gui=none
hi Type 		guifg=#6B4D24     gui=none
hi PreProc	    guifg=#308040  gui=none
hi Special	    guifg=#c9b37e  gui=none
hi Ignore 	    guifg=#666666  gui=none
"hi Error        guifg=#e0e0e0 guibg=#b03030
hi Error        guifg=#308040 guibg=#121212  gui=none
hi Todo		    guifg=#802c13   guibg=#c3bc44   gui=none
hi Underlined   guifg=#3784A8   gui=none
hi Operator     guifg=#a4a338  gui=none

"vim:ts=4:tw=4

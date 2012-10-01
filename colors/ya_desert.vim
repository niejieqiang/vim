" Vim color file
" Maintainer:   Zhang Jing
" Last Change:  %[% 2005?ê12??15è? D??ú?? 15ê±40·?34?? %]%

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="softblack"

hi Normal	    guibg=#121212   guifg=#9090a0

hi Cursor	    guibg=#b3b3df   guifg=#4d4d4d    gui=bold
hi VertSplit	guibg=#505050   guifg=#7f7f7f    gui=none
hi Folded	    guibg=#252525   guifg=gold3
hi FoldColumn	guibg=#252525   guifg=gold3
hi IncSearch	guifg=slategrey guibg=khaki
hi LineNr		guifg=grey30
hi ModeMsg	    guifg=goldenrod3
hi MoreMsg	    guifg=SeaGreen
hi NonText	    guifg=#add8e6 guibg=#252525
hi Question	    guifg=#28a45c
hi Search	    guibg=#b17733   guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#606050   guifg=#000000     gui=none
hi StatusLineNC	guibg=#606050   guifg=#333333    gui=none
hi Title	    guifg=#38d9ff
hi Visual	    guifg=#d0d0d0   guibg=#6d8824   gui=none
hi WarningMsg	guifg=salmon
hi ErrorMsg     guifg=#ffffff     guibg=#b03030

hi Comment	    guifg=#5080a0
hi Constant	    guifg=#a16261
hi Identifier	guifg=#308040
hi Statement	guifg=#a4a338
hi PreProc	    guifg=#a54140
hi Type		    guifg=#655723
hi Special	    guifg=#c9b37e
hi Ignore 	    guifg=grey40
hi Error        guifg=#ffffff     guibg=#b03030
hi Todo		    guifg=#802c13   guibg=#c3bc44   gui=bold
"vim:ts=4:tw=4


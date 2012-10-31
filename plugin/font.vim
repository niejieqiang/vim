if has("gui_running")
	colorscheme darkerdesert
else
	colorscheme desert
endif

"<==================================================
" Restore cursor position
"<==================================================
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"")>0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"<==================================================
" color and font setting
"<==================================================
if has("unix")
	set gfw=新宋体\ 12
	set guifont=Monaco\ 12
	set lines=35
	set columns=126
	"<==================================================
	" Yong in VIM
	"<==================================================

	if !exists("s:load_yong2en")
		autocmd InsertLeave * call Yong2en()
		autocmd InsertEnter * call Yong2zh()

		let s:load_yong2en= 1
		exe 'au FuncUndefined * source ' . expand('<sfile>')
		finish
	endif

	let g:input_toggle = 0
	function! Yong2en()
		let g:input_toggle = system("yong-vim 1 -w")
	endfunction
	function! Yong2zh()
		if g:input_toggle != 0
			let g:input_toggle = system("yong-vim 0")
			let g:input_toggle =  0
		endif
	endfunction
elseif has("win32")
	au GUIEnter * simalt ~x
	set guifont=Courier_New:h12:cANSI
	set guifontwide=Courier_New:h12:cGB2312
endif

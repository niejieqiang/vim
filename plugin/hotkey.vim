"<==================================================
" linux terminal cursor emulator
"<==================================================
nmap <A-l> :perldo s///g<left><left><left>
imap <A-l> :perldo s///g<left><left><left>
cmap <A-l> :perldo s///g<left><left><left>
"move
nmap k gk
nmap j gj
nmap 0 g0
nmap $ g$
vmap $ g$
vmap 0 g0
vmap k gk
vmap j gj


map <F1> <nop>
imap <F1> <Esc>
nmap <F1> <Esc>
cmap <F1> <Esc>
cmap <c-a> <home>
cmap <c-e> <end>
cmap <c-b> <left>
cmap <c-f> <right>
cmap <a-b> <s-left>
cmap <a-f> <s-right>
cmap <c-d> <del>
cmap <c-h> <bs>
cmap <c-s> <esc>:w!<cr>
cmap <m-d> <s-right><c-w>
cmap <m-BS> <c-w>

imap <c-s> <esc>:w!<cr>
imap <c-p> <up>
imap <c-n> <down>
imap <c-a> <home>
imap <c-e> <end>
imap <c-f> <right>
imap <c-b> <left>
imap <a-f> <c-w>
imap <a-b> <s-left>
imap <a-f> <s-right>
imap <c-d> <del>
imap <c-h> <bs>
imap <c-v> <esc>"+pi
imap <m-d> <s-right><c-w>

" T : top
" M : middle
nmap T zt
nmap M zz
nmap <m-d> db
nmap <c-s> <esc>:w!<cr>
nmap <c-a> <home>
nmap <c-e> <end>
nmap <c-b> <left>
nmap <c-f> <right>
nmap <a-b> <s-left>
nmap <a-f> <s-right>
nmap <c-d> <del>
nmap <c-h> <bs>
nmap <c-v> "+p
nmap <silent> <leader>vs :<c-u>let @z=&so<cr>:set so=0 noscb<cr>:bo vs<cr>ljzt:setl scb<cr><c-w>p:setl scb<cr>:let &so=@z<cr>
nmap <silent> <leader>sp :<c-u>let @z=&so<cr>:set so=0 noscb<cr>:bo sp<cr>ljzt:setl scb<cr><c-w>p:setl scb<cr>:let &so=@z<cr>

vmap <c-s> <esc>:w!<cr>
vmap <c-a> <home>
vmap <c-e> <end>
vmap <c-b> <left>
vmap <c-f> <right>
vmap <a-b> <s-left>
vmap <a-f> <s-right>
vmap <c-d> <del>
vmap <c-h> <bs>
vmap <c-c> "+y
vmap <c-v> "+p


let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
let g:yankring_default_menu_mode = 0
let g:yankring_paste_check_default_buffer = 0
let g:yankring_max_element_length = 2097152
let g:yankring_clipboard_monitor = 0
let g:yankring_persist = 0
let g:yankring_history_file = '_yankring'

"<==================================================
" MRU plugin
"<==================================================
let MRU_Max_Entries = 40
nmap <cr> :MRU<cr>

"<==================================================
" AutoComplPop
"<==================================================
let g:acp_enableAtStartup = 1
let g:acp_ignorecaseOption = 0
let g:acp_completeOption = '.,w,b,k'
let g:acp_behaviorSnipmateLength=1
let g:acp_mappingDriven = 0  "方便在insertmode移动
let g:acp_behaviorXmlOmniLength = 0
let g:acp_behaviorHtmlOmniLength = 0
let g:acp_behaviorCssOmniPropertyLength = 1
let g:acp_behaviorCssOmniValueLength = 0


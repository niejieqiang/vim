"<==================================================
" MRU plugin
"<==================================================
let MRU_Max_Entries = 40
nmap <cr> :MRU<cr>

"<==================================================
" Yankring
"<==================================================
let g:yankring_replace_n_pkey = '<M-p>'
let g:yankring_replace_n_nkey = '<M-n>'
let g:yankring_max_history = 20
let g:yankring_max_element_length = 20000
let g:yankring_history_file = '_yankring'

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


set guioptions=Mre
set nocompatible
syntax on                   "语法高亮
filetype plugin indent on   "打开插件支持
set fileencodings=ucs-bom,utf-8,cp936,gb18030
set textwidth=80
set formatoptions=mMcqrt
set fileformat=unix
set number                  "显示行号
set cursorline              "高亮当前行
set wrap                    "自动换行
set autoindent              "对齐
set noswapfile
set smartindent              "对齐
set tabstop=4               "设置tab键为4个空格
set shiftwidth=4            "设置行间交错为4个空格
set backspace=2             "使退格键可用
set autoread
set whichwrap+=<,>,h,l      "允许backspace和光标键跨越行边界
set showmatch               "自动匹配括号
set incsearch               "输入搜索内容时就显示搜索结果
set hlsearch
set scrollbind   			"窗口不同时滚
set scrollopt=jump
set laststatus=2			"设置状态栏
set statusline=%<\ %F\ \ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}\ 总共%L行--位置:%l行,%c列 
set mouse=a             "使用鼠标
set bsdir=buffer			"自动切换work目录
set foldenable				"折叠
set foldmethod=manual
set autochdir
nmap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nmap <leader>e zR

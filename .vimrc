" 语法高亮
syntax on
" 显示行号
set nu
" tab空格
set expandtab tabstop=4 shiftwidth=4 softtabstop=0 smarttab
" 自动缩进
set autoindent
" 基于autoindent的一些改进
set smartindent
set ai!
" 开启文件类型检测
filetype plugin indent on
" 对下面的文件类型使用其他的空格方案
autocmd FileType setlocal html,css,xml,yaml,jsx sw=2 ts=2
" 不折行
set nowrap
" 没有swp文件
set noswapfile
" 设置配色方案
" colorscheme dracula
colorscheme onedark
" 设置光标所在的行高亮
set cursorline 
" 将状态行显示在窗口底部倒数第二行
set laststatus=2
" 在输入查找内容的同时，vim就开始对你输入的内容进行匹配，并显示匹配的位置
set incsearch
" 对匹配的所有项目进行高亮显示
set hlsearch
" 开启256色支持
set t_Co=256
let g:dracula_termcolors=256
" set guifont=Source\ Code\ Pro:h14
set guifont=Fira\ Code\ Retina:h14
" 忽略大小写
set ignorecase
" 距离顶部和底部5行
set scrolloff=5

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'ycm-core/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'tyru/caw.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'skywind3000/gutentags_plus'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'rust-lang/rust.vim'
Plug 'mtth/scratch.vim'
Plug 'ap/vim-buftabline'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/vim-gitbranch'
Plug 'ludovicchabant/vim-gutentags'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
" Plug 'racer-rust/vim-racer'
Plug 'stephpy/vim-yaml'
Plug 'djoshea/vim-autoread'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"--------------------------------------------------------
" lightline.vim 状态栏设置
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \     'left': [
  \         [ 'mode', 'paste' ],
  \         [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \ },
  \ 'component_function': {
  \         'gitbranch': 'gitbranch#name',
  \         'filename': 'LightLineFilename'
  \     }
  \ }
function! LightLineFilename()
    return expand('%:p')
endfunction
"--------------------------------------------------------
" YouCompleteMe
" let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files = 1 " 开启 YCM 基于标签引擎
let g:ycm_seed_identifiers_with_syntax=1 " 开启语法关键字补全
let g:ycm_key_list_stop_completion = ['<CR>'] " 回车作为选中
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_register_as_syntastic_checker = 0
" let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转到定义处, 分屏打开
" let g:ycm_register_as_syntastic_checker = 0
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>tt :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
noremap <c-z> <NOP>
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
let g:ycm_semantic_triggers =  {
	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
	\ }
let g:ycm_filetype_whitelist = {
    \ 'javascript': 1,
    \ 'sh': 1,
    \ 'json': 1,
    \ 'yml': 1,
    \ 'py': 1,
    \ 'c': 1,
    \ 'cpp': 1,
    \ 'objc': 1,
    \ 'go': 1,
    \ 'rs': 1,
    \ 'html': 1,
    \ 'css': 1,
    \ 'jade': 1,
    \ 'ejs': 1,
    \ 'jsx': 1,
    \ }
"--------------------------------------------------------
" NERDTree配置
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-t> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"--------------------------------------------------------
" ctrlp配置 文件匹配搜索
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*/node_modules/*,*/logs/*,*.so,*.swp,*.zip,*.log    " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|log|txt)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"--------------------------------------------------------
" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"--------------------------------------------------------
" gtags
let $GTAGSLABEL = 'native-pygments'
" let $GTAGSLABEL = 'native'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.git']
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
"--------------------------------------------------------
" vim-buftabline 可以快速的切换已打开的文件
set hidden
nnoremap <silent> <C-x> :bnext<CR>
nnoremap <silent> <C-z> :bprev<CR>
"--------------------------------------------------------
" rust 自动格式化
"" 开启rust的自动reformat的功能
" let g:rustfmt_autosave = 1
"--------------------------------------------------------
" indentLine 缩进标尺线
let g:indentLine_enabled = 0
"--------------------------------------------------------
" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"--------------------------------------------------------
" tmux-navigator
" let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2
"--------------------------------------------------------
" vim-signify
set updatetime=100
"--------------------------------------------------------


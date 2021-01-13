 "语法高亮
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
" 移除滚动条
set guioptions=
" 设置配色方案
set t_Co=256
set background=dark
" 设置行高
set linespace=3
"--------------------
" colorscheme dracula
" let g:dracula_termcolors=256
" let g:dracula_terminal_italics=1
"--------------------
" colorscheme onedark
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
"--------------------
colorscheme vim-material
let g:material_termcolors=256
let g:material_terminal_italics=1

" 设置光标所在的行高亮
set cursorline 
" 将状态行显示在窗口底部倒数第二行
set laststatus=2
" 在输入查找内容的同时，vim就开始对你输入的内容进行匹配，并显示匹配的位置
set incsearch
" 对匹配的所有项目进行高亮显示
set hlsearch

" set guifont=Menlo:h13
" set guifont=Fira\ Code\ Retina:h13
set guifont=Fira\ Mono:h13
" set guifont=Roboto\ Mono:h13
" 忽略大小写
set ignorecase
" 距离顶部和底部5行
set scrolloff=5
 " 删除bell声音
set visualbell t_vb=
" 全屏
" set fu
" set lines=999 columns=9999
" visual block  Ctrl+v
" visual line   V
set backspace=indent,eol,start
set showtabline=2

" ===================== coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.2.1719")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.1719')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ================================

if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

if has("mac") && has("gui_macvim")
  set macligatures
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'w0rp/ale'
Plug 'tyru/caw.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'raimondi/delimitmate'
" Plug 'skywind3000/gutentags_plus'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'rust-lang/rust.vim'
Plug 'mtth/scratch.vim'
" Plug 'ap/vim-buftabline'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
" Plug 'itchyny/vim-gitbranch'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'terryma/vim-multiple-cursors' " Ctrl+n
Plug 'sheerun/vim-polyglot'
" Plug 'racer-rust/vim-racer'
Plug 'djoshea/vim-autoread'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
" Plug 'mhinz/vim-signify'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'maximbaz/lightline-ale'
Plug 'hzchirs/vim-material'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sinetoami/lightline-hunks'
Plug 'mengelbrecht/lightline-bufferline'
Plug '907th/vim-auto-save'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"--------------------------------------------------------
" lightline.vim 状态栏设置
let g:lightline = {
\    'colorscheme': 'material',
\    'active': {
\        'left': [
\            [ 'mode', 'paste' ],
\            [ 'cocstatus', 'lightline_hunks', 'readonly', 'filename', 'modified' ]
\        ],
\        
\    },
\    'tabline': {
\        'left': [
\            ['buffers']
\        ],
\        'right': []
\    },
\    'component_function': {
\        'filename': 'LightLineFilename',
\        'lightline_hunks': 'lightline#hunks#composer',
\        'cocstatus': 'coc#status'
\    },
\    'component_expand': {
\        'buffers': 'lightline#bufferline#buffers'
\    },
\    'component_type': {
\        'buffers': 'tabsel'
\    }
\}


function! LightLineFilename()
    return expand('%:.')
endfunction

let g:lightline#hunks#branch_symbol = '| '
let g:lightline#hunks#exclude_filetypes = [ 'startify', 'nerdtree', 'vista_kind', 'tagbar' ]

"--------------------------------------------------------
" YouCompleteMe
" let g:ycm_path_to_python_interpreter="/usr/bin/python3"
"  let g:ycm_key_list_select_completion=['<c-n>']
"  let g:ycm_key_list_select_completion = ['<Down>']
"  let g:ycm_key_list_previous_completion=['<c-p>']
"  let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
"  let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
"  let g:ycm_collect_identifiers_from_tags_files = 1 " 开启 YCM 基于标签引擎
"  let g:ycm_seed_identifiers_with_syntax=1 " 开启语法关键字补全
"  let g:ycm_key_list_stop_completion = ['<CR>'] " 回车作为选中
"  let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_register_as_syntastic_checker = 0
" let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转到定义处, 分屏打开
" let g:ycm_register_as_syntastic_checker = 0
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
"  nnoremap <leader>tt :YcmCompleter GoToDefinitionElseDeclaration<CR>
"  nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
"  nmap <leader>D <plug>(YCMHover)
"  noremap <c-z> <NOP>
"-let g:ycm_add_preview_to_completeopt = 0
"-let g:ycm_show_diagnostics_ui = 0
"-let g:ycm_server_log_level = 'info'
"-let g:ycm_min_num_identifier_candidate_chars = 2
"-let g:ycm_collect_identifiers_from_comments_and_strings = 1
"-let g:ycm_complete_in_strings=1
"-let g:ycm_key_invoke_completion = '<c-z>'
"-let g:ycm_auto_hover=''
"-set completeopt=menu,menuone
" let g:ycm_semantic_triggers =  {
"	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"	\ 'cs,lua,javascript': ['re!\w{2}'],
"	\ }
" let g:ycm_filetype_whitelist = {
" \ 'javascript': 1,
" \ 'sh': 1,
" \ 'json': 1,
" \ 'yml': 1,
" \ 'py': 1,
" \ 'c': 1,
" \ 'cpp': 1,
" \ 'objc': 1,
" \ 'go': 1,
" \ 'rs': 1,
" \ 'html': 1,
" \ 'css': 1,
" \ 'jade': 1,
" \ 'ejs': 1,
" \ 'jsx': 1
" \ }
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
" gtags
" let $GTAGSLABEL = 'native-pygments'
" " let $GTAGSLABEL = 'native'
" let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_project_root = ['.git']
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" let g:gutentags_plus_switch = 1
" let g:gutentags_define_advanced_commands = 1
" let g:gutentags_plus_nomap = 1
" noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
"--------------------------------------------------------
" vim-buftabline 可以快速的切换已打开的文件
" set hidden
" nnoremap <silent> <Tab> :bnext<CR>
" nnoremap <silent> <S-Tab> :bprev<CR>
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
" ripgrep
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
    " Rg \+fa
    nnoremap <silent> <Leader>fa :Find<CR> 
    " Rg current word
    nnoremap <Leader>fw :Rg <C-R><C-W><space>
    nnoremap <silent> <C-f> :GFiles<CR>
endif
"--------------------------------------------------------
" JsdDoc
let g:jsdoc_lehre_path = '/Users/kevalin/.nvm/versions/node/v10.16.3/bin/lehre'
"--------------------------------------------------------
" ale
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '~~'
" Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 0
"--------------------------------------------------------
let g:AutoPairsFlyMode = 0
"--------------------------------------------------------
" nnoremap <silent> <C-[> <Plug>(caw:hatpos:comment)
" nnoremap <silent> <C-]> <Plug>(caw:hatpos:uncomment)
"--------------------------------------------------------
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"--------------------------------------------------------
"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
"--------------------------------------------------------
"save current buffer
nnoremap <leader>w :w<cr>
"--------------------------------------------------------
" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"--------------------------------------------------------
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_flow = 1
"--------------------------------------------------------
let g:move_key_modifier = 'C'
"--------------------------------------------------------
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline#bufferline#number_map = {
\ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
\ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"--------------------------------------------------------
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification


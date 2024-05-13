""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""".VIMRC"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""CREATED BY ASH""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set relativenumber
set number
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set clipboard+=unnamed
set smartindent
set smarttab
set backspace=indent,eol,start
set autoread
set hidden
set showcmd
set virtualedit=block
set wrapscan
set hlsearch
set noswapfile
set cursorline
set laststatus=2
set wildmenu
set splitbelow
set termwinsize=20x0
set confirm
set mouse=a
set nocompatible
set cindent
set smartcase
set incsearch
set ignorecase
set background=dark
set ruler

filetype plugin indent on
filetype plugin on
syntax on

augroup Verilog
    autocmd!
    autocmd FileType verilog setlocal omnifunc=syntaxcomplete#Complete
augroup END

autocmd BufRead,BufNewFile *.v set filetype=verilog

"""""""""""""""""""""""""
" => Permanent Undo
""""""""""""""""""""""""" 
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif


"========================
" => Vim-Plug
"========================
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/vim-plug' " vim-plug

Plug 'wakatime/vim-wakatime' " wakatime for vim

Plug 'itchyny/lightline.vim' " lightline status bar

" fzf for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'machakann/vim-highlightedyank' " highlight yank
let g:highlightedyank_highlight_duration = 100

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'dense-analysis/ale'

Plug 'Chiel92/vim-autoformat'

Plug 'sudar/vim-arduino-syntax'
Plug 'skanehira/preview-markdown.vim' " markdown preview
call plug#end()

"========================
" => lightline
"========================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \ }
      \}



"========================
" => vim-lsp
"========================
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

let g:lsp_diagnostics_enabled = 0

"*** Python ***"
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'pylsp',
            \ 'cmd': {server_info->['pylsp']},
            \ 'whitelist': ['python'],
            \ })
endif

"*** JavaScript ***
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
            \ 'whitelist': ['javascript', 'typescript'],
            \ })
endif

"*** TypeScript ***
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
            \ 'whitelist': ['javascript', 'typescript'],
            \ })
endif

"========================
"=> preview-markdown.vim
"========================
let g:preview_markdown_parser = 'glow'
let g:preview_markdown_auto_update = 1

"========================
" => ale
"========================
" sign settings
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" color settings
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEError cterm=underline ctermfg=red gui=underline guifg=red
highlight ALEWarning cterm=underline ctermfg=yellow gui=underline guifg=yellow

" linter settings
let g:ale_linters = {
\   'python': ['flake8'],
\   'verilog': ['iverilog', 'verilator'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

" fixer settings
let g:ale_fixers = {
\   'python': ['isort', 'black'],
\   'verilog': ['iverilog', 'verilator'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

" *** Verilog ***
" verilog settings
let g:ale_verilog_iverilog_options = '-g2012'
let g:ale_verilog_verilator_options = '--lint-only'

" linter torigger
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'

"========================
" => autoformat
"========================
"language specific settings'''

" *** Python ***
let g:formatdef_black = '"black --quiet -"'
let g:formatters_python = ['black']

autocmd BufWritePre *.py execute ':Autoformat'

" *** C/C++ ***
let g:formatdef_clangformat = '"clang-format -style=file"'
let g:formatters_c = ['clangformat']
let g:formatters_cpp = ['clangformat']

" *** JavaScript ***
let g:formatdef_prettier_js = '"prettier --stdin-filepath %"'
let g:formatters_javascript = ['prettier_js']

" *** TypeScript ***
let g:formatdef_prettier_ts = '"prettier --parser typescript --stdin-filepath %"'
let g:formatters_typescript = ['prettier_ts']

" ファイル保存時に自動フォーマットを実行
""autocmd BufWritePre *.c,*.cpp,*.h,*.hpp, *.js, *.ts execute ':Autoformat'


"""""""""""""""""""""""""
"=> key map
"""""""""""""""""""""""""
nmap <Esc><Esc> :nohlsearch<Enter>
noremap <Space>f :Files .<CR>
noremap <Space>c :VimtexCompile<CR>
noremap ss :split<Return><C-w>w
noremap sv :vsplit<Return><C-w>w
noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i


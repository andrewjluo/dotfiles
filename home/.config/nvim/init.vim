call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'othree/html5.vim'
Plug 'tpope/vim-endwise'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less/'
Plug 'rking/ag.vim'
Plug 'w0ng/vim-hybrid'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'JuliaLang/julia-vim'
Plug 'mxw/vim-jsx'
Plug 'wavded/vim-stylus'
Plug 'danro/rename.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sickill/vim-pasta'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-rooter'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'ianks/vim-tsx'
Plug 'iamcco/markdown-preview.vim'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'yssl/QFEnter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'mhartington/nvim-typescript', { 'do': 'sh install.sh' }
Plug 'tpope/vim-abolish'

call plug#end()

let g:airline_theme="bubblegum"

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

"Switch syntax highlighting on
syntax on

let g:html_indent_inctags = "html,body,head,tbody,li,form,table,tr,td"
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number

if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endi

imap jj <Esc>

"Set <leader> to be space
let mapleader = "\<Space>"

set laststatus=2

""Linting with Neomake
"autocmd! BufWritePost * Neomake
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_jsx_enabled_makers = ['eslint']
"let g:neomake_ruby_enabled_makers = ['rubocop']
"let s:tslint_path = system('PATH=$(npm bin):$PATH && which tslint')
"let g:neomake_verbose = 0

"Linting Shortcuts
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprev<CR>

"" load local eslint in the project root
"" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
"let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
"let g:neomake_javascript_eslint_maker = {
"      \ 'args': ['-f', 'compact'],
"      \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"      \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
"      \ 'exe': substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', ''),
"      \ }

"let g:neomake_typescript_tslint_maker = {
"      \ 'exe': substitute(s:tslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', ''),
"      \ 'args': ['%:p'],
"      \ 'errorformat': '%EERROR: %f[%l\, %c]: %m,%E%f[%l\, %c]: %m',
"      \ }

"let g:neomake_tsx_tslint_maker = g:neomake_typescript_tslint_maker

"let g:neomake_typescript_enabled_makers = ['tslint']
"let g:neomake_tsx_enabled_makersa = ['tslint']

"let g:neomake_error_sign = { 'text': '>>', 'texthl': 'airline_error', }
"let g:neomake_warning_sign = { 'text': '>>', 'texthl': 'airline_warning', }

"Linting with Ale
let g:ale_linters = {
\  'ruby': ['rubocop'],
\  'javascript': ['eslint'],
\  'typescript': ['tslint', 'tsserver', 'prettier'],
\  'typescriptreact': ['tslint', 'tsserver', 'prettier'],
\}

let g:ale_fixers = {
\  'typescript': ['prettier'],
\  'typescriptreact': ['prettier'],
\}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

"Open NerdTreeTabs with Ctrl N
map <C-n> :NERDTreeTabsToggle<CR>

"NERDTree Fix Arrows Linux
let NERDTreeDirArrows=0

"Open quickfix window for grep searches
autocmd QuickFixCmdPost *grep* cwindow
"Open quickfix results in a new tab or existing tab
set switchbuf+=usetab,newtab

"JFlex syntax highlighting
augroup filetype
  au BufRead,BufNewFile *.lex,*.flex,*.jflex  set filetype=jflex
augroup END
au Syntax jflex so ~/.vim/syntax/jflex.vim

"Bison syntax highlighting
augroup filetype
  au BufRead,BufNewFile *.y,*.ypp,*.ym  set filetype=yacc
augroup END
au Syntax yacc so ~/.vim/syntax/yacc.vim

"Python syntax changes
au FileType python setl shiftwidth=2 softtabstop=2 expandtab

"Less syntax highlighting
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"Neocomplete startup
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Close scratch window
set completeopt-=preview

"Ag silver searcher
set runtimepath^=~/.vim/bundle/ag

set cursorline
highlight Cursorline cterm=bold

"Vertical line ruler
set colorcolumn=90

"Allow scrolling with mouse in vim
set mouse=nicr

"Map CtrlP to FZF
nnoremap <c-p> :Files<cr>

"Pane moving around easier
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-l> <C-w>l

"Unhighlight search remap
nnoremap <silent> <Leader><space> :nohl<cr>

"Enable jsx syntax highlighting in javascript files
let g:jsx_ext_required = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"Necessary for hybrid colorscheme
set background=dark
colorscheme hybrid

"Case insensitive search
set ignorecase

"Relative line numbers
set relativenumber

"For vim-rooter
let g:rooter_patterns = ['Rakefile', '.git/']

"Tmux navigate left fix for neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

nnoremap <Leader>ve :sp ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vv :vs ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vs :source ~/.config/nvim/init.vim<CR>

"line movement
nmap <M-j> :m+<CR>==
nmap <M-k> :m-2<CR>==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=gv
vmap <M-k> :m-2<CR>gv=gv

cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-f> <RIGHT>
cnoremap <C-b> <LEFT>
cnoremap <C-n> <DOWN>
cnoremap <C-p> <UP>

nnoremap <Leader>gd :TSDef<cr>
nnoremap <Leader>tr :TSRefs<cr>

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

iabbrev REact React
iabbrev COmponent Component
iabbrev COMponent Component
iabbrev Compnoent Component
iabbrev COmpnoent Component
iabbrev improt import
iabbrev impot import

"Brew python
let g:python2_host_prog = '/usr/local/opt/python@2/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

"Cursor buffer
set scrolloff=3

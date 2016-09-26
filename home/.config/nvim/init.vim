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
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

:let g:airline_theme="bubblegum"

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

"Linting
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']

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

"Make command mode easier in normal mode
nnoremap ; :

"Unhighlight search remap
nnoremap <silent> <Leader><space> :nohl<cr>

"Enable jsx syntax highlighting in javascript files
let g:jsx_ext_required = 0 

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"Necessary for hybrid colorscheme
set background=dark
colorscheme hybrid

"==============================================================================
"Neobundle Requirements
"==============================================================================
if has('vim_starting')
    if &compatible
      set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Change the type of make used for different OS
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif

"Increase timeout for YouCompleteMe
let g:neobundle#install_process_timeout = 1500

"Allow JSX in normal JS files
let g:jsx_ext_required = 0 

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'othree/html5.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less/'
NeoBundle 'rking/ag.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'wavded/vim-stylus'

" You can specify revision/branch/tag.

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck"

"==============================================================================

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

"Set <leader> to be ,
let mapleader=","

set laststatus=2

"Syntastic Checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


"Linting

" Syntastic local linter support

let g:syntastic_javascript_checkers = []

function CheckJavaScriptLinter(filepath, linter)
	if exists('b:syntastic_checkers')
		return
	endif
	if filereadable(a:filepath)
		let b:syntastic_checkers = [a:linter]
		let {'b:syntastic_' . a:linter . '_exec'} = a:filepath
	endif
endfunction

function SetupJavaScriptLinter()
	let l:current_folder = expand('%:p:h')
	let l:bin_folder = fnamemodify(syntastic#util#findFileInParent('package.json', l:current_folder), ':h')
	let l:bin_folder = l:bin_folder . '/node_modules/.bin/'
	call CheckJavaScriptLinter(l:bin_folder . 'standard', 'standard')
	call CheckJavaScriptLinter(l:bin_folder . 'eslint_d', 'eslint')
endfunction

autocmd FileType javascript call SetupJavaScriptLinter()

" let g:syntastic_javascript_gjslint_conf = ' --nojsdoc --max_li'
let g:syntastic_python_checkers = ['qlint']

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

"Ctrl-L unhighlights"
nnoremap <c-l> :nohl<cr><c-l>

"Less syntax highlighting
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"Neocomplete startup
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Close scratch window
set completeopt-=preview

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore='.git$|\tmp$'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0
noremap <C-a> :CtrlP /web/lib/a/<CR>

"Ag silver searcher
set runtimepath^=~/.vim/bundle/ag

set cursorline
highlight Cursorline cterm=bold

"fzf vim plugin (brew installed)
set rtp+=~/.fzf

"Vertical line ruler
set colorcolumn=90

"Allow scrolling with mouse in vim
set mouse=nicr

"Necessary for hybrid colorscheme
set background=dark
colorscheme hybrid



"==============================================================================
"Neobundle Requirements
"==============================================================================

if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

 if has('vim_starting')
    if &compatible
      set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/Users/ajluo/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/ajluo/.vim/bundle/'))

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
NeoBundle 'justinmk/vim-syntax-extra'
NeoBundle 'chriskempson/vim-tomorrow-theme'

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

"Syntastic Settings
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler = "clang++"
let c_no_curly_error = 1

"Only turn on Syntastic checking with ctrl-w E
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

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

colorscheme Tomorrow-Night

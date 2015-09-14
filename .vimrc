" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

"{{{ Vundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matchit.zip'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
"Plugin 'Vimacs'
Plugin 'ciaranm/detectindent'
Plugin 'kien/ctrlp.vim'
Plugin 'desert256.vim'
Plugin 'joonty/vim-xdebug.git'
Plugin 'ShowTrailingWhitespace'
Plugin 'slimv.vim'
Plugin 'evidens/vim-twig'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'snipMate'
Plugin 'nielsmadan/harlequin'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'rking/ag.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-abolish'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/unite.vim'

filetype plugin indent on
"}}}


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
map é :TagbarToggle<CR> " alt-i

set tags+=./tags;/$HOME
set tags+=./tags.vendor;/$HOME

" set spell

set background=dark
colorscheme solarized

set expandtab
set tabstop=4
set shiftwidth=4

set hlsearch
set guifont="Monospace\ 11"
set guioptions-=m
set guioptions-=T
set guioptions-=e
set guioptions-=r
set guioptions-=L

set autoindent
"nmap <BS> :FufCoverageFile

" Detect Indent
if has("autocmd")
  autocmd BufReadPost * :DetectIndent
endif
let g:detectindent_preferred_indent = 4
let g:detectindent_preferred_expandtab = 4

" Syntax highlighting:
if has("autocmd")
    au BufRead,BufNewFile *.tpl.html set filetype=smarty
    au BufNewFile,BufRead *.html.twig set filetype=twig
    au BufNewFile,BufRead *.md set filetype=markdown
endif

" Save created folds, see :help 'viewoptions'
"if has("autocmd")
    "au BufWinLeave * silent! mkview
    "au BufWinEnter * silent! loadview
    "set viewoptions=cursor,folds
"endif


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Vimacs setup
let g:VM_CmdHeightAdj = 0
let g:VM_F10Menu = 0

" Autocompletion
set wildmode=longest,full
set wildmenu

" CtrlP settings
let g:ctrlp_map = '<BS>'
let g:ctrlp_root_markers = ['.ctrlp-stop', '.git', 'var/']
let g:ctrlp_clear_cache_on_exit = 0
nmap gb :CtrlPBuffer

cabbrev %% %:h

imap  

set copyindent

noremap <Leader>u :call PhpInsertUse()<CR>

map gs :Gstatus<CR>

set previewheight=30

map gc c

if has("neovim")
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

map g1 :only<CR>

let g:syntastic_php_checkers = ["php"]

imap <A-/> <C-n>

nmap <Space>s :w<CR>
nmap <Space>n :noh<CR>
nmap <A-x> :
nmap <Space>c :Git diff --cached<CR>
nmap <Space>C :Gcommit<CR>
nmap <Space>l :tabnew term://tig<CR>i

nmap <Space>t :tabnew<CR>

function! Preserve(command)
  let w = winsaveview()
  execute a:command
  call winrestview(w)
endfunction

set laststatus=2

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

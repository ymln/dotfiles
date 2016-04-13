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

"{{{
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'L9'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'matchit.zip'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
"Plug 'Vimacs'
Plug 'ciaranm/detectindent'
Plug 'kien/ctrlp.vim'
Plug 'desert256.vim'
"Plug 'joonty/vim-xdebug'
Plug 'ShowTrailingWhitespace'
Plug 'kovisoft/slimv'
Plug 'evidens/vim-twig'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'snipMate'
Plug 'nielsmadan/harlequin'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'rking/ag.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-abolish'
Plug 'Shougo/vimproc.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'TVO--The-Vim-Outliner'
Plug 'thinca/vim-qfreplace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'joonty/vdebug'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/devdocs.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-slamhound'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'guns/vim-clojure-static'
Plug 'luochen1990/rainbow'
Plug 'Rename'

call plug#end()

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
nnoremap <A-i> :BTags<CR>

set tags+=./tags;/$HOME
set tags+=./tags.vendor;/$HOME

" set spell

set background=dark
colorscheme desert

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
"nnoremap <BS> :FufCoverageFile

" Detect Indent
function! DoDetectIndent()
  if exists('b:noDetectIndent')
    return
  endif
  DetectIndent
endfunction
if has("autocmd")
  autocmd BufReadPost *.otl let b:noDetectIndent=1
  autocmd BufReadPost * call DoDetectIndent()
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

let g:unite_source_grep_max_candidates = 200

" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore ' .
      \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

nnoremap <BS> :Files<CR>
nnoremap gb :Buffers<CR>
nnoremap gr :Ag<CR>
nnoremap gm :History<CR>

cabbrev %% %:h

inoremap  

set copyindent

noremap <Leader>u :call PhpInsertUse()<CR>

map gs :Gstatus<CR>

set previewheight=30

map gc c

if has("nvim")
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-H> :bprevious<CR>
nnoremap <A-L> :bnext<CR>

map g1 :only<CR>

let g:syntastic_php_checkers = ["php"]

inoremap <A-/> <C-n>

nnoremap <Space>s :w<CR>
nnoremap <Space>n :noh<CR>
nnoremap <A-x> :
nnoremap <Space>c :Git diff --cached<CR>
nnoremap <Space>C :Gcommit<CR>
nnoremap <Space>l :tabnew term://tig<CR>i

nnoremap <Space>t :tabnew<CR>

function! Preserve(command)
  let w = winsaveview()
  execute a:command
  call winrestview(w)
endfunction

set laststatus=2

set statusline=%t%h%m%r%q\ %<%=%{fugitive#statusline()}\ %lL\ %P

function! Open(file)
  new
  call termopen(['open', a:file])
  startinsert
endfunction
map <F1> :call Open(getline('.'))

set synmaxcol=300

set backupdir=~/.vim/backup/
set directory=~/.vim/swap//

let g:jsx_ext_required = 0

let g:multi_cursor_quit_key='<C-g>'

nnoremap cn :cn<CR>
nnoremap cp :cp<CR>
nnoremap cN :cN<CR>

set fixeol

nnoremap <M-n> :Lines<CR>

"nnoremap K :silent !firefox https://devdocs.io\#q=<C-r><C-w> & <CR>

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><C-w>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><C-w>
cnoremap <C-g>  <C-c>

let g:salve_auto_start_repl = 1


let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^match$']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']

let g:detectindent_preferred_indent = 2

autocmd BufWritePost *.clj silent Require

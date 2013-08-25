execute pathogen#infect()
set nocompatible
set go-=T

call pathogen#helptags()
call pathogen#incubate()

syntax enable
filetype plugin indent on

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set ignorecase
set smartcase
set backspace=indent,eol,start
set laststatus=2
set undofile
set incsearch
set hlsearch

set title

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set directory=$HOME/.vim/tmp//,.

au FocusLost * :wa

set wrap
set textwidth=99
set formatoptions=qrn1
set colorcolumn=99

nnoremap ; :

:colorscheme coalgraal
:set number
:set guifont=Meslo\ LG\ L\ DZ\ Bold:h14
let g:ragtag_global_maps = 1
let g:syntastic_python_checkers=['pylint', 'pyflakes', 'pep8']

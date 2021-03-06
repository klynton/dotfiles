set nocompatible
filetype off
set go-=T

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/autoload/plug.vim,/usr/local/opt/fzf
call plug#begin()

Plug 'garbas/vim-snipmate'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'tsaleh/vim-align'
Plug 'tsaleh/vim-shoulda'
Plug 'ervandew/supertab'
Plug 'vim-ruby/vim-ruby'
Plug 'hdima/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'yodiaditya/vim-pydjango'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-jdaddy'
Plug 'vim-scripts/python.vim--Vasiliev'
Plug 'rodjek/vim-puppet'
Plug 'flazz/vim-colorschemes'
Plug 'gioele/vim-autoswap'

call plug#end()

filetype plugin indent on    " required

syntax on
set clipboard+=unnamedplus
set noswapfile
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

" Why would the default be on top and the left anyway?
set splitbelow
set splitright

set title

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set directory=$HOME/.vim/tmp//,.

au FocusLost * :wa

set wrap
set textwidth=99
set formatoptions=qrn1
set colorcolumn=99
" Set the v-mode highlight
hi Visual term=reverse cterm=reverse guibg=Grey

nnoremap ; :
nnoremap FZF fzf

" Fix vim splitting to save a keystroke.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

":colorscheme coalgraal
:set number
:set guifont=Meslo\ LG\ L\ DZ\ Bold:h14
let g:ragtag_global_maps = 1
let g:syntastic_python_checkers=['pylint', 'pyflakes', 'pep8']

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
"function! SelectaCommand(choice_command, selecta_args, vim_command)
"  try
"   silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
"  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
"    redraw!
"    return
"  endtry
"  redraw!
 " exec a:vim_command . " " . selection
"endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
"nnoremap <leader>f :call FZF<cr>
"function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
 " normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  "call SelectaCommand("find * -type f", "-s " . @z, ":e")
"endfunction
"nnoremap <c-g> :call SelectaIdentifier()<cr>

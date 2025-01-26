
" Mapping keys
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
set nu
syntax on
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set nowrap
set smartcase
set showmatch
set title
set ruler
set et
set number relativenumber
set scrolloff=4
set incsearch
set hlsearch
set autoread
set autowrite
set nobackup
set nowritebackup
set noswapfile
set nocompatible

" Add the Vim plug for installing all extenstions:this should be the 1st step
" After adding, run the command :PlugInstall

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Start adding the plugins here , start with coc i.e conquer of completion
call plug#begin()

" List your plugins here

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()






" Mapping keys
nnoremap <Up> 5k 
nnoremap <Down> 5j
" Search director search
nnoremap @ :execute 'vimgrep /' . expand('<cword>') . '/ **'<CR>:copen<CR>
inoremap { {}<Left>
" Map Escape to switch to terminal normal mode (equivalent to Ctrl-w N)
tnoremap <Esc> <C-w>N

"" cursor customization
" Change cursor shape in different modes
let &t_SI = "\e[6 q"  " Set cursor to vertical bar in Insert mode
let &t_EI = "\e[2 q"  " Set cursor to block in Normal mode
let &t_SR = "\e[4 q"  " Set cursor to underline in Replace mode

set tabline=%!MyTabLine()
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
set splitbelow
set wildignorecase
set path+=**

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
Plug 'eclipse/eclipse.jdt.ls'
call plug#end()

let g:markdown_fenced_languages = ['html', 'java', 'c', 'vim']

let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    " Highlight the current tab
    if tab == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " Add the tab number and filename
    let s .= ' ' . tab . ' ' . fnamemodify(bufname, ':t') . ' '

    " Add a '+' if the buffer is modified
    if bufmodified
      let s .= '[+] '
    endif
  endfor

  " Fill the remaining space
  let s .= '%#TabLineFill#%T'
  return s
endfunction

highlight TabLine      ctermfg=Black ctermbg=Gray   guifg=Black guibg=Gray
highlight TabLineSel   ctermfg=White ctermbg=Blue   guifg=White guibg=Blue
highlight TabLineFill  ctermfg=Black ctermbg=Gray   guifg=Black guibg=Gray

autocmd BufWritePre * normal gg=G

"" cursor customization
" Change cursor shape in different modes
let &t_SI = "\e[6 q"  " Set cursor to vertical bar in Insert mode
let &t_EI = "\e[2 q"  " Set cursor to block in Normal mode
let &t_SR = "\e[4 q"  " Set cursor to underline in Replace mode
" netrw customization - hide files, no help banner and also tree style
" directory
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_localmovecmd = "mv"


set termguicolors
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
set cursorline
set nocursorcolumn
let g:rustfmt_autosave = 1

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'eclipse/eclipse.jdt.ls'
Plug 'rust-lang/rust.vim'
call plug#end()

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Go to definition, references, etc.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" normal mode mappings
nnoremap <C-P> :let @a=expand('%:p')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

highlight CursorLine cterm=underline ctermfg=None ctermbg=NONE gui=underline guifg=Blue guibg=NONE

" remember the annoying backgroud grey highligh for the inlay hint for the rust types..this is it
highlight CocInlayHint guifg=#888888 guibg=NONE gui=italic ctermfg=244 ctermbg=NONE cterm=italic

" highlight the tabs which are inactive
highlight TabLine guibg=#1e1e1e guifg=#83a598 ctermbg=234 ctermfg=109



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



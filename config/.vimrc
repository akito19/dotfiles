" Character encoding
set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" Key mapping
imap <C-[> <esc>

" Basic
set nocompatible
filetype plugin indent on
syntax enable
colorscheme desert

" Editor settings
set noswapfile
set autoread
set ruler
set scrolloff=5
set backspace=indent,eol,start
set clipboard&
set clipboard^=unnamedplus
set visualbell t_bl=
set noerrorbells

" Display settings
set title
set showmatch
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline
set ambiwidth=double
set laststatus=2

" Search settings
set wrapscan
set hlsearch

" Change cursor shape in iTerm
if exists('$ITERM_PROFILE')
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Highlight trailing whitespace
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" Highlight full-width space
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

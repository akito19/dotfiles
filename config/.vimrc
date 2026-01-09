" 文字コード, 改行コード
set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" Key mapping
imap <C-[> <esc>

set nocompatible
filetype plugin indent on

" Color
syntax enable
silent! colorscheme nightfox

" 基本設定
set noswapfile
set autoread
set ruler
set scrolloff=5
set backspace=indent,eol,start
set clipboard&
set clipboard^=unnamedplus
set visualbell t_bl=
set noerrorbells

" 表示設定
set title
set showmatch
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline
set ambiwidth=double
set laststatus=2

" File type
au BufRead,BufNewFile *.rb,*.jb,*.rbi,*.rbs     set filetype=ruby
au BufRead,BufNewFile *.go                      set filetype=go
au BufRead,BufNewFile *.ex,*.exs,*.eex          set filetype=elixir
au BufRead,BufNewFile *.py                      set filetype=python
au BufRead,BufNewFile *.php                     set filetype=php
au BufRead,BufNewFile *.rs                      set filetype=rust
au BufRead,BufNewFile *.c,*.cu,*.h              set filetype=c
au BufRead,BufNewFile *.cc,*.cpp,*.hh,*.hpp,*cl set filetype=cpp
au BufRead,BufNewFile *.hs                      set filetype=haskell
au BufRead,BufNewFile *.elm                     set filetype=elm
au BufRead,BufNewFile *.yml,*.yaml,*.dig        set filetype=yaml

" Split editor
nnoremap <C-l> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-h> :split<CR> :exe("tjump ".expand('<cword>'))<CR>>

" quickrun.vim
set splitbelow
let g:quickrun_config = {'*': {'hook/time/enable': '1', 'split': ''}}

" JavaScript
let g:vim_jsx_pretty_colorful_config = 1

" change cursor shape in different modes
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" Ctags
nnoremap <C-]> g<C-]>
nnoremap <C-[> <C-t>

" 記号補完
function! DeleteParenthesesAdjoin()
    let pos = col(".") - 1  " カーソルの位置．1からカウント
    let str = getline(".")  " カーソル行の文字列
    let parentLList = ["(", "[", "{", "\'", "\""]
    let parentRList = [")", "]", "}", "\'", "\""]
    let cnt = 0

    let output = ""

  	" カーソルが行末の場合
    if pos == strlen(str)
        return "\b"
    endif
    for c in parentLList
        " カーソルの左右が同種の括弧
        if str[pos-1] == c && str[pos] == parentRList[cnt]
            call cursor(line("."), pos + 2)
            let output = "\b"
            break
        endif
        let cnt += 1
    endfor
    return output."\b"
endfunction
" BackSpaceに割り当て
inoremap <silent> <BS> <C-R>=DeleteParenthesesAdjoin()<CR>

" indentLine 設定
let g:loaded_indentLine = 1
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" Configuration binary
augroup Binary
  au!
  au BufReadPre  *.bin let &binary =1
  au BufReadPost * if &binary | silent %!xxd -g 1
  au BufReadPost * set ft=xxd | endif
  au BufWritePre * if &binary | %!xxd -r | endif
  au BufWritePost * if &binary | silent %!xxd -g 1
  au BufWritePost * set nomod | endif
  au!
augroup END

" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" 検索設定
set wrapscan
set hlsearch    " 検索結果をハイライト表示する

" lightline.vim 設定諸々
" https://github.com/itchyny/lightline.vim
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'fugitive#head',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  let modified = &modified ? ' +' : ''
  return expand('%') . modified
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" http://inari.hatenablog.com/entry/2014/05/05/231307
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

" For NeoVim
if has('nvim')
  " change cursor in defferent modes
  let g:ruby_host_prog = '$HOME/.rbenv/shims/ruby'
  " for Mac
  if has('mac')
    " let g:python3_host_prog = '/usr/local/bin/python3'
    let g:python3_host_prog = '$HOME/.pyenv/shims/python3'
  endif
endif

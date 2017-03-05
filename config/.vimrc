" 文字コード, 改行コード
set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" Key mapping
imap <C-[> <esc>

" dein settings
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" TOMLを読み込み、キャッシュする
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let s:toml      = '~/dotfiles/config/.vim/dein.toml'
  let s:lazy_toml = '~/dotfiles/config/.vim/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" カラースキーマデフォルト
syntax enable
colorscheme iceberg

" 基本設定
set noswapfile  " .swpを生成しない
set autoread    " 他でファイルが表示されたとき自動で読み込む
set ruler       " カーソルが何行目の何列目に置かれているかを表示する
set scrolloff=5
set backspace=indent,eol,start
set clipboard=unnamed
set visualbell t_bl=

" 表示設定
set number      " 行番号表示
set title       " タイトル表示
set showmatch   " 対応する括弧を表示
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline
set ambiwidth=double
set laststatus=2

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

" NERDTree
let NERDTreeShowHidden = 1

if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif

" ビープ音を消す
set visualbell t_vb=
set noerrorbells

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

" vim-javascript-syntax
au FileType javascript call JavaScriptFold()

" vim-coffee-script
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" indentLine 設定
let g:loaded_indentLine = 1
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" configuration golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" </ でHTMLの閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" 検索設定
set wrapscan
set hlsearch    " 検索結果をハイライト表示する

" https://github.com/itchyny/lightline.vim
""""""""""""""""""""""""""""""
" lightline.vim 設定諸々
""""""""""""""""""""""""""""""
let g:lightline = {
        \ 'colorscheme': 'iceberg',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode'
        \ }
        \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" NeoVim 固有設定
""""""""""""""""""""""""""""""
if has('nvim')
  " change cursor in defferent modes
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let g:deoplete#enable_at_startup = 1
endif

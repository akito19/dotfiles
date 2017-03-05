augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.ex setfiletype elixir
  au BufRead,BufNewFile *.py setfiletype python
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.swift setfiletype swift
  au BufRead,BufNewFile *.go setfiletype go
augroup END

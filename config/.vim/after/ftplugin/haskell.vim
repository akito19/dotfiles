set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

augroup ghcmodcheck
  autocmd! BufWritePost <buffer> GhcModCheckAsync
augroup END

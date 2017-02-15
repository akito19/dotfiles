function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-src() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-hub() {
  local selected_repo=$(ghq list -p | peco --query "$LBUFFER" | rev | cut -d "/" -f -2 | rev)
  if [ -n "$selected_repo" ]; then
    BUFFER="hub browse ${selected_repo}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-hub
bindkey '^h' peco-hub

function show_open_issues_on_web() {
  ghi show -w $(ghi list --filter 'all'| peco)
}
alias si=show_open_issues_on_web

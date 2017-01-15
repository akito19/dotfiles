# tab でパスの補完候補を示す
zstyle ':completion:*:default' menu select=1
# 補完時に大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..

# pick-web-browser を使った時、firefox で開く
zstyle ':mime:*' browser-style running x
zstyle ':mime:*' x-browsers firefox

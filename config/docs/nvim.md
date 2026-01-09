# Neovim Configuration

lazy.nvim を使用した Neovim 設定ファイルのドキュメント。

## セットアップ

### 前提条件

- Neovim 0.9.0 以上
- Git
- ripgrep (`rg`) - Telescope の grep 検索に必要
- Node.js - 一部の LSP サーバーに必要
- make - telescope-fzf-native のビルドに必要

### インストール

1. シンボリックリンクの作成（mitamae を使用）:

```bash
mitamae local bootstrap.rb
```

2. Neovim を起動:

```bash
nvim
```

初回起動時に lazy.nvim が自動でプラグインをインストールします。

3. LSP サーバーのインストール:

Neovim 内で `:Mason` を実行し、必要な LSP サーバーをインストールしてください。

## ディレクトリ構造

```
config/nvim/
├── init.lua                    # エントリーポイント
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # lazy.nvim ブートストラップ
│   │   ├── options.lua         # 基本設定 (set 系)
│   │   ├── keymaps.lua         # キーマッピング
│   │   └── autocmds.lua        # autocmd 設定
│   └── plugins/
│       ├── colorscheme.lua     # カラースキーム (nightfox, iceberg)
│       ├── ui.lua              # UI (lualine, indent-blankline)
│       ├── editor.lua          # エディタ機能 (auto-pairs, whitespace, quickrun)
│       ├── git.lua             # Git 連携 (gitsigns, fugitive)
│       ├── telescope.lua       # ファジーファインダー
│       ├── languages.lua       # Treesitter, 言語別プラグイン
│       └── lsp.lua             # LSP, 補完 (nvim-lspconfig, nvim-cmp, LuaSnip)
└── after/ftplugin/             # ファイルタイプ別設定
```

## キーマッピング

### LSP

| キー | 機能 |
|------|------|
| `gd` | 定義へジャンプ |
| `gh` | 水平分割 + 定義へジャンプ |
| `gl` | 垂直分割 + 定義へジャンプ |
| `gp` | 新タブで定義へジャンプ |
| `gy` | 型定義へジャンプ |
| `gi` | 実装へジャンプ |
| `gr` | 参照一覧 |
| `K` | ホバードキュメント |
| `[g` | 前の診断へ |
| `]g` | 次の診断へ |
| `<leader>rn` | シンボルのリネーム |
| `<leader>ac` | コードアクション |
| `<leader>qf` | クイックフィックス |
| `<leader>f` | フォーマット |

### Telescope

| キー | 機能 |
|------|------|
| `<leader>ff` | ファイル検索 |
| `<leader>fg` | grep 検索 (live_grep) |
| `<leader>fb` | バッファ一覧 |
| `<leader>fh` | ヘルプタグ検索 |
| `<leader>fr` | 最近開いたファイル |
| `<leader>fc` | コマンド一覧 |
| `<leader>fs` | ドキュメントシンボル |
| `<leader>fw` | ワークスペースシンボル |
| `<leader>fd` | 診断一覧 |
| `<leader>ft` | Treesitter シンボル |
| `<leader><leader>` | バッファ一覧 |

### Git (gitsigns)

| キー | 機能 |
|------|------|
| `]c` | 次の変更箇所へ |
| `[c` | 前の変更箇所へ |
| `<leader>hs` | ハンクをステージ |
| `<leader>hr` | ハンクをリセット |
| `<leader>hS` | バッファをステージ |
| `<leader>hu` | ステージを取り消し |
| `<leader>hR` | バッファをリセット |
| `<leader>hp` | ハンクをプレビュー |
| `<leader>hb` | 行の blame を表示 |
| `<leader>tb` | 行 blame のトグル |
| `<leader>hd` | diff を表示 |
| `<leader>td` | 削除行のトグル |

### Git (fugitive)

| キー | 機能 |
|------|------|
| `<leader>gs` | Git status |
| `<leader>gb` | Git blame |
| `<leader>gd` | Git diff |

### その他

| キー | 機能 |
|------|------|
| `<leader>r` | QuickRun |
| `<C-n>` | マルチカーソル |

## プラグイン一覧

### パッケージマネージャ

- [lazy.nvim](https://github.com/folke/lazy.nvim) - モダンな Neovim プラグインマネージャ

### LSP / 補完

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP クライアント設定
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP サーバー管理
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason と lspconfig の連携
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - 補完エンジン
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - スニペットエンジン
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - スニペット集

### UI

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - ステータスライン
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - インデントガイド
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - ファイルアイコン

### ファジーファインダー

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - ファジーファインダー
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - FZF ソーター

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git サイン表示
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git 操作
- [git-switcher.vim](https://github.com/Toruiwashita/git-switcher.vim) - ブランチ切り替え

### エディタ機能

- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - 括弧の自動補完
- [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace) - 末尾空白の可視化
- [vim-quickrun](https://github.com/thinca/vim-quickrun) - コード実行
- [vim-endwise](https://github.com/tpope/vim-endwise) - end の自動補完
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi) - マルチカーソル
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - カラーコードの可視化

### シンタックス / 言語サポート

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - シンタックスハイライト
- 各言語用プラグイン (vim-ruby, vim-rails, vim-go, rust.vim など)

### カラースキーム

- [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) - メインテーマ
- [iceberg.vim](https://github.com/cocopon/iceberg.vim) - 代替テーマ

## LSP サーバー

Mason でインストールされる LSP サーバー:

| サーバー | 言語 |
|----------|------|
| lua_ls | Lua |
| pyright | Python |
| gopls | Go |
| rust_analyzer | Rust |
| ts_ls | TypeScript / JavaScript |
| clangd | C / C++ |
| solargraph | Ruby |
| elixirls | Elixir |
| hls | Haskell |
| dockerls | Dockerfile |

## コマンド

| コマンド | 機能 |
|----------|------|
| `:Lazy` | lazy.nvim の UI を開く |
| `:Mason` | Mason の UI を開く |
| `:LspInfo` | LSP の状態を表示 |
| `:LspRestart` | LSP を再起動 |
| `:Telescope` | Telescope を開く |
| `:QuickRun` | 現在のファイルを実行 |

## トラブルシューティング

### プラグインが読み込まれない

```vim
:Lazy
```

を実行して、プラグインの状態を確認してください。`Sync` でプラグインを再インストールできます。

### LSP が動作しない

1. `:LspInfo` で LSP の状態を確認
2. `:Mason` で LSP サーバーがインストールされているか確認
3. `:LspRestart` で LSP を再起動

### Treesitter のパーサーがない

```vim
:TSInstall <language>
```

で必要な言語のパーサーをインストールしてください。

## 参考リンク

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [mason.nvim](https://github.com/williamboman/mason.nvim)

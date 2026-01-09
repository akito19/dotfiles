-- Language-specific plugins
-- Migrated from dein.toml

return {
  -- Treesitter for better syntax highlighting
  -- Reference: https://github.com/nvim-treesitter/nvim-treesitter
  -- Run :TSInstall <lang> manually to install parsers
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },
    config = function()
      -- Enable treesitter-based highlighting for supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },

  -- Ruby/Rails
  {
    "vim-ruby/vim-ruby",
    ft = "ruby",
  },
  {
    "tpope/vim-rails",
    ft = "ruby",
  },

  -- Elixir
  {
    "elixir-editors/vim-elixir",
    ft = "elixir",
  },

  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- JavaScript/TypeScript
  {
    "MaxMEllon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      vim.g.vim_jsx_pretty_colorful_config = 1
    end,
  },

  -- Vue
  {
    "posva/vim-vue",
    ft = "vue",
  },

  -- Markdown
  {
    "tpope/vim-markdown",
    ft = { "markdown", "md" },
  },

  -- TOML
  {
    "cespare/vim-toml",
    ft = "toml",
  },

  -- JSONC support
  {
    "kevinoid/vim-jsonc",
    ft = { "json", "jsonc" },
  },

  -- Elm
  {
    "ElmCast/elm-vim",
    ft = "elm",
  },
}

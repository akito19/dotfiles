-- Language-specific plugins
-- Migrated from dein.toml

return {
  -- Treesitter for better syntax highlighting
  -- Reference: https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- Parsers to install (run :TSInstall all manually if needed)
      local ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "elixir",
        "go",
        "haskell",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "ruby",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      -- Check if parser is installed by looking at parser directory
      local parser_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser/"

      local function is_parser_installed(lang)
        local parser_file = parser_dir .. lang .. ".so"
        return vim.fn.filereadable(parser_file) == 1
      end

      -- Install missing parsers only once (check file existence)
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local missing = {}
          for _, lang in ipairs(ensure_installed) do
            if not is_parser_installed(lang) then
              table.insert(missing, lang)
            end
          end
          if #missing > 0 then
            vim.cmd("TSInstall " .. table.concat(missing, " "))
          end
        end,
        once = true,
      })

      -- Enable treesitter highlighting for supported filetypes
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

  -- Go
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
    config = function()
      vim.g.go_def_mapping_enabled = 0 -- Use LSP for go-to-definition
      vim.g.go_doc_keywordprg_enabled = 0 -- Use LSP for hover
    end,
  },

  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- Haskell
  {
    "neovimhaskell/haskell-vim",
    ft = "haskell",
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

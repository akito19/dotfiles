-- Editor plugins
-- Migrated from dein.toml

return {
  -- Auto pairs (replacing jiangmiao/auto-pairs)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },

  -- Trailing whitespace (replacing bronson/vim-trailing-whitespace)
  {
    "ntpeters/vim-better-whitespace",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 0
    end,
  },

  -- Quickrun
  {
    "thinca/vim-quickrun",
    cmd = "QuickRun",
    keys = {
      { "<leader>r", "<cmd>QuickRun<cr>", desc = "QuickRun" },
    },
    config = function()
      vim.g.quickrun_config = {
        ["*"] = {
          ["hook/time/enable"] = "1",
          split = "",
        },
      }
    end,
  },

  -- Endwise for Ruby
  {
    "tpope/vim-endwise",
    ft = { "ruby", "lua", "vim", "sh", "zsh" },
  },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-n>", mode = { "n", "v" }, desc = "Multi cursor" },
    },
  },

  -- Colorizer for CSS colors
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      "*",
      css = { rgb_fn = true },
      html = { names = false },
    },
  },
}

-- Colorscheme plugins
-- Migrated from dein.toml

return {
  -- nightfox (main colorscheme)
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nightfox")
    end,
  },

  -- iceberg (alternative)
  {
    "cocopon/iceberg.vim",
    lazy = true,
  },
}

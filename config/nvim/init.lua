-- Neovim Configuration
-- Migrated from dein.vim to lazy.nvim

-- Load core configurations
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap and setup lazy.nvim
require("config.lazy")

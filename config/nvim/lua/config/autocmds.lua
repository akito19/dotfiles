-- Autocmds configuration
-- Migrated from .vimrc

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- File type detection
augroup("FileTypeDetection", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.rb", "*.jb", "*.rbi", "*.rbs" },
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.go" },
  callback = function()
    vim.bo.filetype = "go"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.ex", "*.exs", "*.eex" },
  callback = function()
    vim.bo.filetype = "elixir"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.py" },
  callback = function()
    vim.bo.filetype = "python"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.php" },
  callback = function()
    vim.bo.filetype = "php"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.rs" },
  callback = function()
    vim.bo.filetype = "rust"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.c", "*.cu", "*.h" },
  callback = function()
    vim.bo.filetype = "c"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.cc", "*.cpp", "*.hh", "*.hpp", "*.cl" },
  callback = function()
    vim.bo.filetype = "cpp"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.hs" },
  callback = function()
    vim.bo.filetype = "haskell"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.elm" },
  callback = function()
    vim.bo.filetype = "elm"
  end,
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypeDetection",
  pattern = { "*.yml", "*.yaml", "*.dig" },
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

-- Trailing whitespace highlight
augroup("WhitespaceHighlight", { clear = true })
autocmd({ "BufWinEnter", "WinEnter" }, {
  group = "WhitespaceHighlight",
  callback = function()
    vim.fn.matchadd("WhitespaceEOL", " +$")
  end,
})

-- Whitespace highlight color
vim.api.nvim_set_hl(0, "WhitespaceEOL", { cterm = { underline = true }, ctermbg = "red", bg = "#FF0000" })

-- Zenkaku space highlight
augroup("ZenkakuSpace", { clear = true })
autocmd("ColorScheme", {
  group = "ZenkakuSpace",
  callback = function()
    vim.api.nvim_set_hl(0, "ZenkakuSpace", { cterm = { underline = true }, ctermfg = "lightblue", bg = "darkgray" })
  end,
})
autocmd({ "VimEnter", "WinEnter", "BufRead" }, {
  group = "ZenkakuSpace",
  callback = function()
    vim.fn.matchadd("ZenkakuSpace", "\xe3\x80\x80") -- Full-width space
  end,
})

-- Binary file handling
augroup("Binary", { clear = true })
autocmd("BufReadPre", {
  group = "Binary",
  pattern = "*.bin",
  callback = function()
    vim.bo.binary = true
  end,
})
autocmd("BufReadPost", {
  group = "Binary",
  callback = function()
    if vim.bo.binary then
      vim.cmd("silent %!xxd -g 1")
      vim.bo.filetype = "xxd"
    end
  end,
})
autocmd("BufWritePre", {
  group = "Binary",
  callback = function()
    if vim.bo.binary then
      vim.cmd("%!xxd -r")
    end
  end,
})
autocmd("BufWritePost", {
  group = "Binary",
  callback = function()
    if vim.bo.binary then
      vim.cmd("silent %!xxd -g 1")
      vim.bo.modified = false
    end
  end,
})

-- mdview.nvim: command-driven markdown preview in a split
-- Uncomment `dir` to develop against the local checkout instead of the
-- published plugin; lazy.nvim uses the directory in place of the clone.

return {
  {
    "akito19/mdview.nvim",
    -- "~/src/github.com/akito19/mdview.nvim",
    cmd = { "MdView", "MdViewClose", "MdViewToggle" },
    ft = "markdown",
    opts = {},
  },
}

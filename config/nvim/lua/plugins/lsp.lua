-- LSP Configuration
-- Using Neovim 0.11+ native vim.lsp.config API
-- Reference: :help lspconfig-nvim-0.11

return {
  -- Mason for LSP server management
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason LSPConfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
        "clangd",
        "solargraph",
        "elixirls",
        "dockerls",
      },
      automatic_installation = true,
    },
  },

  -- LSP Config (for filetype detection and server configs)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Capabilities with nvim-cmp
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Server configurations using vim.lsp.config (Neovim 0.11+)
      -- Reference: :help vim.lsp.config
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index" },
      })

      vim.lsp.config("solargraph", {
        capabilities = capabilities,
        settings = {
          solargraph = {
            diagnostics = false,
            formatting = true,
          },
        },
      })

      vim.lsp.config("elixirls", {
        capabilities = capabilities,
      })

      vim.lsp.config("dockerls", {
        capabilities = capabilities,
      })

      vim.lsp.config("elmls", {
        capabilities = capabilities,
      })

      -- Enable all configured servers
      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
        "clangd",
        "solargraph",
        "elixirls",
        "dockerls",
        "elmls",
      })

      -- LSP keymaps using LspAttach autocmd (Neovim 0.11+ recommended approach)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local opts = { noremap = true, silent = true, buffer = ev.buf }
          local keymap = vim.keymap.set

          -- GoTo code navigation (from coc.nvim)
          keymap("n", "gd", vim.lsp.buf.definition, opts)
          keymap("n", "gh", function()
            vim.cmd("split")
            vim.lsp.buf.definition()
          end, opts)
          keymap("n", "gl", function()
            vim.cmd("vsplit")
            vim.lsp.buf.definition()
          end, opts)
          keymap("n", "gp", function()
            vim.cmd("vsplit")
            vim.lsp.buf.definition()
            vim.cmd("wincmd T")
          end, opts)
          keymap("n", "gy", vim.lsp.buf.type_definition, opts)
          keymap("n", "gi", vim.lsp.buf.implementation, opts)
          keymap("n", "gr", vim.lsp.buf.references, opts)

          -- Show documentation (from coc.nvim K mapping)
          keymap("n", "K", vim.lsp.buf.hover, opts)

          -- Diagnostics navigation (from coc.nvim [g ]g)
          keymap("n", "[g", vim.diagnostic.goto_prev, opts)
          keymap("n", "]g", vim.diagnostic.goto_next, opts)

          -- Symbol renaming (from coc.nvim <leader>rn)
          keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

          -- Code actions (from coc.nvim <leader>ac)
          keymap({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)
          keymap("n", "<leader>qf", function()
            vim.lsp.buf.code_action({
              filter = function(action)
                return action.isPreferred
              end,
              apply = true,
            })
          end, opts)

          -- Format (from coc.nvim <leader>f)
          keymap({ "n", "v" }, "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          -- Signature help
          keymap("i", "<C-k>", vim.lsp.buf.signature_help, opts)

          -- Highlight symbol under cursor
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
            vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = ev.buf })
            vim.api.nvim_create_autocmd("CursorHold", {
              group = highlight_augroup,
              buffer = ev.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = highlight_augroup,
              buffer = ev.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Diagnostics configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
      })

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },

  -- Completion engine (replacing coc.nvim completion)
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- Tab completion (migrated from coc.nvim TAB behavior)
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      -- Cmdline completion
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- LuaSnip (replacing neosnippet)
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")
      luasnip.config.setup({})
    end,
  },
}

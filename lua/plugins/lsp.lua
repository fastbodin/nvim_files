return {
  { -- Mason to manage language servers
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  { -- further connect mason and lsp-config
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright" },
      })
    end,
  },
  { -- lsp-config
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp", -- make sure it and blink are talking
      { -- the lua_ls needs additional help to get working
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    -- configured language servers
    opts = {
      servers = {
        lua_ls = {},
        clangd = { -- add capabilities to server configuration
          cmd = { "clangd" },
        },
        pyright = {},
      },
    },

    config = function(_, opts)
      -- LSP servers and clients communicate which features they support
      -- through "capabilities".
      --  By default, Neovim supports a subset of the LSP specification.
      --  With blink.cmp, Neovim has _more_ capabilities which are
      --  communicated to the LSP servers.
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the
        -- capabilities in your opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}

return {
  {
    "saghen/blink.compat",
    -- lazy.nvim will automatically load the plugin when it's required by
    -- blink.cmp
    lazy = true,
    -- use v2.* for blink.cmp v1.*
    version = "*",
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
    enabled = true,
  },

  {
    "saghen/blink.cmp",
    event = "InsertEnter", -- load blink on InsertEnter
    enabled = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "erooke/blink-cmp-latex",
      "hrsh7th/cmp-calc",
      "micangl/cmp-vimtex",
      {"folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly:
    -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release', If you use nix, you can build from
    -- source using latest nightly rust with: build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "default" },
      -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- ['<C-e>'] = { 'hide' },
      -- ['<C-y>'] = { 'select_and_accept' },
      --
      -- ['<Up>'] = { 'select_prev', 'fallback' },
      -- ['<Down>'] = { 'select_next', 'fallback' },
      -- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      -- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      --
      -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      --
      -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
      -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      --
      -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      signature = { enabled = false },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        menu = {
          border = "single",
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
              kind = {
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
        documentation = { window = { border = "single" } },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "calc",
          "lazydev",
        },
        per_filetype = {
          tex = {
            "latex",
            "vimtex",
          },
        },
        providers = {
          calc = {
            name = "calc",
            module = "blink.compat.source",
          },
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
            opts = {
              -- set to true to insert the latex command instead of the symbol
              insert_command = false,
            },
          },
          vimtex = {
            name = "vimtex",
            module = "blink.compat.source",
            score_offset = 1,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      -- (Default) Rust fuzzy matcher for typo resistance and significantly
      -- better performance You may use a lua implementation instead by using
      -- `implementation = "lua"` or fallback to the lua implementation, when
      -- the Rust fuzzy matcher is not available, by using `implementation =
      -- "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}

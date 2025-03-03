return {
  {
    -- blink.compat is a source provider for blink.cmp that allow you to use
    -- nvim-cmp completion sources.
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest
    -- release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by
    -- blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },

  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'hrsh7th/cmp-calc' },
      { 'kdheepak/cmp-latex-symbols' },
      { 'micangl/cmp-vimtex' },
    },
    -- use a release tag to download pre-built binaries
    version = '*',

    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions
      -- (C-y to accept, C-n/C-p for up/down)
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-e: Hide menu
      -- C-k: Toggle signature help
      --
      -- See the full "keymap" documentation for information on defining your
      -- own keymap.
      keymap = { preset = 'default' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer',
          'calc',    --'dictionary'
        },
        per_filetype = { -- You may also define providers per filetype
          tex = { 'vimtex', 'latex_symbols' },
        },
        providers = { -- blink.compact provides via nvim-cmp
          calc = {
            name = 'calc',
            module = 'blink.compat.source'
          },
          latex_symbols = {
            name = 'latex_symbols',
            module = 'blink.compat.source',
            -- show symbols but insert text
            opts = { strategy = 2 }
          },
          vimtex = {
            name = 'vimtex',
            module = 'blink.compat.source',
            score_offset = 1,
          },
        }
      },

      -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and
      -- significantly better performance You may use a lua implementation
      -- instead by using `implementation = "lua"` or fallback to the lua
      -- implementation, when the Rust fuzzy matcher is not available, by using
      -- `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },

      -- customize look
      completion = {
        documentation = { window = { border = 'single' } },
        menu = {
          border = 'single',
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
              }
            }
          }
        }
      },
    },
    opts_extend = { "sources.default" },
  }
}

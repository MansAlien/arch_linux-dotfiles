
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = false,
    syntax = {
      enabled = true,
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      markdown = true,
      telescope = true,
      neo_tree = true,
      lualine = true,
      indent_blankline = { enabled = true },
      alpha = true,
      toggleterm = true,
    },
    highlight_overrides = {
      mocha = function(colors)
        return {
          Comment = { fg = colors.flamingo },
        }
      end,
      macchiato = function(colors)
        return {
          Comment = { fg = colors.flamingo },
        }
      end,
      frappe = function(colors)
        return {
          Comment = { fg = colors.flamingo },
        }
      end,
      latte = function(colors)
        return {
          Comment = { fg = colors.flamingo },
        }
      end,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}


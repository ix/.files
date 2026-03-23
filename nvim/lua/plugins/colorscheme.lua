return {
  { "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      bold = true,
      undercurl = true,
      italics = true,
      compile = true,
      background = {
        dark = "zen",
        light = "pearl"
      },
      dimInactive = true,
      terminalColors = true
    }
    -- for kanagawa.nvim and others
    -- opts = {
    --   colors = {
    --     theme = {
    --       all = {
    --         ui = {
    --           bg_gutter = "none"
    --         }
    --       }
    --     }
    --   }
    -- }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanso-zen"
    },
  }
}

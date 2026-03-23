return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      hls = {
        mason = false,
        settings = {
          haskell = {
            plugin = {
              -- added this because hls is broken until 2.13.0.0
              hlint = { globalOn = false },
              ghcide_completions = {
                config = {
                  autoExtendOn = false
                }
              }
            }
          }
        }
      }
    }
  }
}

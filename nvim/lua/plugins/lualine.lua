return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      always_divide_middle = false
    },

    sections = {
      lualine_a = {{ "mode", fmt = function (str) return str:sub(1, 1) end }},
      lualine_b = {{ "branch" }},
      lualine_c = {{ "filename", path = 4 }},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {{"selectioncount"}, {"searchcount"}, {"location"}},
    },

    extensions = {"neo-tree", "lazy", "fzf"}
  }
}

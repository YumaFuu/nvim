local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    find_command = { "fd", "-t=f", "-a" },
    path_display = { "absolute" },
    mappings = {
       n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
      },
      i = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    }
  },
  pickers = {},
  extensions = {}
}

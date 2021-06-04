require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    selection_caret = "» ",
    width = 0.85,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')


local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "nvimrc at ~/.config/nvim/",
    cwd = "$HOME/.config/nvim/",
  })
end

return M

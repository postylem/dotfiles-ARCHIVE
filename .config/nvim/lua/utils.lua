----------------------------------------------
---- Lua configuration for neovim plugins ----
----------------------------------------------
----------------------------------------------


---------------------------------------------
-- settings for plugin which-key.nvim

require("which-key").setup {
  icons = {
    breadcrumb = "+", -- symbol used in the command line area that shows your active key combo
    separator = "->", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  }
}

---------------------------------------------
-- settings for plugin telescope.nvim

local actions =  require("telescope.actions")

require('telescope').setup {
  defaults = {
    layout_strategy = 'flex',
    layout_config = {
      width = 0.85, height= 0.95,
      flex = {flip_columns = 120},
    },
    selection_caret = "» ",
    color_devicons = true,
  },
  pickers = {
    buffers = {
      theme = "dropdown",
      sort_lastused = true,
      mappings = {
        i = {["<c-d>"] = actions.delete_buffer,},
        n = {["<c-d>"] = actions.delete_buffer,}
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('coc')

local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "browsing config at" .. " ~/.config/nvim/",
    cwd = "~/.config/nvim",
    depth = 2,
  })
end

return M

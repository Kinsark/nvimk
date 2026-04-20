--[[
    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.shortmess:append 'I'

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

-- Set filetype for Helm templates since it is not in templates/ folder by default.
vim.filetype.add {
  extension = {
    yaml = function(_, bufnr)
      local content = vim.api.nvim_buf_get_lines(bufnr, 0, 40, false)
      for _, line in ipairs(content) do
        if line:find '{{.*}}' or line:find '.Values' or line:find '.Chart' then return 'helm' end
      end
      return 'yaml'
    end,
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

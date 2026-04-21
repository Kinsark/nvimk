---@module 'lazy'
---@type LazySpec
return {
  {
    'tpope/vim-fugitive',
    keys = {
      {
        '<leader>gs',
        vim.cmd.Git,
        mode = 'n',
        desc = '[G]it Fugitive',
      },
      {
        'gu',
        '<cmd>diffget //2<CR>',
        mode = 'n',
        desc = '[G]et [U]pstream left //2',
      },
      {
        'gh',
        '<cmd>diffget //3<CR>',
        mode = 'n',
        desc = '[G]it [H]er right //3',
      },
    },
    config = function()
      local augroup = vim.api.nvim_create_augroup('fugitive_keys', {})

      local autocmd = vim.api.nvim_create_autocmd
      autocmd('BufWinEnter', {
        group = augroup,
        pattern = '*',
        callback = function()
          -- NOTE: Only set these keymaps for fugitive buffers
          if vim.bo.ft ~= 'fugitive' then return end

          local bufnr = vim.api.nvim_get_current_buf()
          vim.keymap.set('n', '<leader>gP', function() vim.cmd.Git 'push' end, { buffer = bufnr, remap = false, desc = '[G]it [P]ush' })

          vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git 'pull --rebase' end, { buffer = bufnr, remap = false, desc = '[G]it [P]ull' })

          vim.keymap.set('n', '<leader>t', ':Git push -u origin ', {
            buffer = bufnr,
            remap = false,
            desc = '[G]it push -u [T]o origin',
          })
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

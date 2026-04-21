---@module 'lazy'
---@type LazySpec
return {
  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>u',
        vim.cmd.UndotreeToggle,
        mode = 'n',
        desc = '[U]ndotree toggle',
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

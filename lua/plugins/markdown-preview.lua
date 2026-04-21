---@module 'lazy'
---@type LazySpec
return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_theme = 'light'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

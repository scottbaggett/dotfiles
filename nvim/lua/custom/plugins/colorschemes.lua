return {
  {
    'zaldih/themery.nvim',
    config = function()
      require('themery').setup {
        themes = { 'gruvbox', 'ayu', 'ayu-dark', 'catppuccin', 'tokyonight', 'moonfly' }, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      }
    end,
  },
  { 'ellisonleao/gruvbox.nvim' },
  { 'Shatur/neovim-ayu' },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          -- comments = { italic = false }, -- Disable italics in comments
        },
        vim.cmd.colorscheme 'tokyonight',
      }
    end,
  },
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'moonfly'
      vim.g.moonflyCursorColor = true
      vim.g.moonflyTransparent = true
    end,
  },
  {
    'atelierbram/Base2Tone-nvim',
  },
}

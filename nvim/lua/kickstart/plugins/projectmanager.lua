-- lua/plugins/neovim-project.lua

return {
  'coffebar/neovim-project',
  lazy = false,
  priority = 100,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4' }, -- optional, for Telescope picker
    { 'Shatur/neovim-session-manager' },
    -- { "ibhagwan/fzf-lua" }, -- optional, for fzf-lua picker
    -- { "folke/snacks.nvim" }, -- optional, for snacks.nvim picker
  },
  opts = {
    projects = {
      '~/code/dex',
      '~/dotfiles',
      '~/code/palette/palette-playground/',
      '~/code/palette/palette-kit/',
      '~/code/kindnote-native/',
    },
    picker = {
      type = 'telescope', -- or "fzf-lua", "snacks"
    },
  },
  init = function()
    -- Save global variables in session
    vim.opt.sessionoptions:append 'globals'
  end,
}

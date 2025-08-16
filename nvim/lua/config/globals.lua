 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  en
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local plugins = {
  {"catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {'nvim-telescope/telescope.nvim', tag = '0.1.8',dependencies = { 'nvim-lua/plenary.nvim' }},
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  { "nvim-tree/nvim-tree.lua",version = "*", lazy = false,  dependencies = {  "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup {}
    end,
  },
  {
  'mikew/nvim-drawer',
  opts = {},
  config = function(_, opts)
    local drawer = require('nvim-drawer')
    drawer.setup(opts)

    drawer.create_drawer({
      -- This is needed for nvim-tree.
      nvim_tree_hack = true,

      -- Position on the right size of the screen.
      position = 'right',
      size = 40,

      -- Alternatively, you can have it floating.
      -- size = 40,
      -- position = 'float',
      -- win_config = {
      --   margin = 2,
      --   border = 'rounded',
      --   anchor = 'CE',
      --   width = 40,
      --   height = '80%',
      -- },

      on_vim_enter = function(event)
        --- Open the drawer on startup.
        event.instance.open({
          focus = false,
        })

        --- Example mapping to toggle.
        vim.keymap.set('n', '<leader>e', function()
          event.instance.focus_or_toggle()
        end)
      end,

      --- Ideally, we would just call this here and be done with it, but
      --- mappings in nvim-tree don't seem to apply when re-using a buffer in
      --- a new tab / window.
      on_did_create_buffer = function()
        local nvim_tree_api = require('nvim-tree.api')
        nvim_tree_api.tree.open({ current_window = true })
      end,

      --- This gets the tree to sync when changing tabs.
      on_did_open = function()
        local nvim_tree_api = require('nvim-tree.api')
        nvim_tree_api.tree.reload()

        vim.opt_local.number = false
        vim.opt_local.signcolumn = 'no'
        vim.opt_local.statuscolumn = ''
      end,

      --- Cleans up some things when closing the drawer.
      on_did_close = function()
        local nvim_tree_api = require('nvim-tree.api')
        nvim_tree_api.tree.close()
      end,
    })
  end
}
}

local opts = {}
require("lazy").setup(plugins, opts) 
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local config = require('nvim-treesitter.configs')
config.setup({
  ensure_installed = {'lua', 'typescript', 'markdown', 'javascript', 'markdown_inline'},
  highlight = {enable = true},
  indent = {enable = true},
})



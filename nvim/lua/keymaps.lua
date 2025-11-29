-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>c', ':bd<CR>', { desc = 'Close active buffer' })

-- Save file
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save' })
-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Open recent files with Telescope
vim.keymap.set('n', '<leader>srf', '<cmd>Telescope oldfiles<CR>', { desc = 'Find recent files' })
vim.keymap.set('n', '<leader>o', ':Oil<CR>', { desc = 'Open oil.nvim' })

-- Buffer switching
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bl', '<cmd>Telescope buffers<CR>', { desc = 'View buffers' })

--- Map 'jk' in insert mode to escape to normal mode
--- @see https://neovim.io/doc/user/map.html
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', { desc = 'Reload vimrc' })
vim.keymap.set('n', '<leader>tm', ':terminal<CR>a', { desc = 'Terminal' })

-- Normal mode: move by word
vim.keymap.set('n', '<A-Right>', 'w', { desc = 'Move forward by word' })
vim.keymap.set('n', '<A-Left>', 'b', { desc = 'Move backward by word' })

-- Insert mode: move by word
vim.keymap.set('i', '<A-Right>', '<C-Right>', { desc = 'Move forward by word (insert)' })
vim.keymap.set('i', '<A-Left>', '<C-Left>', { desc = 'Move backward by word (insert)' })

--- Increases or decreases vim.g.neovide_scale_factor by 0.1
--- Increase scale factor
local function increase_scale()
  vim.g.neovide_scale_factor = math.min((vim.g.neovide_scale_factor or 1) + 0.1, 2.0)
  print('Scale: ' .. string.format('%.2f', vim.g.neovide_scale_factor))
end

--- Decrease scale factor
local function decrease_scale()
  vim.g.neovide_scale_factor = math.max((vim.g.neovide_scale_factor or 1) - 0.1, 0.5)
  print('Scale: ' .. string.format('%.2f', vim.g.neovide_scale_factor))
end

vim.keymap.set('n', '<C-=>', increase_scale, { desc = 'Increase Neovide scale' })
vim.keymap.set('n', '<C-->', decrease_scale, { desc = 'Decrease Neovide scale' })

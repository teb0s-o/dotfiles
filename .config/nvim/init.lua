-- Bootstrap lazy.nvim
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
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {"ColinKennedy/hybrid2.nvim", priority = 1000 , config = false, opts = ...},
    {"stevearc/oil.nvim", opts = ...},
    {"nvim-telescope/telescope.nvim", tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
    {"saghen/blink.cmp", version = '0.14.0', opts = ...},

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = {"hybrid2"} },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Set identation dots
vim.cmd("set list")
vim.cmd("set listchars=space:·")

-- Toggle buffers
--vim.keymap.set("n", "<C-Space>", "<CMD>b#<CR>")
vim.keymap.set("n", "<leader>.", "<CMD>bn<CR>")
vim.keymap.set("n", "<leader>,", "<CMD>bp<CR>")

-- Greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_Dp")

-- Set tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set colorscheme after loading lazy.nvim
vim.cmd("colorscheme hybrid2")

-- Start oil and set keybind
require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
require("oil").set_columns({ "permissions", "size", "mtime" })

-- Open oil on a new split
vim.keymap.set("n", "<leader>n", function()
  vim.cmd("split | wincmd j")
  require("oil").open()
end)

-- Set line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Set up telescope and keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require("blink.cmp").setup({
  sources = {
    default = { 'buffer', 'path' },
    min_keyword_length = 8,
  },
})


vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  
--  {
--  "folke/tokyonight.nvim",
--  name = "tokyonight-storm",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    require("tokyonight").setup({})
--    vim.cmd.colorscheme("tokyonight-night")
--  end,
--  },

{
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({})
    vim.cmd.colorscheme("gruvbox")
  end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "css" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({
          "css",
          "javascript",
        })
      end,
  },

  "nvim-mini/mini.indentscope",
  version = false,
  config = function()
    require("mini.indentscope").setup({
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Disable mini.indentscope on dashboard and utility buffers",
        -- You can add other utility filetypes here (e.g., 'help', 'NvimTree', 'lazy', 'Trouble')
        pattern = { "alpha", "dashboard", "neo-tree" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    })
  end,
}

local opts = {}

require("lazy").setup(plugins, opts, {
  rocks = {
    enabled = false,
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set ('n', '<C-p>', builtin.find_files, {})
vim.keymap.set ('n', '<leader>fg', builtin.live_grep, {})

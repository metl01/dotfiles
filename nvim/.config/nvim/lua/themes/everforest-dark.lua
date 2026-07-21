local theme_config = require("config.theme")

return {
  {
    "sainnhe/everforest",
    name = "everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set global variables BEFORE loading the colorscheme
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      
      vim.cmd.colorscheme("everforest")
    end,
  },
}


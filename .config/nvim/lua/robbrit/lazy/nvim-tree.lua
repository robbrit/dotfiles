return {
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}


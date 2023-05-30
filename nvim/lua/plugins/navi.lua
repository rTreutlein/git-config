return {
  --'deifyed/naVi',
  dir = "/home/roman/Code/naVi2",
  dependencies = {
      'rcarriga/nvim-notify',
  },
  opts = {
    debug = true,
  },
  keys = {
    { "<leader>ci", "<cmd>lua require('navi').open()<cr>", mode = "n", desc = "NaVI prompt" },
    { "<leader>ci", "<cmd>lua require('navi').openRange()<cr>", mode = "v", desc = "NaVI prompt with context" },
    { "<leader>ce", "<cmd>lua require('navi').explainRange()<cr>", mode = "v", desc = "NaVI explainRange" },
    { "<leader>cc", "<cmd>lua require('navi').openChat()<cr>", mode = "n", desc = "NaVI Chat" },
    { "<leader>cn", "<cmd>lua require('navi').nextModel()<cr>", mode = "n", desc = "Switch to next model" },
  }
}

return {
  'deifyed/naVi',
  dependencies = {
    {
      "jcdickinson/http.nvim", build = "cargo build --workspace --release",
    },
  },
  keys = {
    { "<leader>c", "<cmd>lua require('navi').open()<cr>", mode = "n", desc = "NaVI prompt" },
    { "<leader>c", "<cmd>lua require('navi').openRange()<cr>", mode = "v", desc = "NaVI prompt with context" },
    { "<leader>e", "<cmd>lua require('navi').explainRange()<cr>", mode = "v", desc = "NaVI explainRange" },
    { "<leader>e", "<cmd>lua require('navi').openChat()<cr>", mode = "n", desc = "NaVI Chat" },
  }
}

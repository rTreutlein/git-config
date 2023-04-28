return {
  'deifyed/naVi',
  dependencies = {
    {
      "jcdickinson/http.nvim", build = "cargo build --workspace --release",
    },
  },
  config = {
    openai_token = "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",
  },
  keys = {
    { "<leader>c", "<cmd>lua require('navi').open()<cr>", mode = "n", desc = "NaVI prompt" },
    { "<leader>c", "<cmd>lua require('navi').openRange()<cr>", mode = "v", desc = "NaVI prompt with context" },
    { "<leader>e", "<cmd>lua require('navi').explainRange()<cr>", mode = "v", desc = "NaVI explainRange" },
    { "<leader>e", "<cmd>lua require('navi').openChat()<cr>", mode = "n", desc = "NaVI Chat" },
  }
}

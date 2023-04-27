vim.keymap.set("n", "<leader>o",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>b",
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set("n", "<leader>f",
  "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })

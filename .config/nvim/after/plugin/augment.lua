vim.keymap.set({ "n", "v" }, "<leader>c", "<cmd>Augment chat<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nc", "<cmd>Augment chat-new<cr>",
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", "<cmd>Augment chat-toggle<cr>", { noremap = true, silent = true })

vim.g.augment_workspace_folders = { '$HOME/git/mosh', '$HOME/git/me' }

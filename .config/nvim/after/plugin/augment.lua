vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>Augment chat<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>an", "<cmd>Augment chat-new<cr>",
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>at", "<cmd>Augment chat-toggle<cr>", { noremap = true, silent = true })

vim.g.augment_workspace_folders = { '$HOME/git/mosh', '$HOME/git/me' }

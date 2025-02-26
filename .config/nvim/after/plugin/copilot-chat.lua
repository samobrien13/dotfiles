-- pass the highlighted text to copilot chat
vim.keymap.set("v", "<leader>c", function()
    local selected_text = vim.fn.getreg('v')
    vim.cmd("CopilotChat " .. vim.fn.shellescape(selected_text, ' '))
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nc", "<cmd>CopilotChatOpen<cr>",
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", "<cmd>CopilotChatToggle<cr>", { noremap = true, silent = true })

require("codecompanion").setup({
    adapters = {
        openai = function()
            return require("codecompanion.adapters").extend("openai", {
                env = {
                    api_key =
                    "cmd:op read op://employee/OpenAI/credential --no-newline"
                },
            })
        end,
    }
})

vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>",
    { noremap = true, silent = true })
vim.keymap.set("v", "<leader>cc", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

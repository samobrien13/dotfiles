return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local b = null_ls.builtins

        null_ls.setup({
            sources = {
                b.formatting.prettier,
            },
        })
    end

}

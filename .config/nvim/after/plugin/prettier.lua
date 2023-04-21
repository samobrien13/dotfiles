local prettier = require("prettier")

prettier.setup({
    bin = "prettier",
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "css",
        "scss",
        "json",
        "graphql",
        "markdown",
        "vue",
        "yaml",
        "html",
        "lua",
    },
})


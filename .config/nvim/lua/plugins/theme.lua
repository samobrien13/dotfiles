function ColorMyPencils()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "ray-x/aurora",
    as = 'aurora',
    config = function()
        vim.cmd.colorscheme("aurora")

        ColorMyPencils()
    end,
}

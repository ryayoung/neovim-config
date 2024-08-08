-- LUALINE -------------------------------------------------------------------------------------

require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            { "filename" },
            {
                function()
                    return vim.fn.getcwd()
                end,
                icon = "",
            },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    }
})

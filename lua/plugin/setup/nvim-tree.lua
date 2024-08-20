-- NVIM-TREE -------------------------------------------------------------------------------------
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#CCCCCC ]])

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 'i', api.tree.change_root_to_node, opts("CD As New Root"))
end

require("nvim-tree").setup({
    on_attach = on_attach,
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
            show = {
                folder = false,
                file = false,
            },
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
    filters = {
        git_ignored = false,
        custom = {".DS_Store", "__pycache__", "node_modules", "*.git", "*.br", "*.gz"},
    }
})

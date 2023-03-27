-- TELESCOPE -------------------------------------------------------------------------------------

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		path_display = { "smart" },
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				-- ["<C-h>"] = "which_key",
				-- ["<C-k>"] = "move_selection_previous", -- move to prev result
				-- ["<C-j>"] = "move_selection_next", -- move to next result
				-- ["<C-q>"] = "send_selected_to_qflist" .. "open_qflist", -- send selected to quickfixlist
				["<C-h>"] = actions.which_key,
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
        file_ignore_patterns = {
            "env/.*",
            "./env/.*",
            "env",
            "__pycache__",
            "__pycache__/.*",
            ".*..xlsx",
            ".*..csv",
            -- ".*..ai",
            -- ".*..parquet.*gzip..*",
        }
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		fzf = {},
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})

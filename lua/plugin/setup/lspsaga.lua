local settings = {
	request_timeout = 2000,
	-- show_line_diagnostic = false,
	-- show_buf_diagnostics = false,
	-- show_cursor_diagnostics = false,
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	finder = {
		edit = { "o", "<CR>" },
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = { "q", "<ESC>" },
	},
	definition = {
		edit = "<C-c>o",
		vsplit = "<C-c>v",
		split = "<C-c>i",
		tabe = "<C-c>t",
		quit = "q",
		close = "<Esc>",
	},
	code_action = {
		num_shortcut = true,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	diagnostic = {
		twice_into = false,
		show_code_action = true,
		show_source = true,
		keys = {
			exec_action = "o",
			quit = "q",
			go_action = "g",
		},
	},
	rename = {
		quit = "<C-c>",
		exec = "<CR>",
		in_select = true,
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		show_detail = false,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			-- jump = "o",
            jump = "<CR>",
			expand_collapse = "u",
			quit = "q",
		},
	},
	callhierarchy = {
		show_detail = false,
		keys = {
			edit = "e",
			vsplit = "s",
			split = "i",
			tabe = "t",
			jump = "o",
			quit = "q",
			expand_collapse = "u",
		},
	},
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		hide_keyword = true,
		show_file = true,
		folder_level = 3,
	},
	ui = {
		-- currently only round theme
		theme = "round",
		-- border type can be single,double,rounded,solid,shadow.
		-- border = "solid",
		border = "solid",
		winblend = 0,
        collapse = "",
        expand = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal bakcground color
			normal_bg = "#1f2335",
			--title background color
			title_bg = "#afd700",
			red = "#f7768e",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		kind = {},
	},
}

require("lspsaga").setup(settings)

-- require("lspsaga").init_lsp_saga({
-- keybinds for navigation in lspsaga window
-- move_in_saga = { prev = "<C-k>", next = "<C-j>" },
-- use enter to open file with finder
-- finder_action_keys = {
-- open = "<CR>",
-- },
-- use enter to open file with definition preview
-- definition_action_keys = {
-- edit = "<CR>",
-- },
-- })

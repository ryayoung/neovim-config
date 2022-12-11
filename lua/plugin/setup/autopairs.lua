-- AUTOPAIRS -------------------------------------------------------------------------------------
local autopairs = require("nvim-autopairs")

-- configure autopairs
autopairs.setup({
	check_ts = true, -- enable treesitter
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter nodes
		javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
		java = false, -- don't check treesitter on java
	},
})

-- import nvim-autopairs completion functionality safely
cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- make autopairs and completion work together
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.g.mapleader = " "

local function n(keys, exec, options)
	return vim.keymap.set("n", keys, exec, options)
end
local function i(keys, exec, options)
	return vim.keymap.set("i", keys, exec, options)
end
local function v(keys, exec, options)
	return vim.keymap.set("v", keys, exec, options)
end
local function nlr(keys, exec, options)
	return n("<leader>" .. keys, exec, options)
end
local function vlr(keys, exec, options)
	return v("<leader>" .. keys, exec, options)
end

-- vim surround
n("ysw", "ysiw")
vim.api.nvim_set_keymap("n", "ysw", "ysiw", { noremap = false })

-- Save, quit, source
-- nlr("s", ":w<CR>")
nlr("s", ":call TryWrite()<CR>", { silent = true })
nlr("q", ":call SmartQuit()<CR>", { silent = true })
nlr("Q", ":wqa")
nlr("2", ":w<bar> :source %<CR>")
nlr("3", ":e /Users/Ryan.Young3/Desktop/test.py<CR>")

n("<C-M>", "@q")
n("zm", "za")

-- Stay in visual line after indenting selection
v("<", "<gv")
v(">", ">gv")

-- Open terminal
nlr("//", ":terminal<CR>")

-- Keep cursor inplace when appending row beneath to current
n("J", "mzJ`z")

-- Bring next element after comma down vertically
nlr("d", "f,wi<CR><Esc>l")

-- Keep search terms in middle
n("n", "nzzzv")
n("N", "Nzzzv")

-- Half page jump - keep cursor in middle (disabled because of neoscroll)
-- n("<C-d>", "<C-d>zz")
-- n("<C-u>", "<C-u>zz")

-- Yank/paste with system clipboard
v("y", '"+y')
nlr("y", '"+y')
nlr("p", '"+p')

-- Move tabs
nlr("t", ":tabnew<CR>")
n(">", ":tabn<CR>")
n("<", ":tabp<CR>")

-- Shift visual lines up and down
v("J", ":m '>+1<CR>gv=gv")
v("K", ":m '<-2<CR>gv=gv")

-- Clear search
nlr("l", ":nohl<CR>")

-- Previous file
nlr("b", "<c-^>")

-- Window commands
nlr("w", "<c-w>")
nlr("we", "<c-w>=")

nlr("H", ":wincmd H<CR>", { silent = true })
nlr("J", ":wincmd J<CR>", { silent = true })
nlr("K", ":wincmd K<CR>", { silent = true })
nlr("L", ":wincmd L<CR>", { silent = true })

-- Change LOCAL working directory to current file
nlr(".cur", ":lcd %:p:h<CR>")
-- Change GLOBAL working directory to current file
nlr(".cg", ":cd %:p:h<CR>")

------------------------------------------------------------------------------------------------------
-- PLUGIN MAPPINGS -----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- COPILOT
nlr('ch', ":Copilot help<CR>")
nlr('cp', ":Copilot panel<CR>")
nlr('cs', ":Copilot status<CR>")
nlr('cd', ":Copilot disable<CR>")
nlr('ce', ":Copilot enable<CR>")

vim.api.nvim_set_keymap('i', '<C-Space><Space>', '<Plug>(copilot-next)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('i', '<C-Space>s', '<Plug>(copilot-suggest)', {noremap = false, silent = true})


-- VIM-RUN-PYTHON
nlr("r", ":call ExecutePythonNewBuffer()<CR>")
nlr("R", "5<C-w>j:q<CR><C-w><C-p>", { silent = true })

-- vim-maximizer
nlr("m", ":MaximizerToggle<CR>")

-- Commenter (we need recursive version of mapping)
vim.api.nvim_set_keymap("n", "T", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "T", "gcgv", { noremap = false })

-- File explorer
nlr("e", ":NvimTreeToggle<CR>", { silent = true })

-- telescope
local blt = require("telescope.builtin")
nlr("fn", blt.find_files, {}) -- Lists files in your current working directory, respects .gitignore
nlr("fo", blt.oldfiles, {}) -- Lists previously open files
nlr("fs", blt.live_grep, {}) -- Search for a string in your current working directory and get results live as you type, respects .gitignore
nlr("fc", blt.grep_string, {}) -- Searches for the string under your cursor in your current working directory
nlr("fb", blt.buffers, {}) -- Lists open buffers in current neovim instance
nlr("fk", blt.keymaps, {}) -- Lists normal mode keymappings
nlr("/", blt.current_buffer_fuzzy_find, {}) -- Live fuzzy search inside of the currently open buffer

nlr("gc", blt.git_commits) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
nlr("gfc", blt.git_bcommits) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
nlr("gb", blt.git_branches) -- list git branches (use <cr> to checkout) ["gb" for git branch]
nlr("gs", blt.git_status) -- list current changes per file with diff preview ["gs" for git status]

-- LSP
nlr("gh", ":lua ToggleShowDiag()<CR>")

ShowDiagnostics = true

function ToggleShowDiag()
	if ShowDiagnostics then
		ShowDiagnostics = false
		vim.diagnostic.disable(0)
	else
		ShowDiagnostics = true
		vim.diagnostic.enable(0)
	end
	-- vim.diagnostic.config({ virtual_text = ShowDiagnostics })
end

nlr("z", ":lua FormatWithNullLS()<CR>")

function FormatWithNullLS()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-- code leader key
local function ncode(keys, exec, options)
	return n("<CR>" .. keys, exec, options)
end
local function icode(keys, exec, options)
	return i("<C-m>" .. keys, exec, options)
end

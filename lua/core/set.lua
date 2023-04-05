local opt = vim.opt -- for conciseness

-- MUST HAVE
opt.termguicolors = true
opt.number = true
opt.relativenumber = true

-- line numbers
-- vim.cmd([[hi CursorLineNr cterm=bold]])
-- vim.cmd([[highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE]])
opt.cursorline = true
-- opt.cursorlineopt = "number"
-- vim.cmd([[
--     autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold
-- ]])


opt.foldmethod='marker'
opt.foldlevel=0


-- opt.lazyredraw = true
-- opt.regexpengine=1

-- tabs & indentation
-- vim.cmd('filetype indent off')
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.cindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- all seaches are case INsensitive
opt.smartcase = true -- when this and ignorecase are enabled, search is case sensitive unless you use uppercase letters

-- appearance
-- opt.background = "dark"
opt.signcolumn = "yes" -- Added column on the left

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- opt.iskeyword:append("-") -- 'cw' will delete dash separated word

opt.hlsearch = true -- highlight search
opt.incsearch = true

opt.scrolloff = 8 -- start scrolling when you're x lines from top
-- opt.hidden = false -- prevent unsaved buffers from being hidden

-- set nowrap "disables wrapping. I enable it again for markdown and txt files in /ftplugin
-- set nohlsearch "removes highlighting after search
-- set hidden "allows buffers to remain open in background without saving, so if multiple unsaved files are open, you can quit one without saving, and vim won't make you save it until you close the program.
-- set scrolloff=4 "scroll starts when you're x lines from top or bottom of page
-- set ignorecase "All searches are case INsensitive
-- set smartcase "when this and ignorecase are turned on, search is case sensitive unless uppercase is used in search
-- set nobackup "Disables backup files. Vim makes backups of SAVED files. This is different from swap files, which store UNSAVED changes
-- set undodir=~/vimfiles/undodir "Defines the directory in which Vim stores your undo file
-- set undofile "Tells vim to create an undo file. In this case, it gets stored in the dir. defined above
-- set incsearch "When searching with "/", results will be highlighted AS you're searching, rather than waiting till you press enter
-- set encoding=utf-8 "vim defaults to latin1, but will change based on locale of your environment.

-- NUMBER TOGGLE: sitiom/nvim-numbertoggle
-- local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
-- 	pattern = "*",
-- 	group = augroup,
-- 	callback = function()
-- 		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
-- 			vim.opt.relativenumber = true
-- 		end
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
-- 	pattern = "*",
-- 	group = augroup,
-- 	callback = function()
-- 		if vim.o.nu then
-- 			vim.opt.relativenumber = false
-- 			vim.cmd("redraw")
-- 		end
-- 	end,
-- })

-- END NUMBER TOGGLE

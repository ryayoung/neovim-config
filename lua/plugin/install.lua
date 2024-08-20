-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost install.lua source <afile> | PackerSync
    augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")
    use({
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require('plugin.setup.copilot')
        end,
    })

    use("jeetsukumaran/vim-pythonsense")  -- Text objects for python classes, functions, etc.
    -- use("norcalli/nvim-colorizer.lua")  -- Colorize color codes in files
    use("karb94/neoscroll.nvim") -- good scrolling function
    use({"ColinKennedy/toggle-lsp-diagnostics.nvim", branch="feature/disable_per_buffer"})
    -- use('ThePrimeagen/harpoon')

    use("Vimjas/vim-python-pep8-indent") -- python indentation
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
    -- use("tweekmonster/startuptime.vim") -- check startup time logs

	-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use("folke/tokyonight.nvim")
	use({"lukas-reineke/indent-blankline.nvim", main = "ibl"}) -- show indentation

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	-- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
    --

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	-- commenting with gc
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	-- use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	-- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	-- use("L3MON4D3/LuaSnip") -- snippet engine
	-- use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	-- use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for lsp to appear in autocompletion
    use("nvimdev/lspsaga.nvim") -- enhanced lsp uis
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		-- run = function()
		-- 	local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		-- 	ts_update()
		-- end,
        run = ":TSUpdate",
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        }
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	-- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	-- use({
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("gitsigns").setup()
	-- 	end,
	-- }) -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)



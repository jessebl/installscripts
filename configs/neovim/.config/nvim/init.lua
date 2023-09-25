local key_opts = { replace_keycodes = false, expr = true }
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "tpope/vim-commentary" },
	{ "tpope/vim-fugitive" },
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
		lazy = false,
		init = function()
			vim.g.coc_global_extensions = {
				"coc-json",
				"coc-html-css-support",
				"coc-html",
				"coc-vimlsp",
				"coc-diagnostic",
				"coc-docker",
				"coc-sql",
				"coc-sh",
				"coc-pyright",
				"coc-powershell",
				"coc-phpactor",
				"coc-php-cs-fixer",
				"coc-omnisharp",
				"coc-markdownlint",
				"coc-go",
				"coc-fish",
				"@yaegassy/coc-ansible",
				"coc-snippets",
				"coc-yank",
				"coc-yaml",
				"coc-pairs",
				"coc-lua",
			}
		end,
		keys = {
			{ "<C-l>",      "<Plug>(coc-snippets-expand)" },
			{ "<C-j>",      "<Plug>(coc-snippets-select)" },
			{ "gd",         "<Plug>(coc-type-definition)" },
			{ "gi",         "<Plug>(coc-implementation)" },
			{ "gy",         "<Plug>(coc-type-definition)" },
			{ "gr",         "<Plug>(coc-references)" },
			{ "<leader>rn", "<Plug>(coc-rename)" },
			{
				"<leader><leader>",
				"coc#refresh()",
				mode = "i",
				replace_keycodes = false,
				expr = true
			},
			{
				"<CR>",
				[[coc#pum#visible() ? coc#pum#confirm() : '<CR>']],
				mode = "i",
				replace_keycodes = false,
				expr = true
			},
			{
				"<tab>",
				[[coc#pum#visible() ? coc#pum#next(1) : "<tab>"]],
				mode = "i",
				replace_keycodes = false,
				expr = true
			},
			{
				"<S-tab>",
				[[coc#pum#visible() ? coc#pum#prev(1) : "<S-tab>"]],
				mode = "i",
				replace_keycodes = false,
				expr = true
			},
		},
	},
	{ "folke/neodev.nvim",                           lazy = false, },
	{ "nvim-treesitter/nvim-treesitter",             build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", },
	{ "nvim-treesitter/nvim-treesitter-context", },
	{ "folke/twilight.nvim" },
	{
		"nvim-orgmode/orgmode",
		dependencies = { { "nvim-treesitter/nvim-treesitter", lazy = true }, },
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true, additional_vim_regex_highlighting = { "org" }, },
				ensure_installed = { "org" },
			})

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file =
				"~/orgfiles/refile.org",
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "mfussenegger/nvim-dap-python" }
		}
	},
	{ "lewis6991/gitsigns.nvim" }
}
)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
require("dapui").setup()

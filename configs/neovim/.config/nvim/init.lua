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
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.gruvbox_material_background = 'hard'
			vim.g.gruvbox_material_foreground = "material"
			vim.cmd([[colorscheme gruvbox-material]])
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
				"coc-sumneko-lua",
				"coc-rust-analyzer",
				"coc-ltex",
			}
		end,
		config = function()
			vim.api.nvim_create_user_command("Format", "call CocActionAsync('format')", { nargs = 0 })
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

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				auto_install = true,
			}
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-textobjects", },

	{ "nvim-treesitter/nvim-treesitter-context", },

	{
		"folke/twilight.nvim",
		opts = {}
	},

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
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = { "theHamsta/nvim-dap-virtual-text" },
		keys = {
			{ "<leader>dc",  function() require("dap").continue() end,          desc = "Debugging - begin/continue" },
			{
				"<leader>dl",
				function() require("dap").run_last() end,
				desc =
				"Debugging - run last configura,tion"
			},
			{ "<leader>db",  function() require("dap").toggle_breakpoint() end, desc = "Debugging - toggle breakpoint" },
			{ "<leader>dd",  function() require("dap").toggle_breakpoint() end, desc = "Debugging - toggle breakpoint" },
			{ "<leader>dov", function() require("dap").step_over() end,         desc = "Debugging - step over" },
			{ "<leader>di",  function() require("dap").step_into() end,         desc = "Debugging - step into" },
			{ "<leader>dou", function() require("dap").step_out() end,          desc = "Debugging - step out" },
			{ "<leader>dr",  function() require("dap").repl_open() end,         desc = "Debugging - open repl" },
		},
	},

	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		config = function()
			require("dap-python").setup("python")
		end,
		ft = "python",
	},

	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "mfussenegger/nvim-dap-python" },
		},
		config = function()
			require("dapui").setup()
		end,
		keys = {
			{ "<leader>du", function() require("dapui").toggle() end, desc = "Debugging - open UI" },
		},
	},

	{ "lewis6991/gitsigns.nvim" },

	{
		"sheerun/vim-polyglot",
		-- lazy = true,
		-- event = "VeryLazy",
		init = function()
			vim.g.polyglot_disabled = {
				"sensible" }
		end
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function() require("which-key").register() end
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function() require("nvim-dap-virtual-text").setup() end,
	},

	{ "RRethy/vim-illuminate" },

})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true

vim.keymap.set("n", "<leader>`", "<cmd>b#<cr>", { desc = "Last-used buffer" })
vim.keymap.set("n", "<leader>bu", "<cmd>Buffers<cr>", { desc = "Show open buffers in fzf" })
vim.keymap.set("n", "<leader>f", "<cmd>Files<cr>", { desc = "Show files in fzf" })
vim.keymap.set("n", "<leader>m", "<cmd>make<cr>", { desc = "Run makefile" })

local function get_gtk_theme()
	local fh = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
	if fh ~= nil then
		local data = fh:read "*a"
		fh:close()
		return data
	end
	return ""
end
function Set_background()
	if string.find(get_gtk_theme(), "dark") then
		vim.cmd [[set background=dark]]
	else
		vim.cmd [[set background=light]]
	end
end

vim.keymap.set("n", "<leader>t", function() Set_background() end, { desc = "Update background from gtk theme" })
Set_background()

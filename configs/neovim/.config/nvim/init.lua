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

	{ "junegunn/fzf",        build = ":call fzf#install()" },

	{
		"junegunn/fzf.vim",
		lazy = false,
		keys = {
			{ "<leader>b", "<cmd>Buffers<cr>", desc = "Show open buffers in fzf" },
			{ "<leader>f", "<cmd>Files<cr>",   desc = "Show files in fzf" },
		},
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "medium"
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
			-- Workaround when using rmagatti/auto-session
			-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "NvimTree*",
				callback = function()
					local api = require("nvim-tree.api")
					local view = require("nvim-tree.view")

					if not view.is_visible() then
						api.tree.open()
					end
				end,
			})
		end,
		keys = {
			{ "<leader>t", "<cmd>NvimTreeToggle<cr>", },
		},
	},

	{ "nvim-treesitter/nvim-treesitter-textobjects", },

	{ "nvim-treesitter/nvim-treesitter-context", },

	{
		"folke/twilight.nvim",
		opts = {}
	},

	{
		"nvim-orgmode/orgmode",
		lazy = true,
		dependencies = { { "nvim-treesitter/nvim-treesitter", lazy = true }, },
		ft = { "org" },
		config = function()
			require("orgmode").setup_ts_grammar()
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
			{
				"<leader>dc",
				function() require("dap").continue() end,
				desc =
				"Debugging - begin/continue"
			},
			{
				"<leader>dl",
				function() require("dap").run_last() end,
				desc =
				"Debugging - run last configuration"
			},
			{
				"<leader>dt",
				function() require("dap").terminate() end,
				desc =
				"Debugging - terminate debugging session"
			},
			{
				"<leader>dbs",
				function() require("dap").toggle_breakpoint() end,
				desc =
				"Debugging - toggle breakpoint"
			},
			{
				"<leader>dd",
				function() require("dap").toggle_breakpoint() end,
				desc =
				"Debugging - toggle breakpoint"
			},
			{
				"<leader>dbc",
				function()
					require("dap").set_breakpoint(
						vim.fn.input("Breakpoint condition: "),
						vim.fn.input("Breakpoint count: "),
						vim.fn.input("Breakpoint log message: "))
				end,
				desc = "Debugging - set conditional breakpoint"
			},
			{
				"<leader>dbr",
				function() require("dap").clear_breakpoints() end,
				desc =
				"Debugging - remove all breakpoints"
			},
			{ "<leader>dov", function() require("dap").step_over() end, desc = "Debugging - step over" },
			{ "<leader>di",  function() require("dap").step_into() end, desc = "Debugging - step into" },
			{ "<leader>dou", function() require("dap").step_out() end,  desc = "Debugging - step out" },
			{ "<leader>dr",  function() require("dap").repl_open() end, desc = "Debugging - open repl" },
		},
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
		end
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

	{ "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end, },

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
		lazy = true,
		config = function() require("nvim-dap-virtual-text").setup() end,
	},

	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {
					"gitcommit",
					"help",
					"text",
					"org",
					"",
				}
			})
		end,
	},

	-- 	{
	-- 		"mikesmithgh/kitty-scrollback.nvim",
	-- 		enabled = true,
	-- 		lazy = true,
	-- 		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	-- 		version = 'tryclose', -- latest stable version, may have breaking changes if major version changed
	-- 		config = function()
	-- 			require("kitty-scrollback").setup()
	-- 		end,
	-- 	}

	{
		"williamboman/mason.nvim",
		config = function() require("mason").setup() end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim", },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"codelldb",
				}
			})
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command =
					"/home/jesse/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				}
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
							"file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.rust = dap.configurations.cpp
		end,
	},

	{
		"drybalka/tree-climber.nvim",
		keys = {
			{
				"<C-h>",
				function() require("tree-climber").goto_parent() end,
				mode = { "n", "v", "o" },
				desc =
				"Treesitter - go to parent node"
			},
			{
				"<C-l>",
				function() require("tree-climber").goto_child() end,
				mode = { "n", "v", "o" },
				desc =
				"Treesitter - go to child node"
			},
			{
				"<C-j>",
				function() require("tree-climber").goto_next() end,
				mode = { "n", "v", "o" },
				desc =
				"Treesitter - go to next node"
			},
			{
				"<C-k>",
				function() require("tree-climber").goto_prev() end,
				mode = { "n", "v", "o" },
				desc =
				"Treesitter - go to previous node"
			},
			{
				"in",
				function() require("tree-climber").select_node() end,
				mode = { "v", "o" },
				desc =
				"Treesitter - select current node"
			},
			{ "<c-k>", function() require("tree-climber").swap_prev() end,      desc = "Treesitter - swap previous node" },
			{ "<c-j>", function() require("tree-climber").swap_next() end,      desc = "Treesitter - swap next node" },
			{ "<c-h>", function() require("tree-climber").highlight_node() end, desc = "Treesitter - highlight node" },
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
		end,
	},

	{
		"nvim-tree/nvim-web-devicons"
	},

	{ "kevinhwang91/nvim-bqf",   ft = "qf" },

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			}
		end
	}

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
	if string.find(get_gtk_theme(), "light") then
		vim.cmd [[set background=light]]
	else
		vim.cmd [[set background=dark]]
	end
end

vim.api.nvim_create_user_command("UpdateBackground", function() Set_background() end, { nargs = 0 })
Set_background()

if vim.fn.executable("rg") == 1 then
	-- https://stackoverflow.com/a/55305200
	vim.o.grepprg = "rg --vimgrep"
	vim.o.grepformat = "%f:%l:%c:%m"
end

vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<cr>")

-- https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
vim.cmd [[
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
]]

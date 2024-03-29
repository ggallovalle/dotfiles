local remaps = require("kbroom-config.remaps")
-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

vim.api.nvim_exec(
	[[
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
]],
	false
)

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
	use("ludovicchabant/vim-gutentags") -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

		use("joshdick/onedark.vim")
	--use({
	--	"joshdick/onedark.vim",
	--	config = function()
	--		--Set colorscheme (order is important here)
	--		vim.g.onedark_terminal_italics = 2
	--		vim.cmd([[colorscheme onedark]])
	--	end,
	--}) -- Theme inspired by Atom
	use("itchyny/lightline.vim") -- Fancier statusline
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("alaviss/nim.nvim") -- nim
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use({
		"kristijanhusak/orgmode.nvim",
		config = function()
			require("orgmode").setup()
		end,
	})
	use("udalov/kotlin-vim") -- kotlin
	use("ray-x/lsp_signature.nvim") -- lsp show signature
	use("dart-lang/dart-vim-plugin") -- dart
	use("vim-crystal/vim-crystal") -- crystal
	use("khaveesh/vim-fish-syntax") -- fish
	use("fladson/vim-kitty") -- kitty syntax highligh
	use("cespare/vim-toml") -- toml
        use("easymotion/vim-easymotion")
        use("tpope/vim-surround")
        use("tpope/vim-commentary")
        use("vim-scripts/ReplaceWithRegister")
        use("godlygeek/tabular")
        use("plasticboy/vim-markdown")
	use("vim-scripts/aspnet.vim")
end)

--Set colorscheme (order is important here)
vim.g.onedark_terminal_italics = 2
vim.cmd([[colorscheme onedark]])

--Set statusbar
vim.g.lightline = {
	colorscheme = "onedark",
	active = {
		left = {
			{ "mode", "paste" },
			{ "gitbranch", "readonly", "filename", "modified" },
		},
	},
	component_function = { gitbranch = "fugitive#head" },
}

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { hl = "GitGutterAdd", text = "+" },
		change = { hl = "GitGutterChange", text = "~" },
		delete = { hl = "GitGutterDelete", text = "_" },
		topdelete = { hl = "GitGutterDelete", text = "‾" },
		changedelete = { hl = "GitGutterChange", text = "~" },
	},
})

-- Telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})
--Add leader shortcuts
vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sf",
	[[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sb",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sh",
	[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>st",
	[[<cmd>lua require('telescope.builtin').tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sp",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>so",
	[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>?",
	[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
	{ noremap = true, silent = true }
)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})

-- LSP settings
local nvim_lsp = require("lspconfig")
local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	remaps.buf_n_map(bufnr, {
		{ "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
		{ "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
		{ "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
		{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
		{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
		{ "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
		{ "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
		{
			"<leader>wl",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		},
		{ "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
		{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
		{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
		{
			"<leader>e",
			"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		},
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>" },
		{ "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
		{ "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
		{ "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" },
		{
			"<leader>so",
			[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
		},
	})
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

---Different tab size for each language.
---@param tabstop number
---@return function
local function on_attach_with_tabspace(tabstop)
	return function(client, bufnr)
		require("lsp_signature").on_attach()
		buffer({
			-- use tabs instead of spaces with a default value of 2
			tabstop = tabstop,
			shiftwidth = tabstop,
		})
		on_attach(client, bufnr)
	end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable the following language servers
local servers = {
	"clangd",
	"rust_analyzer",
	"pyright",
	"tsserver",
	"nimls",
	"gopls",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- dartk
require("lspconfig").dartls.setup({
	cmd = {
		"dart",
		"/home/kbroom/.local/share/asdf/installs/dart/2.13.4/dart-sdk/bin/snapshots/analysis_server.dart.snapshot",
		"--lsp",
	},
	on_attach = on_attach_with_tabspace(2),
	capabilities = capabilities,
})

-- kotlin
require("lspconfig").kotlin_language_server.setup({
	on_attach = on_attach_with_tabspace(4),
	capabilities = capabilities,
})

-- omnisharp
require("lspconfig").omnisharp.setup({
	cmd = {
		"/usr/bin/omnisharp",
		"--languageserver",
		"--hostPID",
		tostring(vim.fn.getpid()),
	},
	on_attach = on_attach_with_tabspace(4),
	capabilities = capabilities,
})

-- Example custom server
local sumneko_root_path = vim.fn.getenv("HOME") .. "/.local/bin/sumneko_lua" -- Change to your sumneko root installation
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = on_attach_with_tabspace(2),
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

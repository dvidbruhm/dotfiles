-----------------------------------------------
-- basic options
-----------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.hlsearch = true
vim.opt.undofile = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.scrolloff = 5

-----------------------------------------------
-- plugins
-----------------------------------------------

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                version = vim.version.range('*') },
})

-----------------------------------------------
-- plugin setups
-----------------------------------------------

require("mason").setup()
require("mini.extra").setup()
require("mini.pick").setup()
require("mini.bufremove").setup()
require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.jump2d").setup()
require("mini.pick").setup()
require("mini.git").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.starter").setup()
require("mini.notify").setup()
require("mini.comment").setup({
	mappings = {
		comment = 'gc',
		comment_line = 'gcc',
		comment_visual = '<leader>#',
		textobject = 'gc',
	}
})
local miniclue = require("mini.clue")
miniclue.setup({
	window = { config = { width = 50 }, delay = 500 },
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },

		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },

		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },

		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },

		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },

		-- Window commands
		{ mode = 'n', keys = '<C-w>' },

		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

-----------------------------------------------
-- colors
-----------------------------------------------

require("catppuccin").setup()
vim.cmd("colorscheme catppuccin-mocha")

-----------------------------------------------
-- lsp setup
-----------------------------------------------


require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
	completion = {
		documentation = { auto_show = true },
		list = { selection = { preselect = true, auto_insert = true } }
	},
	signature = { enabled = true }
})



vim.cmd [[set completeopt+=menuone,noselect,popup]]

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config("lua_ls", { capabilities = capabilities })
vim.lsp.config("pyrefly", { capabilities = capabilities })
vim.lsp.config("ruff", { capabilities = capabilities })

vim.lsp.enable(
	{
		"lua_ls",
		"ruff",
		-- "pyright",
		"pyrefly"
	}
)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(args)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format {
					async = false,
					id = args.data.client_id,
					filter = function(client) return client.name ~= "pyrefly" end }
			end,
		})
	end
})

-----------------------------------------------
-- mappings
-----------------------------------------------
local map = vim.keymap.set

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--map({ "n", "x", "v" }, "s", "<Nop>")  -- unset s

map("n", "vv", "<C-v>", { desc = "Enter visual block" }) -- remap block visual

map("n", "<S-right>", ":bnext<CR>")                      -- move and delete buffers
map("n", "<S-left>", ":bprevious<CR>")
map('n', '<leader>w', require("mini.bufremove").delete, { desc = "Delete current buffer" })

map("n", "<A-S-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" }) -- move lines
map("n", "<A-S-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<A-S-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-S-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<A-S-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-S-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

map("v", "<tab>", ">gv") -- better visual indenting
map("v", "<S-tab>", "<gv")

map("n", "<S-up>", "<C-u>zz") -- better up/down
map("n", "<S-down>", "<C-d>zz")

map("i", "<C-BS>", "<C-w>") -- delete a word (might have to configure terminal for this to work)

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

map("n", "<leader>f", "<cmd>Pick files<cr>", { desc = "Find file" })
map("n", "<leader>o", "<cmd>Pick oldfiles<cr>", { desc = "Find recent file" })
map("n", "<leader>g", "<cmd>Pick grep<cr>", { desc = "Grep in files" })
map("n", "<leader>b", "<cmd>Pick buffers<cr>", { desc = "Find buffer" })
map("n", "<leader>e", "<cmd>Pick explorer<cr>", { desc = "Explore files" })
map("n", "<leader>e", "<cmd>Pick explorer<cr>", { desc = "Explore files" })
map("n", "<leader>d", "<cmd>Pick diagnostic<cr>", { desc = "Find diagnostic" })

map("n", "<leader>d",
	function()
		if vim.diagnostic.config().virtual_lines then
			vim.diagnostic.config({ virtual_lines = false })
		else
			vim.diagnostic.config({ virtual_lines = { current_line = true } })
		end
	end, { desc = "Toggle show diagnostic on current line" })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})









-- map('n', '<leader>w', '<Cmd>write<CR>')
-- map('n', '<leader>q', require("mini.bufremove").delete)
-- map('n', '<leader>Q', '<Cmd>:wqa<CR>')
-- map('n', '<C-f>', '<Cmd>Open .<CR>')
--
-- -- open RC files.
-- map('n', '<leader>v', '<Cmd>e $MYVIMRC<CR>')
-- map('n', '<leader>z', '<Cmd>e ~/.config/zsh/.zshrc<CR>')
--
-- -- quickly switch files with alternate / switch it
-- map('n', '<leader>s', '<Cmd>e #<CR>')
-- map('n', '<leader>S', '<Cmd>bot sf #<CR>')
-- map({ 'n', 'v', 'x' }, '<leader>m', ':move ')
--
-- -- I use norm so much this makes sense
-- map({ 'n', 'v' }, '<leader>n', ':norm ')
--
-- -- system clipboard
-- map({ 'n', 'v' }, '<leader>y', '"+y')
-- map({ 'n', 'v' }, '<leader>d', '"+d')
-- map({ 'n', 'v' }, '<leader>c', ':')
--
-- -- soft reload config file
-- map({ 'n', 'v' }, '<leader>o', ':update<CR> :source<CR>')
--
-- map('t', '', "")
-- map('t', '', "")
--
-- map('n', '<leader>lf', vim.lsp.buf.format)
-- map("i", "<C-e>", function() ls.expand_or_jump(1) end, { silent = true })
-- map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
-- map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
-- map('n', '<leader>f', "<Cmd>Pick files<CR>")
-- map('n', '<leader>r', "<Cmd>Pick buffers<CR>")
-- map('n', '<leader>h', "<Cmd>Pick help<CR>")
-- map('n', '<leader>e', "<Cmd>Oil<CR>")
-- map('i', '<c-e>', function() vim.lsp.completion.get() end)
--
-- map("n", "<M-n>", "<cmd>resize +2<CR>")          -- Increase height
-- map("n", "<M-e>", "<cmd>resize -2<CR>")          -- Decrease height
-- map("n", "<M-i>", "<cmd>vertical resize +5<CR>") -- Increase width
-- map("n", "<M-m>", "<cmd>vertical resize -5<CR>") -- Decrease width
-- map("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

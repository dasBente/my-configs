local iron = require("iron.core")

iron.setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = { command = { "zsh" } },
			python = { command = { "python" } },--require("iron.fts.ipython").ipython,
			javascript = { command = { "node" } },
		},
		repl_open_cmd = require("iron.view").bottom(40),
	},

	highlight = {
		italic = true
	},

	ignore_blank_lines = true,
})

-- TODO: only show when repl supported?

vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>",
	{ desc = "Start Repl" })

vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>",
	{ desc = "Restart Repl" })

vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>",
	{ desc = "Focus Repl" })

vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>",
	{ desc = "Hide Repl" })

vim.keymap.set("n", "<leader>sc", iron.send_motion,
	{ desc = "Send Motion" })

vim.keymap.set("v", "<leader>sc", iron.visual_send,
	{ desc = "Send Selection" })

vim.keymap.set("n", "<leader>sf", iron.send_file,
	{ desc = "Send File" })

vim.keymap.set("n", "<leader>sl", iron.send_line,
	{ desc = "Send Line" })

vim.keymap.set("n", "<leader>su", iron.send_until_cursor,
	{ desc = "Send Until Cursor" })

-- TODO: Fix these

--vim.keymap.set("n", "<leader>sm", iron.send_mark,
--	{ desc = "Send Mark" })

--vim.keymap.set("n", "<leader>mc", iron.mark_motion,
--	{ desc = "Mark Motion" })

--vim.keymap.set("v", "<leader>mc", iron.mark_visual,
--	{ desc = "Mark Selection" })

--vim.keymap.set("n", "<leader>md", iron.remove_mark,
--	{ desc = "Remove Mark" })

--vim.keymap.set("n", "<leader>s<cr>", iron.cr,
--	{ desc = "CR" })

--vim.keymap.set("n", "<leader>s<space>", iron.interrupt,
--	{ desc = "Interrupt" })

--vim.keymap.set("n", "<leader>rq", iron.exit,
--	{ desc = "Exit Repl" })

--vim.keymap.set("n", "<leader>rc", iron.clear,
--	{ desc = "Clear Repl" })

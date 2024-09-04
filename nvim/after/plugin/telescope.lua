-- telescope keybinds
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>fc", function ()
	builtin.diagnostics({ bufnr = 0 })
end, { desc = "Diagnostics (Current)" })

-- LSP bindings
vim.keymap.set("n", "<leader>vv", builtin.lsp_references, { desc = "References" })
vim.keymap.set("n", "<leader>vc", builtin.lsp_document_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>vw", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>vi", builtin.lsp_incoming_calls, { desc = "Incoming Calls" })
vim.keymap.set("n", "<leader>vo", builtin.lsp_outgoing_calls, { desc = "Outgoing Calls" })

-- Git Bindings
vim.keymap.set("n", "<leader>gx", "<cmd>Telescope conflicts<cr>", { desc = "Conflicts" })
vim.keymap.set("n", "<leader>gd", "<cmd>Telescope git_diffs diff_commits<cr>", { desc = "Diff" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Find in Git Files"})

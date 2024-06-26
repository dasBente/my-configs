-- telescope keybinds
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in Buffers" })
vim.keymap.set("n", "<leader>fr", builtin.git_files, { desc = "Find in Git Files"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>gx", "<cmd>Telescope conflicts<cr>", { desc = "Conflicts" })
vim.keymap.set("n", "<leader>gd", "<cmd>Telescope git_diffs diff_commits<cr>", { desc = "Diff" })

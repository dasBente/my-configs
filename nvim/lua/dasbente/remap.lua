vim.g.mapleader = " "

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File Explorer" })

-- undotree
vim.keymap.set("n", "<leader>pu", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })


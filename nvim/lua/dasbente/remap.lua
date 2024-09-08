-- netrw
vim.keymap.set(
	"n", "<leader>pv", vim.cmd.Ex,
	{ desc = "File Explorer" }
)

-- undotree
vim.keymap.set(
	"n", "<leader>pu", vim.cmd.UndotreeToggle,
	{ desc = "Undo Tree" }
)

-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- merge with next line
vim.keymap.set("n", "J", "mzJ`z")

-- keep search centered while jumping up/down page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- unbind
vim.keymap.set("n", "Q", "<nop>")

-- paste without replacing buffer
-- vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste" })

-- swap quickly between tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format)

-- search and replace current word
vim.keymap.set(
	"n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search and Replace" }
)

-- make current file executable
vim.keymap.set(
	"n", "<leader>x", "<cmd>!chmod +x %<CR>",
	{ silent = true, desc = "chmod +x" }
)

-- buffer shortcuts
vim.keymap.set(
	"n", "<C-w>v", ":vnew<CR>",
	{ desc = "New Window (vertical)" }
)

vim.keymap.set(
	"n", "<C-w>e", ":enew<CR>",
	{ desc = "New Window (full)" }
)

-- unbind conventional navigation, force vim motions.
local unbind_keys = {
	"<Up>", "<Left>", "<Right>", "<Down>", "<PageUp>", "<PageDown>"
}

for i = 1, #unbind_keys do
	vim.keymap.set({"n", "x", "v"}, unbind_keys[i], "<Nop>")
end


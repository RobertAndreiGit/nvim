require "nvchad.mappings"

-- add yours here
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find keymaps" })

vim.keymap.set("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file tests" })

vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })

vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open { enter = true }
end, { desc = "Show test output" })

vim.keymap.set("n", "<leader>ta", function()
  require("neotest").playwright.attachment()
end, { desc = "Launch Playwright test attachment" })

vim.g.copilot_no_tab_map = true
vim.keymap.set(
  "i",
  "<C-w>",
  'copilot#Accept("<CR>")',
  { expr = true, replace_keycodes = false, silent = true, desc = "Copilot Accept" }
)

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

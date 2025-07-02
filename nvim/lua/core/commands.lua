-- commands.lua

vim.api.nvim_create_autocmd("InsertEnter", { command = [[set number norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })

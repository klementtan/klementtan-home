local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> OSCYank <--
map("v", "<leader>y", ":OSCYank<CR>", opts)

--> Generic <--
map("n", "<C-h>", "<C-W>h", opts)
map("n", "<C-j>", "<C-W>j", opts)
map("n", "<C-l>", "<C-W>l", opts)
map("n", "<C-k>", "<C-W>k", opts)
map("n", "<leader><CR>", ":nohlsearch<CR>", opts)


--> nvim tree mappings <--
map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts)
--> telescope mappings <--
map("n", "<leader>g", ":Telescope git_files<cr>", opts)
map("n", "<leader>z", ":Telescope find_files<cr>", opts)
map("n", "??", ":Telescope live_grep<cr>", opts)
map("n", "<leader>b", ":Telescope buffers<cr>", opts)
map("n", "<leader>c", ":Telescope commands<cr>", opts)
map("n", "<leader>j", ":Telescope jumplist<cr>", opts)
--> --> telescope mappings for lsp <-- <--
map("n", "gd", ":Telescope lsp_definitions<cr>", opts)
map("n", "gr", ":Telescope lsp_references<cr>", opts)
map("n", "<leader>o", ":Telescope lsp_document_symbols<cr>", opts)

--> clangd lsp <--
vim.cmd([[
    autocmd FileType c,cpp,h nnoremap <silent> <Leader>h :ClangdSwitchSourceHeader<CR>
]])

--> gitsigns <--
map("n", "<leader>gd", ":DiffviewOpen<cr>", opts)
map("n", "<leader>gc", ":DiffviewClose<cr>", opts)
map("n", "<leader>gn", ":Gitsigns next_hunk<cr>", opts)
map("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", opts)
map("n", "<leader>gs", ":Gitsigns preview_hunk<cr>", opts)
map("n", "<leader>gb", ":Gitsigns blame_line<cr>", opts)
map("n", "<leader>ghr", ":Gitsigns reset_hunk<cr>", opts)
map("n", "<leader>ghs", ":Gitsigns stage_hunk<cr>", opts)

map("n", "<leader>rn", ":lua vim.lsp.buf_rename()<CR>", opts)
map("v", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)

vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.C", "*.c", "*.cpp", "*.h", "*.H", "*.inl"},
    group = clangformat,
    callback = function()
        map("v", "<leader>f", ":ClangFormat<CR>", opts)
    end
})

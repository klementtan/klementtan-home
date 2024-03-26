require("mason").setup()
local manson = require("mason-lspconfig").setup({
    ensure_isntalled = {"pyright", "cmake", "bashls"}
})
require("lspconfig").pyright.setup{}
require("lspconfig").cmake.setup{}
require("lspconfig").bashls.setup{}

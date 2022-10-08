local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

--require("user.lsp.lsp-installer")
require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.go-vim")
require("user.lsp.guihua")
require("user.lsp.rust")

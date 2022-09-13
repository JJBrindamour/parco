local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("jj.lsp.lsp-installer")
require("jj.lsp.handlers").setup()

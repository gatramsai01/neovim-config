local status_ok, go_pls_cap = pcall(require, "go.lsp")
if not status_ok then
	return
end

return go_pls_cap.config()

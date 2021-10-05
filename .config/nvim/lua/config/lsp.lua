lspconfig = require'lspconfig'
completion_callback = require'completion'.on_attach

-- c/cpp
lspconfig.ccls.setup {
  init_options = {
	cache = {
	  directory = ".ccls-cache";
	};
  }
}
-- c/cpp

-- cpound
local pid = vim.fn.getpid()
local omnisharp_bin = os.getenv("OMNISHARP_ROSLYN")
lspconfig.omnisharp.setup{
	cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}
-- cpound

-- golang
lspconfig.gopls.setup{}
-- golang

-- python
lspconfig.pyright.setup{}
-- python

-- rust
lspconfig.rust_analyzer.setup{}
-- rust

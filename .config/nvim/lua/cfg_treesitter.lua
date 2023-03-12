require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "rust",
    "go",
    "c_sharp",
    "python",
    "toml",
    "bash",
    "cmake",
    "json",
    "lua",
    "make",
    "yaml"
  },
  highlight = {
    enable = true,
    disable = {},
	additional_vim_regex_highlighting = true
  },
  indent = {
    enable = true,
    disable = {"c", "rust", "go", "python" }
  }
}

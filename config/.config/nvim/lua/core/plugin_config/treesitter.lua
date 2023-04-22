require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "ruby",
    "vim",
    "python",
    "markdown",
    "markdown_inline",
    "javascript",
    "json",
    "yaml",
    "html",
    "css",
    "bash"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'vim',
      'vimdoc',
      'lua',
      'cpp',
      'c',
      'python',
      'bash',
      'markdown',
      'markdown_inline',
      'javascript',
      'json',
      'yaml',
      'html',
      'css',
  },

    auto_install = false,

    highlight = { enable = true },

    indent = { enable = true },
}

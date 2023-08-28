require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "slope",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        padding = 1
      }
    },
  }
})

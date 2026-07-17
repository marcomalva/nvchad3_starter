return {
  cmd = { "harper-ls", "--stdio" },
  filetypes = { "markdown" },
  settings = {
    ["harper-ls"] = {
      markdown = { codeBlocks = false },
    },
  },
}


-- 1. Load NvChad's underlying defaults
require("nvchad.configs.lspconfig").defaults()

-- 2. Bulk enable your standard automatic language servers (Added postgres_lsp)
local servers = { "html", "cssls", "lua_ls", "harper_ls", "marksman", "postgres_lsp" }
vim.lsp.enable(servers)

-- 3. Directly boot Taplo on any .toml file with your custom configurations
vim.api.nvim_create_autocmd("FileType", {
  pattern = "toml",
  callback = function(args)
    vim.lsp.start({
      name = "taplo",
      cmd = { "taplo", "lsp", "stdio" },
      root_dir = vim.fs.root(args.buf, { "*.toml", ".git" }) or vim.fn.getcwd(),
      settings = {
        taplo = { include = { "**/*" } },
        evenBetterToml = { schema = { enabled = true } },
      },
    }, { bufnr = args.buf })
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 

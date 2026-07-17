return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      -- 1. Grab NvChad's default client capabilities & hook handlers
      local nv_lsp_config = require("nvchad.configs.lspconfig")
      local on_attach = nv_lsp_config.on_attach
      local capabilities = nv_lsp_config.capabilities

      -- 2. Define settings natively with the correct sub-command
      vim.lsp.config("postgres_lsp", {
        -- FIXED: Replaced "--stdio" with the proper server execution flag
        cmd = { "postgres-language-server", "lsp-proxy" },
        filetypes = { "sql", "pgsql" },
        capabilities = capabilities,
        root_dir = vim.fs.root(0, { ".git", "postgres-language-server.jsonc" }),
      })

      -- 3. Globally enable the language server
      vim.lsp.enable("postgres_lsp")

      -- 4. Re-bind NvChad's classic UI attach hooks via NeoVim's native pipeline
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "postgres_lsp" then
            on_attach(client, args.buf)
          end
        end,
      })
    end,
  },
}


return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "jsonls",
          "bashls",
          "yamlls",
          "lua_ls",
          "html",
          "clangd",
          "pyright",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    lazy = false,
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig["lua-ls"].setup({
        capabilities = capabilities,
      })
      lspconfig["pyright"].setup({
        capabilities = capabilities,
      })
    end,
  },
}

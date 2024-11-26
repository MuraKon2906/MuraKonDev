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
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "ts_ls",
          "jsonls",
          "bashls",
          "yamlls",
          "ast_grep",
          --"solargraph",
          "tailwindcss",
          "html",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Ensure clangd uses proper offsetEncoding
      capabilities.offsetEncoding = { "utf-16" }

      local lspconfig = require("lspconfig")
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- lspconfig.rust_analyzer.setup({ -- for rust
      --   capabilities = capabilities,
      -- })
      -- Clangd-specific setup
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--offset-encoding=utf-16" }, -- Ensure offset encoding
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
    end,
  },
}

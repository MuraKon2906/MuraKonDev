return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        -- Define keybindings or other LSP specific settings here
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Set up Rust Analyzer
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {},
        },
      })

      -- Set up Pyright (Python)
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace", -- Use "workspace" for broader diagnostics
            },
          },
        },
      })

      -- Set up Ruff (Python linting)
      lspconfig.ruff_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Set up tsserver (JavaScript/TypeScript)
      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })

      -- Set up biome (JavaScript/TypeScript)
      lspconfig.biome.setup({
        on_attach = on_attach,
        capabilities = capabilities,

        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })
    end,
  },
}

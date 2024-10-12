return {
  {

    -- Setup null-ls for isort
    require("null-ls").setup({
      sources = {
        require("null-ls").builtins.formatting.isort,
      },
    }),
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = function(_, opts)
      local servers = { "pyright", "ruff", "tsserver" }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
      end

      -- Additional configuration for Python servers
      opts.servers.pyright = {
        settings = {
          filetypes = { "python" }, -- Limit to Python files
        },
      }
      opts.servers.ruff = {
        settings = {
          filetypes = { "python" }, -- Limit to Python files
        },
      }

      -- Additional configuration for JavaScript/TypeScript
      opts.servers.tsserver = {
        settings = {
          filetypes = { "javascript", "typescript" }, -- Limit to JavaScript and TypeScript files
        },
      }
    end,
  },
}

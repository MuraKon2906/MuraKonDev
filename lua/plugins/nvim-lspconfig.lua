return {
  "neovim/nvim-lspconfig",
  lazy = false,
  opts = function(_, opts)
    local servers = { "pyright", "ruff", "ruff_lsp" }
    for _, server in ipairs(servers) do
      opts.servers[server] = opts.servers[server] or {}
    end
  end,
}

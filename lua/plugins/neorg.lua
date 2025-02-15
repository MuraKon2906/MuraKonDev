return {

  -- Neorg plugin configuration using lazy.nvim
  {
    "nvim-neorg/neorg",
    lazy = false, -- Load Neorg immediately
    version = "*", -- Pin to the latest stable release
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" }, -- Required dependencies

    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behavior
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                rust_notes = "~/MuraKonNotes/Rust/",
                tips = "~/MuraKonNotes/Tips",
                rozeta = "MuraKonNotes/rozeta",
              },
            },
          },
        },
      })

      -- Set folding and conceal levels for Neorg
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },

  -- Treesitter configuration to include Neorg parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "norg", "lua", "python", "html", "rust" }, -- Ensure norg parser is installed
    },
  },
}

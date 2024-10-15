return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "🔍 ", -- Customize prompt prefix
          selection_caret = "➤ ", -- Customize selection caret
          entry_prefix = "  ", -- Customize entry prefix
          initial_mode = "insert", -- Start in insert mode
          sorting_strategy = "ascending", -- Sort results in ascending order
          layout_strategy = "flex", -- Use flex layout for better responsiveness
          layout_config = {
            prompt_position = "top", -- Position the prompt at the top
            width = 0.75, -- Set width of the Telescope window
            height = 0.75, -- Set height of the Telescope window
            horizontal = {
              mirror = false, -- Do not mirror horizontally
            },
            vertical = {
              mirror = false, -- Do not mirror vertically
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            theme = "ivy", -- Use ivy theme for find_files
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- You can customize dropdown options here
              winblend = 10, -- Set transparency for dropdown window
              border = true, -- Enable border around dropdown
              borderchars = { "─", "│", "─", "│", "┌", "┐", "└", "┘" }, -- Customize border characters
            }),
          },
        },
      })

      -- Key mappings for Telescope functions
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}

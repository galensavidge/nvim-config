-- Oil.nvim
-- File browser in a buffer.

return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = {
          "icon",
          -- "permissions",
          "size",
          -- "mtime",
        },
        watch_for_changes = false,
        use_default_keymaps = false,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<A-v>"] = {
            "actions.select",
            opts = { vertical = true },
            desc = "Open the entry in a vertical split"
          },
          ["<A-s>"] = {
            "actions.select",
            opts = { horizontal = true },
            desc = "Open the entry in a horizontal split"
          },
          ["<A-t>"] = {
            "actions.select",
            opts = { tab = true },
            desc = "Open the entry in new tab"
          },
          ["gp"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = {
            "actions.cd",
            opts = { scope = "tab" },
            desc = ":tcd to the current oil directory",
            mode = "n"
          },
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      })
    end,
  },
}

-- Kiwi
-- Minimal personal wiki plugin.

return {
  'serenevoid/kiwi.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    {
      "<leader>ww",
      ":lua require(\"kiwi\").open_wiki_index()<cr>",
      desc = "Open wiki index"
    },
    {
      "<leader>wt",
      ":lua require(\"kiwi\").todo.toggle()<cr>",
      desc = "Toggle markdown task"
    }
  },
  lazy = true,
}

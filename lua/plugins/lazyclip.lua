-- Lazyclip
-- Clipboard history popup window.
return {
  {
    "atiladefreitas/lazyclip",
    lazy = false,
    config = function()
      require("lazyclip").setup()

      -- Required to start tracking clipboard history.
      require("lazyclip").show_clipboard()
    end,
  }
}

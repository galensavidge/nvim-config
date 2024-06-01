-- Outline.nvim
-- Shows a code outline in the side bar.
return {
  {
    'hedyhli/outline.nvim',
    event = 'VeryLazy',
    config = function()
      require('outline').setup({
        outline_window = {
          -- Width in number of columns
          width = 30,
          relative_width = false,

          -- Auto close the outline window if goto_location is triggered and not
          -- for peek_location.
          auto_close = false,
          -- Automatically scroll to the location in code when navigating outline
          -- window.
          auto_jump = false,
          -- boolean or integer for milliseconds duration to apply a temporary
          -- highlight when jumping. false to disable.
          jump_highlight_duration = false,

          -- Enable this only if you enabled cursorline so your cursor color can
          -- blend with the cursorline, in effect, as if your cursor is hidden
          -- in the outline window.
          -- This makes your line of cursor have the same color as if the cursor
          -- wasn't focused on the outline window.
          -- This feature is experimental.
          hide_cursor = true,
        },

        -- These keymaps can be a string or a table for multiple keys.
        -- Set to `{}` to disable. (Using 'nil' will fallback to default keys)
        keymaps = {
          show_help = '?',
          close = {'<Esc>', 'q'},
          -- Jump to symbol under cursor.
          -- It can auto close the outline window when triggered, see
          -- 'auto_close' option above.
          goto_location = '<Cr>',
          -- Jump to symbol under cursor but keep focus on outline window.
          peek_location = 'p',
          -- Visit location in code and close outline immediately
          goto_and_close = '<S-Cr>',
          -- Change cursor position of outline window to match current location
          -- in code. 'Opposite' of goto/peek_location.
          restore_location = '<C-g>',
          -- Open LSP/provider-dependent symbol hover information
          hover_symbol = 'K',
          -- Preview location code of the symbol under cursor
          toggle_preview = 'P',
          rename_symbol = {},
          code_actions = 'ca',
          -- These fold actions are collapsing tree nodes, not code folding
          fold = 'h',
          unfold = 'l',
          fold_toggle = '<Tab>',
          -- Toggle folds for all nodes.
          -- If at least one node is folded, this action will fold all nodes.
          -- If all nodes are folded, this action will unfold all nodes.
          fold_toggle_all = '<S-Tab>',
          fold_all = 'W',
          unfold_all = 'E',
          fold_reset = 'R',
          -- Move down/up by one line and peek_location immediately.
          -- You can also use outline_window.auto_jump=true to do this for any
          -- j/k/<down>/<up>.
          down_and_jump = '<C-j>',
          up_and_jump = '<C-k>',
        },
      })
    end,
  }
}

-- Multicursor.nvim

local set = vim.keymap.set

-- Add or skip cursor above/below the main cursor.
set({ 'n', 'x' }, '<up>', function()
  require('multicursor-nvim').lineAddCursor(-1)
end)
set({ 'n', 'x' }, '<down>', function()
  require('multicursor-nvim').lineAddCursor(1)
end)
set({ 'n', 'x' }, '<leader><up>', function()
  require('multicursor-nvim').lineSkipCursor(-1)
end)
set({ 'n', 'x' }, '<leader><down>', function()
  require('multicursor-nvim').lineSkipCursor(1)
end)

-- Add or skip adding a new cursor by matching word/selection
set({ 'n', 'x' }, '<leader>n', function()
  require('multicursor-nvim').matchAddCursor(1)
end)
set({ 'n', 'x' }, '<leader>s', function()
  require('multicursor-nvim').matchSkipCursor(1)
end)
set({ 'n', 'x' }, '<leader>N', function()
  require('multicursor-nvim').matchAddCursor(-1)
end)
set({ 'n', 'x' }, '<leader>S', function()
  require('multicursor-nvim').matchSkipCursor(-1)
end)

-- Add and remove cursors with control + left click.
set('n', '<c-leftmouse>', function()
  require('multicursor-nvim').handleMouse()
end)
set('n', '<c-leftdrag>', function()
  require('multicursor-nvim').handleMouseDrag()
end)
set('n', '<c-leftrelease>', function()
  require('multicursor-nvim').handleMouseRelease()
end)

-- Disable and enable cursors.
set({ 'n', 'x' }, '<c-q>', function()
  require('multicursor-nvim').toggleCursor()
end)

return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  lazy = true,
  config = function()
    local mc = require('multicursor-nvim')
    mc.setup()

    -- Mappings defined in a keymap layer only apply when there are multiple
    -- cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
      layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)

      -- Delete the main cursor.
      layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet('n', '<esc>', function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end
}

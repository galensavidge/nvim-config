-- Various-textobjects
-- Adds lots of new handy text objects (e.g. iq for "inner quote", aS for
-- "outer sub-word").

return {
  {
    'chrisgrieser/nvim-various-textobjs',
    config = function()
      require('various-textobjs').setup({
        -- set to 0 to only look in the current line
        lookForwardSmall = 5,
        lookForwardBig = 15,

        -- use suggested keymaps (see overview table in README)
        useDefaultKeymaps = true,

        -- disable only some default keymaps, e.g. { 'ai', 'ii' }
        disabledKeymaps = {},

        -- display notification if a text object is not found
        notifyNotFound = false,
      })
    end
  },
}

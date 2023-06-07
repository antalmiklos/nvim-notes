-- Imports the plugin's additional Lua modules.
local window = require("nvim-notes.window")

-- Creates an object for the module. All of the module's
-- functions are associated with this object, which is
-- returned when the module is called with `require`.
local M = {}
-- Routes calls made to this module to functions in the
-- plugin's other modules.
M.open_float = window.open_float

function M.setup(opts)
  if opts == nil then
    return
  end
  return
end

vim.api.nvim_create_user_command(
    'DoTheThing',
    function()
        M.open_float()
        print "Something should happen here..."
    end,
    {bang = true, desc = 'a new command to do the thing'}
)

require("nvim-notes")
return M


-- Creates an object for the module.
local M = {}

local function create_buf(name)
  if name == nil then
    name = "notes"
  end
  M.buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(name)
end



function M.open_float()
  if M.buffer == nil then
    create_buf("notes")
  end
  local width = 60;
  local height = 60;
  local zindex = 99;
  vim.api.nvim_open_win(M.buffer, true, {
    relative='win',
    width=width,
    height=height,
    border="single",
    win = 1001,
    row = 20,
    col = 20,
    zindex=zindex,
  })
end

return M

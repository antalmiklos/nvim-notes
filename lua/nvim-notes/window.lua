-- Creates an object for the module.
local M = {}

local function get_win_dimensions()
  local width = vim.api.nvim_win_get_width(0)
  local height = vim.api.nvim_win_get_height(0)
  return {width = width, height = height}
end

local function create_buf(name)
  if name == nil then
    name = "notes"
  end
  M.buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(M.buffer, name)
end



function M.open_float()
  local width = 60;
  local height = 20;
  local zindex = 99;
  local dim = get_win_dimensions()

  local col = dim.width - width / 2
  local row = dim.height - height / 2

  if M.buffer == nil then
    create_buf("notes")
  end



  vim.api.nvim_open_win(M.buffer, true, {
    relative='win',
    width=width,
    height=height,
    border="single",
    win = 1001,
    row = row,
    col = col,
    zindex=zindex,
  })
end

return M

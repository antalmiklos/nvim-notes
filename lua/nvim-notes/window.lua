-- Creates an object for the module.
local M = {}

function M.open_float()
  local width = 120;
  local height = 60;
  local zindex = 99;
  local buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_open_win(buffer, true, {
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

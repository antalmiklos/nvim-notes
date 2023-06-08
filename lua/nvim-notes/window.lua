-- Creates an object for the module.
local M = {}

M.open = false

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
  local zindex = 2;
  local dim = get_win_dimensions()

  local col = (dim.width - width) / 2
  local row = (dim.height - height) / 2


  if M.buffer == nil then
    create_buf("notes")
    vim.api.nvim_buf_set_option(M.buffer, 'modifiable', true)
  end

    if not M.open then
      M.wid = vim.api.nvim_open_win(M.buffer, true, {
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
end

function M.close_float()
  if not M.open then
    return
  end
  vim.api.nvim_win_close(M.wid, false)
  M.open = false
end

function M.toggle_notes()
    if M.open then
        M.close_float()
        return
    end
    M.open_float()
end

return M

-- Creates an object for the module.
local M = {}

local notes = require("nvim-notes.notes")

M.open = false
M.wid = 0

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
  notes_cnt = notes.read_notes("quicknotes.md")
  vim.api.nvim_buf_set_lines(M.buffer,0,0,false, notes_cnt)
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
  notes_cnt = notes.read_notes("quicknotes.md")
  vim.api.nvim_buf_set_lines(M.buffer,0,0,false, notes_cnt)
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
    M.open = true
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
        notes.save_note("quicknotes.md", vim.api.nvim_buf_get_lines(M.buffer, 0, -1, false))
        return
    end
    M.open_float()
end

return M

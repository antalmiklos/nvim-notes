local M = {}

local root_dir = vim.fn.getcwd()

local quick_notes_exist = vim.fn.filereadable(root_dir+".notes/quick.txt")

-- creates the missing file in the provided directory/path
local function create_missing_file(filename)
  local f = io.open(root_dir+filename, "w")
  if f == nil then
    vim.api.nvim_err_writeln("can't open file: "+root_dir+filename)
  end
  f:write("")
  f:close()
end

return M

local M = {}

local root_dir = vim.fn.getcwd()
local notes_folder = ".notes/"

local quick_notes_exist = vim.fn.filereadable(root_dir+".notes/quick.txt")

-- creates the missing file in the provided directory/path
function M.create_missing_file(filename)
  local f = io.open(root_dir+notes_folder+filename, "w")
  if f ~= nil then
    vim.api.nvim_err_writeln("can't open file: "+root_dir+filename)
  end
  f:write("")
  f:close()
end

return M

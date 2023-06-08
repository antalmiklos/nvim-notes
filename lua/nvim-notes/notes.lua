local M = {}

local root_dir = vim.fn.getcwd()
local notes_folder = "/.notes/"

-- local quick_notes_exist = vim.fn.filereadable(root_dir..".notes/quick.txt")

local function create_dir()
  vim.fn.mkdir(root_dir..notes_folder)
end

-- creates the missing file in the provided directory/path
function M.create_missing_file(filename)
  local isdir = vim.fn.isdirectory(root_dir..notes_folder)
  if not isdir then
     create_dir()
  end
  local f = assert(io.open(root_dir..notes_folder..filename, "a+"))
  if not f then
    return
  end
  f:write("")
  f:close()
end

return M

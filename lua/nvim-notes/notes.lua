local M = {}

local root_dir = vim.fn.getcwd()
local notes_folder = "/.notes/"

-- local quick_notes_exist = vim.fn.filereadable(root_dir..".notes/quick.txt")

-- creates the missing file in the provided directory/path
function M.create_missing_file(filename)
  print(root_dir..notes_folder..filename)
  vim.fn.mkdir(root_dir..notes_folder)
 -- local f = assert(io.open(root_dir..notes_folder..filename, "a+"))
 -- if not f then
 --   vim.fn.mkdir(root_dir..notes_folder)
 --   return
 -- end
 -- f:write("-- test")
 -- f:close()
end

return M

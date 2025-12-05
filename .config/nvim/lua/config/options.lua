-- set mapping for leader
vim.g.mapleader = " "

-- sync clipboards
vim.opt.clipboard = "unnamedplus"

-- enable line number
vim.opt.number = true

-- width of a tab
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- virt text
vim.diagnostic.config({
  virtual_text = true,
})

-- nixos flag
function file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

if file_exists("/etc/NIXOS") then
  vim.g.system_id = "nixos"
end

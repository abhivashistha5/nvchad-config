---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'onedark',
}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'


-- vim options
local opt = vim.opt
opt.relativenumber = true

return M

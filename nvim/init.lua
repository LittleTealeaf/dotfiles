local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- Setup Packer
require("plugins")
require("config")
require("keymaps")
require("cursorrestore")
require("commands")

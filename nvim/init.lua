local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- Setup Packer
require("config.packer-bootstrap")
require("config.plugins")
require("config.cursorrestore")
require("config.config")

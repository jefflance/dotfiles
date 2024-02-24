--[[--
File              : conf.d/lvim/lua/user/dap.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 21:34:48
Last Modified Date: 01.02.2024 12:47:04
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- Setup debug adapter
--

local M = {}

M.setup = function()
  lvim.builtin.dap.active = true
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
  pcall(function()
    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  end)
end

return M

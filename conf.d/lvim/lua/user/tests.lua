--[[--
File              : conf.d/lvim/lua/user/tests.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 21:34:48
Last Modified Date: 06.01.2024 18:55:14
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- Setup test framework
--

local M = {}

M.setup = function()
  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = {
          justMyCode = false,
          console = "integratedTerminal",
        },
        args = { "--log-level", "DEBUG", "--quiet" },
        runner = "pytest",
      })
    }
  })
end

return M

--[[--
File              : conf.d/lvim/lua/user/plugin-configs.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 21:34:48
Last Modified Date: 28.12.2023 21:34:48
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



local M = {}

-- setup debug adapter
M.dap = function ()
  lvim.builtin.dap.active = true
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
  pcall(function()
    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  end)
end

-- setup testing
M.neotest = function ()
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

--[[--
File              : conf.d/lvim/ftplugin/python.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 06.08.2023 12:46:43
Last Modified Date: 08.08.2023 19:23:05
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]
--



-- Setup debug adapter
--
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Setup testing
--
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

-- Linters
--
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "flake8", filetypes = { "python" } },
})

-- Formatters
--
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "black" },
})

--[[--
File              : conf.d/lvim/lua/user/lsp.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 21:34:48
Last Modified Date: 06.01.2024 18:59:29
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- Setup debug adapter
--

local M = {}

M.setup = function()
  -- Generic LSP settings
  vim.diagnostic.config({ virtual_text = true })

  -- setup LSP
  local capabilities = require("lvim.lsp").common_capabilities()
  require("lvim.lsp.manager").setup(
    "texlab", {
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
  })

  require("lvim.lsp.manager").setup(
    "marksman", {
  })

  require("lvim.lsp.manager").setup(
    "golangci_lint_ls", {
  })

end

return M

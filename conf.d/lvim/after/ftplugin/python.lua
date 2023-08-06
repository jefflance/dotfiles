--[[--
File              : python.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 06.08.2023 12:46:43
Last Modified Date: 06.08.2023 12:46:43
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- linters
--

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "flake8", filetypes = { "python" } },
})

-- formatters
--

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "black" },
})

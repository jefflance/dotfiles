--[[--
File              : /home/jeff/.config/lvim/after/ftplugin/tex.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 05.08.2023 00:54:40
Last Modified Date: 05.08.2023 00:54:40
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- linters
--

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "chktex", filetypes = { "tex" } },
})

-- formatters
--

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "latexindent", filetypes = { "tex" } },
})


--[[--
File              : conf.d/lvim/ftplugin/tex.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 06.08.2023 11:07:22
Last Modified Date: 15.08.2023 00:46:47
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]
--



local opts = {}

local status_ok, whk = pcall(require, "which-key")
if not status_ok then
  return
end

-- Shortcuts
--
-- old way making the LaTeX menu appears with the LSP and Lunar one
-- whk.register {
--   ["<leader>L"] = {
--     name = "LSP, Lunar, LaTeX", -- we edit the title of the L shortcut
--   }
-- }

vim.g.maplocalleader  = " " -- we define a leader available only from tex files

whk.register {
  ["<localleader>l"] = {} -- empties the default VimTeX menu mapping
}

whk.register {
  ["<localleader>"] = {   -- to set a completly new using only the localleader key
    name = "LaTeX",
    c = { "<cmd>VimtexCompileSS<CR>", "Single-shot compile project" },
    C = {
      name = "Compile",
      s = { "<cmd>VimtexStop<CR>", "Stop compile" },
      c = { "<cmd>VimtexCompileSelected<CR>", "Compile Selected" },
    },
    d = { "<cmd>VimtexDocPackage<CR>", "Open Doc for package" },
    e = { "<cmd>VimtexErrors<CR>", "Look at the errors" },
    m = { "<cmd>VimtexToggleMain<CR>", "Toggle Main" },
    o = { "<cmd>VimtexView<CR>", "View pdf" },
    s = { "<cmd>VimtexStatus<CR>", "Look at the status" },
    T = {
      name = "TOC",
      o = { "<cmd>VimtexTocOpen<CR>", "Open TOC" },
      t = { "<cmd>VimtexTocToggle<CR>", "Toggle TOC" },
    },
    V = {
      name = "VimTeX",
      c = { "<CMD>edit /home/jeff/.config/lvim/ftplugin/tex.lua<CR>", "Edit configuration" },
      s = { "<CMD>edit /home/jeff/.config/lvim/luasnippets/tex.lua<CR>", "Edit snippets" },
      i = { "<cmd>VimtexInfo<CR>", "Vimtex Info" },
    },
  }
}

-- Linters
--
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "chktex", filetypes = { "tex" } },
})

-- Formatters
--
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "latexindent", filetypes = { "tex" } },
})



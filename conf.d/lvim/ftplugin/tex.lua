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
-- vim.g.maplocalleader  = " "

whk.register {
  ["<leader>L"] = {
    name = "LSP, Lunar, LaTeX", -- we edit the title of the L shortcut
  }
}

whk.register {
  ["<leader>Lx"] = {
    name = "LaTeX",
    c = { "<cmd>VimtexCompileSS<CR>", "Single-shot compile project" },
    C = { "<cmd>VimtexCompileSelected<CR>", "Compile Selected" },
    D = { "<cmd>VimtexDocPackage<CR>", "Open Doc for package" },
    e = { "<CMD>edit /home/jeff/.config/lvim/luasnippets/tex.lua<CR>", "Edit snippets" },
    E = { "<cmd>VimtexErrors<CR>", "Look at the errors" },
    I = { "<cmd>VimtexInfo<CR>", "Vimtex Info" },
    K = {
      name = "Clean",
      p = { "<cmd>VimtexClean<CR>", "Clean Project" },
      c = { "<cmd>VimtexClean<CR>", "Clean Cache" },
    },
    m = { "<cmd>VimtexToggleMain<CR>", "Toggle Main" },
    R = {
      name = "Reload",
      r = { "<cmd>VimtexReload<CR>", "Reload" },
      s = { "<cmd>VimtexReloadState<CR>", "Reload State" },
    },
    s = { "<cmd>VimtexStop<CR>", "Stop compile" },
    S = { "<cmd>VimtexStatus<CR>", "Look at the status" },
    T = {
      name = "TOC",
      o = { "<cmd>VimtexTocOpen<CR>", "Open TOC" },
      t = { "<cmd>VimtexTocToggle<CR>", "Toggle TOC" },
    },
    v = { "<cmd>VimtexView<CR>", "View pdf" },
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

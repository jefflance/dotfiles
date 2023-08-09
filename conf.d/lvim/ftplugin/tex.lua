--[[--
File              : conf.d/lvim/ftplugin/tex.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 06.08.2023 11:07:22
Last Modified Date: 08.08.2023 19:23:36
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
whk.register {
  ["<leader>l"] = {
    name = "LaTeX",
    m = { "<cmd>VimtexContextMenu<CR>", "Open Context Menu" },
    u = { "<cmd>VimtexCountLetters<CR>", "Count Letters" },
    w = { "<cmd>VimtexCountWords<CR>", "Count Words" },
    d = { "<cmd>VimtexDocPackage<CR>", "Open Doc for package" },
    e = { "<cmd>VimtexErrors<CR>", "Look at the errors" },
    s = { "<cmd>VimtexStatus<CR>", "Look at the status" },
    a = { "<cmd>VimtexToggleMain<CR>", "Toggle Main" },
    v = { "<cmd>VimtexView<CR>", "View pdf" },
    i = { "<cmd>VimtexInfo<CR>", "Vimtex Info" },
    l = {
      name = "Clean",
      l = { "<cmd>VimtexClean<CR>", "Clean Project" },
      c = { "<cmd>VimtexClean<CR>", "Clean Cache" },
    },
    c = {
      name = "Compile",
      c = { "<cmd>VimtexCompile<CR>", "Continuous compile project" },
      o = {
        "<cmd>VimtexCompileOutput<CR>",
        "Compile Project and Show Output",
      },
      s = { "<cmd>VimtexCompileSS<CR>", "Single-shot compile project" },
      e = { "<cmd>VimtexCompileSelected<CR>", "Compile Selected" },
    },
    r = {
      name = "Reload",
      r = { "<cmd>VimtexReload<CR>", "Reload" },
      s = { "<cmd>VimtexReloadState<CR>", "Reload State" },
    },
    o = {
      name = "Stop",
      p = { "<cmd>VimtexStop<CR>", "Stop" },
      a = { "<cmd>VimtexStopAll<CR>", "Stop All" },
    },
    t = {
      name = "TOC",
      o = { "<cmd>VimtexTocOpen<CR>", "Open TOC" },
      t = { "<cmd>VimtexTocToggle<CR>", "Toggle TOC" },
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

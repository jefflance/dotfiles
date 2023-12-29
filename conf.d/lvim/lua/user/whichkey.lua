--[[--
File              : conf.d/lvim/lua/user/whichkey.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 29.12.2023 22:30:57
Last Modified Date: 29.12.2023 22:30:57
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



local M = {}

M.setup = function()
  -- =================
  -- whichkey mappings
  --

  -- remap neo-tree shortcut to rnvimr
  lvim.builtin.which_key.mappings["e"] = { "<CMD>RnvimrToggle<CR>", "File explorer" }

  -- remap dashboard
  lvim.builtin.which_key.mappings["d"] = lvim.builtin.which_key.mappings[";"]

  -- remap git
  lvim.builtin.which_key.mappings["G"] = lvim.builtin.which_key.mappings["g"]
  lvim.builtin.which_key.mappings["g"] = {}

  -- remap highlight
  lvim.builtin.which_key.mappings["H"] = lvim.builtin.which_key.mappings["h"]

  -- remap lunarvim and lsp
  lvim.builtin.which_key.mappings["Lv"] = lvim.builtin.which_key.mappings["L"]
  lvim.builtin.which_key.mappings["Ll"] = lvim.builtin.which_key.mappings["l"]
  lvim.builtin.which_key.mappings["l"] = {}
  lvim.builtin.which_key.mappings["L"] = {
    name = "LSP, Lunar"
  }
  lvim.builtin.which_key.mappings["Lve"] = lvim.builtin.which_key.mappings["Lvc"]
  lvim.builtin.which_key.mappings["Lvc"] = {}

  -- zettle mappings
  lvim.builtin.which_key.mappings["N"] = {
    name = "Notes",
    c = { "<CMD>edit /home/jeff/.config/zk/config.toml<CR>", "Edit config.toml" },
    n = { "<CMD>ZkNew { dir = vim.fn.input('Groupe: '), title = vim.fn.input('Titre: '), date = 'now' }<CR>",
      "Créer une nouvelle note" },
    o = { "<CMD>ZkNotes { sort = { 'modified' } }<CR>", "Ouvrir une note" },
    O = { "<CMD>ZkTags<CR>", "Ouvrir les notes avec le tag sélectionné" },
    f = { "<CMD>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Rechercher note: ') } }<CR>",
      "Rechercher une note" },
    F = { ":'<,'>ZkMatch<CR>", "Rechercher les notes contenant la sélection" },
  }

  -- remap plugins mappings
  lvim.builtin.which_key.mappings["P"] = {
    name = "Plugins"
  }

  -- telescope
  lvim.builtin.which_key.mappings["P"] = lvim.builtin.which_key.mappings["p"]
  lvim.builtin.which_key.mappings["o"] = { "<CMD>Telescope find_files<CR>", "Open a file" }
  lvim.builtin.which_key.mappings["p"] = { "<CMD>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Open recent file" }

  -- remap search
  lvim.builtin.which_key.mappings["S"] = lvim.builtin.which_key.mappings["s"]

  -- new mappings
  lvim.builtin.which_key.mappings["h"] = {
    name = "Header",
    h    = { "<CMD>AddHeader<CR>", "Add header to the file" },
    m    = { "<CMD>AddMinHeader<CR>", "Add minimal header to the file" },
    lg   = { "<CMD>AddGNULicense<CR>", "Add GPLv3 License" },
    lm   = { "<CMD>AddMITLicense<CR>", "Add MIT License" },
  }

  lvim.builtin.which_key.mappings["n"] = { "<CMD>AdvancedNewFile<CR>", "Create a new file"}

  lvim.builtin.which_key.mappings["s"] = { "<CMD>echom 'Sourcing' <BAR> source %<CR>", "Source current file" }

  lvim.builtin.which_key.mappings["x"] = { "<CMD>w! <BAR> q!<CR>", "Save and quit" }

  lvim.builtin.which_key.mappings[";"] = {}
  lvim.builtin.terminal.open_mapping = "<C-t>"

end

return M

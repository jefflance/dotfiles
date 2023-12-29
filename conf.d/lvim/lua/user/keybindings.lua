--[[--
File              : conf.d/lvim/lua/user/keybindings.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 20:32:45
Last Modified Date: 29.12.2023 22:35:31
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



local M = {}

M.setup = function()
  -- ============
  -- key mappings
  --
  -- vim-surround shortcuts as example
  -- vim.api.nvim_set_keymap("n", "sw", "<Plug>Ysurroundiw", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "Sw", "<Plug>YSurroundiw", { noremap = true, silent = true })
  --

  lvim.leader = ";"

  lvim.keys.insert_mode[";;"] = "<Esc>"

  lvim.keys.normal_mode["<C-s>"] = "<CMD>w!<CR>"
  lvim.keys.normal_mode["<C-z>"] = "<CMD>undo<CR>"
  lvim.keys.normal_mode["<C-r>"] = "<CMD>redo<CR>"
  lvim.keys.normal_mode["<C-[>"] = ":<<CR>"
  lvim.keys.normal_mode["<C-]>"] = ":><CR>"

end

return M


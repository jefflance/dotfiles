--[[--
File              : /home/jeff/.config/lvim/config.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 03.08.2023 16:16:54
Last Modified Date: 10.08.2023 00:57:51
Last Modified By  : Jeff Lance <email@jefflance.me>

---

lvim is the global options object

--]]--



-- general
--

-- lvim config
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.asy", "*.py", ".toml" }
lvim.colorscheme = "onedark_dark"
lvim.background = "dark"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- core plugins config
-- local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { "mode" }
-- lvim.builtin.lualine.sections.lualine_y = {
--   -- components.spaces,
--   -- components.location
-- }
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.luasnip.enable_autosnippets = true
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.terminal.active = true
-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = { "xplr", ";e", "File manager", "float", nil }


-- theme settings
--

-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"



-- variables
--
local home = vim.fn.expand("$HOME")



-- ==============================================
-- Trying to make a modular configuration
-- plugins
--
require("user.plugins").setup()



-- functions
--
require("user.functions")



-- keybindings
--
require("user.keybindings").setup()
--



-- which_key
--
require("user.whichkey").setup()
--
-- ==============================================



-- Treesitter settings
--

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "go",
  "java",
  "javascript",
  "json",
  "julia",
  "latex",
  "lua",
  "perl",
  "python",
  "typescript",
  "tsx",
  "css",
  "ruby",
  "rust",
  "toml",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "comment" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.highlight.disable( "latex", "zsh" )
lvim.builtin.treesitter.rainbow.enable = true



-- LSP settings
--

require("user.lsp").setup()



-- Setup formatters and linters
--
-- Currently started with ftplugin for:
-- latex
-- python



-- Debug adapters
--

require("user.dap").setup()



-- Tests framework
--

require("user.tests").setup()



-- Telescope plugins load
--

lvim.builtin.telescope.on_config_done = function(telescope)
  -- pcall(telescope.load_extension, "project")
  -- any other extensions loading
end



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
--

-- minimap view
-- lvim.autocommands = {
--   {
--     {"BufEnter", "Filetype"},
--     {
--       desc = "Open mini.map and exclude some filetypes",
--       pattern = { "*" },
--       callback = function()
--         local exclude_ft = {
--           "qf",
--           "NvimTree",
--           "toggleterm",
--           "TelescopePrompt",
--           "alpha",
--           "netrw",
--         }

--         local map = require('mini.map')
--         if vim.tbl_contains(exclude_ft, vim.o.filetype) then
--           vim.b.minimap_disable = true
--           map.close()
--         elseif vim.o.buftype == "" then
--           map.open()
--         end
--       end,
--     },
--   },
-- }

-- wrap mode for json files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

-- bash highlight for zsh files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

-- -- latex cmp
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("LaTeXGroup", { clear = true }),
--   pattern = "tex",
--   callback = function()
--     require("user.cmp")
--   end,
-- })

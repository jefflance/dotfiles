--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT



-- general
--

lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "onedark_dark"
lvim.background = "dark"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false



-- keymappings [view all the defaults by pressing <leader>Lk]
--

lvim.leader = ";"

lvim.keys.insert_mode[";;"] = "<Esc>"
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["<C-r>"] = ":redo<CR>"
lvim.keys.normal_mode["<C-u>"] = ":undo<CR>"
lvim.keys.normal_mode["<C-[>"] = "<<"
lvim.keys.normal_mode["<C-]>"] = ">>"

lvim.builtin.which_key.mappings["d"] = lvim.builtin.which_key.mappings[";"]

lvim.builtin.which_key.mappings["G"] = lvim.builtin.which_key.mappings["g"]
lvim.builtin.which_key.mappings["g"] = {}

lvim.builtin.which_key.mappings["Lv"] = lvim.builtin.which_key.mappings["L"]
lvim.builtin.which_key.mappings["L"] = lvim.builtin.which_key.mappings["l"]
lvim.builtin.which_key.mappings["l"] = {}

lvim.builtin.which_key.mappings["P"] = lvim.builtin.which_key.mappings["p"]
lvim.builtin.which_key.mappings["p"] = { "<CMD>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["S"] = lvim.builtin.which_key.mappings["s"]
lvim.builtin.which_key.mappings["s"] = { "<CMD>echom 'Sourcing' <BAR> source %<CR>", "Source current file" }

lvim.builtin.which_key.mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Open recent file" }

lvim.builtin.which_key.mappings["z"] = {
  name = "+Zettel",
  c = { "<CMD>lua require('neuron/cmd').new_edit('/home/jeff/Notes/')<CR>", "Create new note" },
  z = { "<CMD>lua require'neuron/telescope'.find_zettels()<CR>", "Find notes" },
  Z = { "<CMD>lua require'neuron/telescope'.find_zettels {insert = true}<CR>", "Insert the found note ID" },
  b = { "<CMD>lua require'neuron/telescope'.find_backlinks()<CR>", "Backlinks of the current note" },
  B = { "<CMD>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>", "As b but insert the found ID" },
  t = { "<CMD>lua require'neuron/telescope'.find_tags()<CR>", "Find all tags and insert" },
  s = { "<CMD>lua require'neuron'.rib {address = '127.0.0.1:8200', verbose = true}<CR>", "Start neuron server" },
  n = { "<CMD>lua require'neuron'.goto_next_extmark()<CR>", "Goto next link" },
  p = { "<CMD>lua require'neuron'.goto_prev_extmark()<CR>", "Goto previous link" },
}

lvim.builtin.which_key.mappings["x"] = { "<CMD>w! <BAR> q!<CR>", "Save and quit"}

lvim.builtin.which_key.mappings[";"] = {}
lvim.builtin.terminal.open_mapping = "<C-t>"



-- Change theme settings
--

-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true



-- generic LSP settings
--

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }



-- Additional Plugins
--

lvim.plugins = {
  -- colorschemes
  {
    'Abstract-IDE/Abstract-cs',
  },
  {
    'ishan9299/modus-theme-vim',
  },
  {
    'NLKNguyen/papercolor-theme',
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function ()
      require("onedarkpro").setup({
        colors = {
          onedark = {
            bg = "#000000" -- black
          },
          onelight = {
            bg = "#FFFFFF" -- white
          },
          -- cursorline = "#FF0000",
        },
        styles = {
          types = "NONE",
          methods = "NONE",
          numbers = "NONE",
          strings = "NONE",
          comments = "italic",
          keywords = "bold,italic",
          constants = "NONE",
          functions = "italic",
          operators = "NONE",
          variables = "NONE",
          parameters = "NONE",
          conditionals = "italic",
          virtual_text = "NONE",
        },
        options = {
          cursorline = true,
          transparency = true,
        }
      })
    end
  },
  -- asyncrun
  {
    "skywind3000/asyncrun.vim",
  },
  -- trouble
  {
    'folke/trouble.nvim',
    cmd = "TroubleToggle",
  },
  -- neuron: note taking
  {
    'oberblastmeister/neuron.nvim',
    config = function()
      require("neuron").setup({
        virtual_titles = true,
        mappings = true,
        run = nil,
        neuron_dir = "~/Notes",
        leader = ";z",
      })
    end,
  },
  -- markdown previewer
  {
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  -- vim-surround
  {
    'tpope/vim-surround',
    config = function()
      vim.o.timeoutlen = 500
    end
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  -- colorizer: color highlighter
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({ '*' }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = 'background',
      })
    end,
  },
  -- minimap
  {
    'echasnovski/mini.map',
    branch = "stable",
    config = function()
      require('mini.map').setup()
      local map = require('mini.map')
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic({
            error = 'DiagnosticFloatingError',
            warn  = 'DiagnosticFloatingWarn',
            info  = 'DiagnosticFloatingInfo',
            hint  = 'DiagnosticFloatingHint',
          }),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot('2x1'),
        },
        window = {
          side = 'right',
          width = 20, -- set to 1 for a pure scrollbar :)
          winblend = 15,
          show_integration_count = false,
        },
      })
    end
  },
  -- telescope-project
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
}



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
--

-- minimap view
lvim.autocommands = {
  {
    {"BufEnter", "Filetype"},
    {
      desc = "Open mini.map and exclude some filetypes",
      pattern = { "*" },
      callback = function()
        local exclude_ft = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        }

        local map = require('mini.map')
        if vim.tbl_contains(exclude_ft, vim.o.filetype) then
          vim.b.minimap_disable = true
          map.close()
        elseif vim.o.buftype == "" then
          map.open()
        end
      end,
    },
  },
}

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

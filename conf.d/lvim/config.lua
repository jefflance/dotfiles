--[[--
File              : /home/jeff/.config/lvim/config.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 03.08.2023 16:16:54
Last Modified Date: 04.08.2023 00:49:41
Last Modified By  : Jeff Lance <email@jefflance.me>

---

lvim is the global options object

--]]
--



-- general
--

-- lvim config
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.asy", "*.lua", "*.py", "*.tex", ".toml" }
lvim.colorscheme = "onedark_dark"
lvim.background = "dark"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- core plugins config
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.luasnip.enable_autosnippets = true
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.terminal.active = true

-- theme settings
--

-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"



-- variables
--



-- functions
--



-- keymappings [view all the defaults by pressing <leader>Lvk]
--

lvim.leader = ";"

lvim.keys.insert_mode[";;"] = "<Esc>"

lvim.keys.normal_mode["<C-s>"] = "<CMD>w<CR>"
lvim.keys.normal_mode["<C-r>"] = "<CMD>redo<CR>"
lvim.keys.normal_mode["<C-u>"] = "<CMD>undo<CR>"
lvim.keys.normal_mode["<C-[>"] = ":<<CR>"
lvim.keys.normal_mode["<C-]>"] = ":><CR>"

-- remap neo-tree shortcut to rnvimr
lvim.builtin.which_key.mappings["e"] = { "<CMD>RnvimrToggle<CR>", "File explorer" }

lvim.builtin.which_key.mappings["d"] = lvim.builtin.which_key.mappings[";"]

lvim.builtin.which_key.mappings["G"] = lvim.builtin.which_key.mappings["g"]
lvim.builtin.which_key.mappings["g"] = {}

lvim.builtin.which_key.mappings["H"] = {
  name = "Header",
  H    = { "<CMD>AddHeader<CR>", "Add header to the file" },
  h    = { "<CMD>AddMinHeader<CR>", "Add minimal header to the file" },
  lg   = { "<CMD>AddGNULicense<CR>", "Add GPLv3 License" },
  lm   = { "<CMD>AddMITLicense<CR>", "Add MIT License" },
}

lvim.builtin.which_key.mappings["Lv"] = lvim.builtin.which_key.mappings["L"]
lvim.builtin.which_key.mappings["Ll"] = lvim.builtin.which_key.mappings["l"]
lvim.builtin.which_key.mappings["l"] = {}
lvim.builtin.which_key.mappings["L"] = {
  name = "LSP, Lunar"
}

lvim.builtin.which_key.mappings["n"] = {
  name = "Notes",
  n = { "<CMD>ZkNew { title = vim.fn.input('Titre: ') }<CR>", "Créer une nouvelle note" },
  o = { "<CMD>ZkNotes { sort = { 'modified' } }<CR>", "Ouvrir une note" },
  O = { "<CMD>ZkTags<CR>", "Ouvrir les notes avec le tag sélectionné" },
  f = { "<CMD>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Rechercher note: ') } }<CR>",
    "Rechercher une note" },
  F = { ":'<,'>ZkMatch<CR>", "Rechercher les notes contenant la sélection" },
}

lvim.builtin.which_key.mappings["o"] = { "<CMD>Telescope find_files<CR>", "Open a file" }

lvim.builtin.which_key.mappings["P"] = lvim.builtin.which_key.mappings["p"]
lvim.builtin.which_key.mappings["p"] = { "<CMD>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["S"] = lvim.builtin.which_key.mappings["s"]
lvim.builtin.which_key.mappings["s"] = { "<CMD>echom 'Sourcing' <BAR> source %<CR>", "Source current file" }

lvim.builtin.which_key.mappings["r"] = { "<CMD>Telescope oldfiles<CR>", "Open recent file" }

lvim.builtin.which_key.mappings["x"] = { "<CMD>w! <BAR> q!<CR>", "Save and quit" }

lvim.builtin.which_key.mappings[";"] = {}
lvim.builtin.terminal.open_mapping = "<C-t>"



-- Treesitter settings
--

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "java",
  "javascript",
  "json",
  "latex",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "toml",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true



-- Generic LSP settings
--

vim.diagnostic.config({ virtual_text = true })

-- setup LSP
local capabilities = require("lvim.lsp").common_capabilities()
require("lvim.lsp.manager").setup("texlab", {
  on_attach = require("lvim.lsp").common_on_attach,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = capabilities,
})



-- Setup formatters and linters
--
-- Currently started with ftplugin for:
-- latex
-- python



-- Python management setup
--

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})



-- Additional Plugins
--

lvim.plugins = {
  -- addheader
  {
    'alpertuna/vim-header',
    config = function()
      vim.cmd([[
        let g:header_field_author = 'Jeff Lance'
        let g:header_field_author_email = 'email@jefflance.me'
        let g:header_auto_update_header = 1
        let g:header_field_filename_path = 1
        let g:header_field_timestamp_format = '%d.%m.%Y %H:%M:%S'
      ]])
    end,
  },
  -- asyncrun
  {
    "skywind3000/asyncrun.vim",
  },
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
    config = function()
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
  -- markdown previewer
  {
    'iamcco/markdown-preview.nvim',
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.cmd([[
        let g:mkdp_auto_start = 1
      ]])
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
  -- neoscroll: smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  -- zk: a plain text note-taking assistant
  {
    'mickael-menu/zk-nvim',
    config = function()
      require("zk").setup({
      })
    end,
  },
  -- nvim-ts-rainbow: rainbowed parenthesis
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  -- colorizer: color highlighter
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({ '*' }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = 'background',
      })
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.cmd([[
        let g:rnvimr_draw_border = 1
        let g:rnvimr_pick_enable = 1
        let g:rnvimr_bw_enable = 1
      ]])
    end,
  },
  -- suda
  {
    'lambdalisue/suda.vim',
    config = function()
      vim.cmd([[
      let g:prompt = 'Mot de passe: '
      let g:suda_smart_edit = 1
      ]])
    end,
  },
  -- -- telescope-project
  -- {
  --  "nvim-telescope/telescope-project.nvim",
  --  event = "BufWinEnter",
  --  setup = function()
  --    vim.cmd ([[
  --     packadd telescope.nvim
  --   ]])
  --  end,
  -- },
  -- trouble
  {
    'folke/trouble.nvim',
    cmd = "TroubleToggle",
  },
  -- vim-repeat: enable repeating supported plugin maps with "."
  {
    "tpope/vim-repeat"
  },
  -- vim-surround
  {
    'tpope/vim-surround',
    config = function()
      vim.cmd([[
        let timeoutlen = 500
      ]])
    end,
  },
  -- LaTeX management needed plugins
  {
    "lervag/vimtex",
    config = function()
      vim.cmd([[
        let g:vimtex_view_method = "zathura"
        let g:vimtex_quickfix_enabled = 0
        let g:vimtex_compiler_method = 'latexmk'
        let g:vimtex_view_use_temp_files = 1
      ]])
    end,
  },
  {
    "kdheepak/cmp-latex-symbols"
  },
  {
    "KeitaNakamura/tex-conceal.vim"
  },
  {
    -- "SirVer/ultisnips"
  },
  -- Python management needed plugins
  {
    "ChristianChiarulli/swenv.nvim"
  },
  {
    "stevearc/dressing.nvim"
  },
  {
    "mfussenegger/nvim-dap-python"
  },
  {
    "nvim-neotest/neotest"
  },
  {
    "nvim-neotest/neotest-python"
  },
}



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

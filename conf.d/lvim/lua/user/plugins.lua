--[[--
File              : conf.d/lvim/lua/user/plugins.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 21:31:06
Last Modified Date: 28.12.2023 21:31:06
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



local M = {}

M.setup = function ()
  -- local config = require("user.plugin-configs")

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
    -- new file plugin
    {
      'Mohammed-Taher/AdvancedNewFile.nvim',
    },
    -- asyncrun
    {
      "skywind3000/asyncrun.vim",
    },
    -- cmp addons
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      dependencies = "hrsh7th/nvim-cmp",
      event = "InsertEnter",
    },
    {
      "micangl/cmp-vimtex",
      dependencies = "hrsh7th/nvim-cmp",
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
    -- gitignore
    {
      'jefflance/vim-gitignore',
    },
    -- languagetool
    {
      'dpelle/vim-grammalecte',
      config = function ()
        vim.cmd([[
          let g:grammalecte_cli_py = '/usr/bin/grammalecte-cli'
        ]])
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
            let g:vimtex_view_use_temp_files = 0
          ]])
      end,
    },
    {
      "KeitaNakamura/tex-conceal.vim"
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
end

return M

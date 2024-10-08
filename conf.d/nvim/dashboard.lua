--[[--
File              : dashboard.lua
Author            : Jeff LANCE <email@jefflance.me>
Date              : 20.07.2022
Last Modified Date: 22.07.2022
Last Modified By  : Jeff LANCE <email@jefflance.me>

db.custom_header        -- type can be nil,table or function(must be return table in function)
                        -- if not config will use default banner
db.custom_center        -- table type and in this table you can set icon,desc,shortcut,action keywords. desc must be exist and type is string
                        -- icon type is nil or string
                        -- shortcut type is nil or string also like icon
                        -- action type can be string or function or nil.
                        -- if you don't need any one of icon shortcut action ,you can ignore it.
db.custom_footer        -- type can be nil,table or function(must be return table in function)
db.preview_file_Path    -- string or function type that mean in function you can dynamic generate height width
db.preview_file_height  -- number type
db.preview_file_width   -- number type
db.preview_command      -- string type
db.hide_statusline      -- boolean default is true.it will hide statusline in dashboard buffer and auto open in other buffer
db.hide_tabline         -- boolean default is true.it will hide tabline in dashboard buffer and auto open in other buffer
db.session_directory    -- string type the directory to store the session file
db.header_pad           -- number type default is 1
db.center_pad           -- number type default is 1
db.footer_pad           -- number type default is 1

--]]--

local home = os.getenv('HOME')
local db = require('dashboard')
local dotfiles = '\'' .. home .. '/dotfiles\''

-- db.preview_command = 'cat '
-- db.preview_file_path = home .. '/.config/nvim/header1.cat'
-- db.preview_file_height = 20
-- db.preview_file_width = 32

db.custom_header = {
    '',
    ' ⣿⣿⣷⡁⢆⠈⠕⢕⢂⢕⢂⢕⢂⢔⢂⢕⢄⠂⣂⠂⠆⢂⢕⢂⢕⢂⢕⢂⢕⢂ ',
    ' ⣿⣿⣿⡷⠊⡢⡹⣦⡑⢂⢕⢂⢕⢂⢕⢂⠕⠔⠌⠝⠛⠶⠶⢶⣦⣄⢂⢕⢂⢕ ',
    ' ⣿⣿⠏⣠⣾⣦⡐⢌⢿⣷⣦⣅⡑⠕⠡⠐⢿⠿⣛⠟⠛⠛⠛⠛⠡⢷⡈⢂⢕⢂ ',
    ' ⠟⣡⣾⣿⣿⣿⣿⣦⣑⠝⢿⣿⣿⣿⣿⣿⡵⢁⣤⣶⣶⣿⢿⢿⢿⡟⢻⣤⢑⢂ ',
    ' ⣾⣿⣿⡿⢟⣛⣻⣿⣿⣿⣦⣬⣙⣻⣿⣿⣷⣿⣿⢟⢝⢕⢕⢕⢕⢽⣿⣿⣷⣔ ',
    ' ⣿⣿⠵⠚⠉⢀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢕⢕⢕⢕⢕⢕⣽⣿⣿⣿⣿ ',
    ' ⢷⣂⣠⣴⣾⡿⡿⡻⡻⣿⣿⣴⣿⣿⣿⣿⣿⣿⣷⣵⣵⣵⣷⣿⣿⣿⣿⣿⣿⡿ ',
    ' ⢌⠻⣿⡿⡫⡪⡪⡪⡪⣺⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃ ',
    ' ⠣⡁⠹⡪⡪⡪⡪⣪⣾⣿⣿⣿⣿⠋⠐⢉⢍⢄⢌⠻⣿⣿⣿⣿⣿⣿⣿⣿⠏⠈ ',
    ' ⡣⡘⢄⠙⣾⣾⣾⣿⣿⣿⣿⣿⣿⡀⢐⢕⢕⢕⢕⢕⡘⣿⣿⣿⣿⣿⣿⠏⠠⠈ ',
    ' ⠌⢊⢂⢣⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⢐⢕⢕⢕⢕⢕⢅⣿⣿⣿⣿⡿⢋⢜⠠⠈ ',
    ' ⠄⠁⠕⢝⡢⠈⠻⣿⣿⣿⣿⣿⣿⣿⣷⣕⣑⣑⣑⣵⣿⣿⣿⡿⢋⢔⢕⣿⠠⠈ ',
    ' ⠨⡂⡀⢑⢕⡅⠂⠄⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⢔⢕⢕⣿⣿⠠⠈ ',
    ' ⠄⠪⣂⠁⢕⠆⠄⠂⠄⠁⡀⠂⡀⠄⢈⠉⢍⢛⢛⢛⢋⢔⢕⢕⢕⣽⣿⣿⠠⠈ ',
    '',
}

db.custom_center = {
  {
    icon = nil,
    desc = 'Nouveau fichier               ',
    action = 'DashboardNewFile',
    shortcut = ';fn'
  },
  {
    desc = 'Trouver un fichier            ',
    action = "lua require('telescope.builtin').find_files()",
    shortcut = ';ff'
  },
  {
    desc = 'Fichiers récemment ouverts    ',
    action = "lua require('telescope.builtin').oldfiles()",
    shortcut = ';fh'
  },
  {
    desc = 'Parcourir les dotfiles        ',
    -- action = "lua require('telescope.builtin').find_files({ cwd = " .. dotfiles .. " })",
    action = 'Telescope dotfiles path=' .. dotfiles,
    shortcut = ';fd'
  },
}

-- Highlight Group
-- DashboardHeader DashboardCenter DashboardCenterIcon DashboardShortCut DashboardFooter

-- Command
-- DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
-- SessionSave,SessionLoad


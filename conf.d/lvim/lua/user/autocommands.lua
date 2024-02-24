--[[--
File              : conf.d/lvim/lua/user/autocommands.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 23.02.2024 16:47:36
Last Modified Date: 23.02.2024 16:47:36
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- Set autocommands
--
-- Some examples of autocommands definition through lvim api.
--

-- local M = {}

-- M.setup = function()
--   lvim.autocommands = {
--     -- for any files
--     {
--       { "VimEnter" },
--       {
--         pattern = { "*" },
--         command = "FloatermNew --width=0.8 --name=terminal --cwd=<buffer>",
--       }
--     },
--     -- arduino files
--     {
--       { "BufNewFile", "BufRead" },
--       {
--         pattern = { "*.ino", ".pde" },
--         command = "set filetype=arduino",
--       }
--     },
--     -- asymptote filetype
--     {
--       { "BufNewFile", "BufRead" },
--       {
--         pattern = { "*.asy" },
--         command = "set filetype=asy",
--       }
--     },
--   }
-- end

-- return M

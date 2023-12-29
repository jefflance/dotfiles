--[[--
File              : conf.d/lvim/lua/user/functions.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 20:13:31
Last Modified Date: 28.12.2023 20:13:31
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- function Surround(w_or_W)
--     local open_char = vim.fn.input("Surround with: ")
--     local closed_char = nil
--     if open_char == "(" then closed_char = ")" end
--     if open_char == "[" then closed_char = "]" end
--     if open_char == "{" then closed_char = "}" end
--     if open_char == "<" then closed_char = ">" end
--     if open_char == "'" then closed_char = "'" end
--     if open_char == '"' then closed_char = '"' end
--     if open_char == "`" then closed_char = "`" end
--     if open_char == "/" then closed_char = "/" end
--     if open_char == "|" then closed_char = "|" end

--     if w_or_W == "w" then
--         vim.cmd("normal! ciw" .. open_char)
--     elseif w_or_W == "W" then
--         vim.cmd([[normal! ciW]] .. open_char)
--     end
--     vim.cmd("normal! p")
--     vim.cmd("normal! a" .. closed_char)
--     vim.cmd("normal! a")
-- end


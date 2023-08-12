--[[--
File              : luasnip-helper-funcs.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 05.08.2023 20:35:21
Last Modified Date: 05.08.2023 20:35:21
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



-- local M = {}

-- -- Be sure to explicitly define these LuaSnip node abbreviations!
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

-- function M.get_visual(args, parent)
--   if (#parent.snippet.env.LS_SELECT_RAW > 0) then
--     return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
--   else
--     return sn(nil, i(1, ''))
--   end
-- end

-- function M.rec_ls()
-- 	return sn(nil, {
-- 		c(1, {
-- 			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
-- 			t({""}),
-- 			-- The same dynamicNode as in the snippet (also note: self reference).
-- 			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
-- 		}),
-- 	});
-- end

-- function M.table_node(args)
-- 	local tabs = {}
-- 	local count
-- 	table = args[1][1]:gsub("%s",""):gsub("|","")
-- 	count = table:len()
-- 	for j=1, count do
-- 		local iNode
-- 		iNode = i(j)
-- 		tabs[2*j-1] = iNode
-- 		if j~=count then
-- 			tabs[2*j] = t" & "
-- 		end
-- 	end
-- 	return sn(nil, tabs)
-- end

-- function M.rec_table()
-- 	return sn(nil,
--     {
--       c(1, {
--         t({""}),
--         sn(nil, {t{"\\\\",""}, d(1, table_node, {ai[1]}), d(2, rec_table, {ai[1]})})
--       }),
--     }
--   );
-- end

-- function M.mat(args, snip)
--     local rows = tonumber(snip.captures[2])
--     local cols = tonumber(snip.captures[3])
--     local nodes = {}
--     local ins_indx = 1 
--     for j = 1, rows do 
--         table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
--         ins_indx = ins_indx + 1 
--         for k = 2, cols do 
--             table.insert(nodes, t(" & "))
--             table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1))) 
--             ins_indx = ins_indx + 1 
--         end 
--         table.insert(nodes, t({ " \\\\", "" }))
--     end
--     -- fix last node.
--     nodes[#nodes] = t(" \\\\")
--     return sn(nil, nodes)
-- end


-- return M

--[[--
File              : .config/lvim/luasnippets/tex.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 05.08.2023 00:54:18
Last Modified Date: 06.08.2023 12:55:15
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--

-- local get_visual = function(args, parent)
--   if (#parent.snippet.env.LS_SELECT_RAW > 0) then
--     return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
--   else
--     return sn(nil, i(1, ''))
--   end
-- end

-- local rec_ls = function()
-- 	return sn(nil, {
-- 		c(1, {
-- 			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
-- 			t({""}),
-- 			-- The same dynamicNode as in the snippet (also note: self reference).
-- 			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
-- 		}),
-- 	});
-- end

-- local table_node = function(args)
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

-- local rec_table = function()
-- 	return sn(nil,
--     {
--       c(1, {
--         t({""}),
--         sn(nil, {t{"\\\\",""}, d(1, table_node, {ai[1]}), d(2, rec_table, {ai[1]})})
--       }),
--     }
--   );
-- end

--

return {
  -- s({trig = "ls", dscr = ""},
  --   fmta(
  --     [[
  --       \begin{itemize}
  --         \item <>
  --       \end{itemize}
  --     ]],
  --     {
  --       i(1),
  --       d(2, rec_ls, {}),
  --       i(0),
  --     }
  --   )
  -- ),
  -- s({trig = "tti", dscr = "Expands 'tii' into LaTeX's textit{} command."},
  --   fmta("\\textit{<>}",
  --     {
  --       d(1, get_visual),
  --     }
  --   )
  -- ),
  -- s("table",
  --   {
	 --    t{"\\begin{tabular}{"},
	 --    i(1,"0"),
	 --    t{"}",""},
	 --    d(2, table_node, {1}, {}),
	 --    d(3, rec_table, {1}),
	 --    t{"","\\end{tabular}"}
  --   }
  -- ),
  --
  -- environments
  --
  s({trig="env", dscr="A LaTeX empty environment"},
    fmt(
      [[
        \begin{<>}[<>]
          <>
        \end{<>}
      ]],
      -- The insert node is placed in the <> angle brackets
      {
        i(1),
        i(2),
        i(3),
        rep(1), -- This node repeat insert node 1
      },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
  s({trig="def", dscr="My LaTeX class definition environment"},
    fmt(
      [[
        \begin{definition}[<>]
          <>
        \end{definition}
      ]],
      -- The insert node is placed in the <> angle brackets
      {
        i(1),
        i(2)
      },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
  s({trig="ppt", dscr="My LaTeX class property environment"},
    fmt(
      [[
        \begin{propriete}[<>]
          <>
        \end{propriete}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="cor", dscr="My LaTeX class corollair environment"},
    fmt(
    [[
        \begin{corollaire}[<>]
          <>
        \end{corollaire}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="thm", dscr="My LaTeX class theorem environment"},
    fmt(
    [[
        \begin{theoreme}[<>]
          <>
        \end{theoreme}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="dem", dscr="My LaTeX class proof environment"},
    fmt(
      [[
        \begin{preuve}[<>]
          <>
        \end{preuve}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="csq", dscr="My LaTeX class consequence environment"},
    fmt(
      [[
        \begin{consequence}[<>]
          <>
        \end{consequence}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="rem", dscr="My LaTeX class remark environment"},
    fmt(
      [[
        \begin{remarque}[<>]
          <>
        \end{remarque}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="exp", dscr="My LaTeX class example environment"},
    fmt(
      [[
        \begin{exemple}[<>]
          <>
        \end{exemple}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="met", dscr="My LaTeX class method environment"},
    fmt(
      [[
        \begin{methode}[<>]
          <>
        \end{methode}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="app", dscr="My LaTeX class application environment"},
    fmt(
      [[
        \begin{application}[<>]
          <>
        \end{application}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="exe", dscr="My LaTeX class exercise environment"},
    fmt(
      [[
        \begin{exercice}[<>]
          <>
        \end{exercice}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="rap", dscr="My LaTeX class recall environment"},
    fmt(
      [[
        \begin{rappel}[<>]
          <>
        \end{rappel}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
  s({trig="aid", dscr="My LaTeX class help environment"},
    fmt(
      [[
        \begin{aide}[<>]
          <>
        \end{aide}
      ]],
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" }
    )
  ),
}


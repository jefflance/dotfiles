--[[--
File              : .config/lvim/luasnippets/tex.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 05.08.2023 00:54:18
Last Modified Date: 06.08.2023 12:55:15
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]
--



return {
  -- maths commands
  --
  s({ trig = "lim", dscr = "Limit" },
    fmta(
      [[
        $ \lim\limits_{ <> } <> $
      ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s({ trig = "xto", dscr = "Limit" },
    fmta(
      [[
        x \to <>
      ]],
      {
        i(1),
      }
    )
  ),
  s({ trig = "stack", dscr = "Limit" },
    fmta(
      [[
        \substack{ <> \\ <> }
      ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  --
  -- environments
  --
  s({ trig = "env", dscr = "A LaTeX empty environment" },
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
  s({ trig = "def", dscr = "My LaTeX class definition environment" },
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
  s({ trig = "ppt", dscr = "My LaTeX class property environment" },
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
  s({ trig = "cor", dscr = "My LaTeX class corollair environment" },
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
  s({ trig = "thm", dscr = "My LaTeX class theorem environment" },
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
  s({ trig = "dem", dscr = "My LaTeX class proof environment" },
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
  s({ trig = "csq", dscr = "My LaTeX class consequence environment" },
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
  s({ trig = "rem", dscr = "My LaTeX class remark environment" },
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
  s({ trig = "exp", dscr = "My LaTeX class example environment" },
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
  s({ trig = "met", dscr = "My LaTeX class method environment" },
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
  s({ trig = "app", dscr = "My LaTeX class application environment" },
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
  s({ trig = "exe", dscr = "My LaTeX class exercise environment" },
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
  s({ trig = "rap", dscr = "My LaTeX class recall environment" },
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
  s({ trig = "aid", dscr = "My LaTeX class help environment" },
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

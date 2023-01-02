" File              : pum.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 02.01.2023
" Last Modified Date: 02.01.2023
" Last Modified By  : Jeff LANCE <email@jefflance.me>

"""""""""""""""""""""""""""
"     ____  __  ____  ___
"    / __ \/ / / /  |/  /
"   / /_/ / / / / /|_/ /
"  / ____/ /_/ / /  / /
" /_/    \____/_/  /_/
"
"""""""""""""""""""""""""""

" General {{{
" -----

inoremap <C-n>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>      <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>      <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>      <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

" -----
"  }}}


" vim:ft=vim

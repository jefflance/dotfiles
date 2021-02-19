" keymap.vim
"
" Vim syntax file
" Language:	keymap
" Maintainer:	Timothy Madden <terminatorul@gmail.com>
" Last Change:	2013 apr 21
" Remark:	For authoring/editing Linux console keyboard maps
" Version:	0.9
"
" Syntax file for Linux console keyboard maps. These files are loaded with
" `loadkeys` system command in Linux and displayed with `dumpkeys`.
" 
" See loadkeys(1) and dumpkeys(1) manual pages. File format specification
" can be found in keymaps(5).

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Keymaps are case-insensitive ??
syntax case ignore

syntax match keymapComment excludenl /[#!].*/
syntax keyword keymapKeyword include charset keymaps keycode string to
syntax match keymapComposeKeyword /\v<compose>/
syntax match keymapModifier /\v<plain|Shift%(L|R)?|Alt%(Gr)?|Control|CtrlL|CtrlR|CapsShift>/
syntax match keymapDeclaration /\v^[[:blank:]]*%(%(alt_is_meta)|%(strings[[:blank:]]+as[[:blank:]]+usual))[[:blank:]]*$/
syntax match keymapComposeDeclaration /\v%(^[[:blank:]]*compose)@<=[[:blank:]]+as[[:blank:]]+usual[[:blank:]]+for[[:blank:]]+/
syntax match keymapBackslashEscape /\v\\%(\\|n|[0-7]{1,3}|"|')/ contained
syntax region keymapString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=keymapBackslashEscape
syntax match keymapOperator /\v[-+,=]|\\\n/

if !exists('g:keymap_number_prefix') || g:keymap_number_prefix
    syntax match keymapNumberFormat /\v%(%([0-9a-fA-F]|[uU]\+|0[xX])@<!0[xX]?[0-9a-fA-F]@=|U\+)/
else
    syntax match keymapNumberFormat /\vasdffd/	" some regular expression that will never match in a number
endif

syntax match keymapNumber /\v<[0-9]+>/ contains=keymapNumberFormat
syntax match keymapHexNumber /\v<0x[0-9a-fA-F]+>/ contains=keymapNumberFormat
syntax match keymapUnicodeCharacter /\v[Uu]\+[0-9a-fA-F]+/ contains=keymapNumberFormat
syntax region keymapCharacter start=/\v'/ skip=/\v\\./ end=/\v'/ contains=keymapBackslashEscape
syntax match keymapStringDef /\v%(^[[:blank:]]*string[[:blank:]]*)@<=[a-zA-Z_-]+%([[:blank:]]*\=[[:blank:]]*)@=/

" Values below are returned by `dumpkeys --long-info`
syntax match keymapLetters /\v<[a-tv-zA-TV-Z]>/
syntax match keymapLetterU /\v<[uU]>%(\+[0-9a-fA-F]+)@!/
syntax match keymapControlLetters /\v<Control_[a-zA-Z]>/
syntax match keymapFunctionKeys /\v<F[0-9]+>/
syntax match keymapNumericKPs /\v<KP_[0-9]+>/
syntax match keymapVirtualConsoles /\v<Console_[0-9]+>/
syntax match keymapMetaControl /\v<Meta_Control_[a-z]>/
syntax match keymapMetaLetters /\v<Meta_[a-zA-Z]>/
syntax match keymapAsciiDigits /\v<Ascii_[0-9]>/
syntax match keymapHexDigits /\v<Hex_[0-9A-F]>/
syntax match keymapBrlDot /\v<Brl_dot[0-9]+>/

syntax keyword keymapConstants01 nul BackSpace Tab Linefeed Escape Control_backslash Control_bracketright Control_asciicircum Control_underscore space
syntax keyword keymapConstants02 exclam quotedbl numbersign dollar percent ampersand apostrophe parenleft parenright asterisk plus comma minus period slash zero
syntax keyword keymapConstants03 one two three four five six seven eight nine colon semicolon less equal greater question at bracketleft backslash bracketright
syntax keyword keymapConstants04 asciicircum underscore grave braceleft bar braceright asciitilde Delete nobreakspace exclamdown cent sterling currency yen brokenbar
syntax keyword keymapConstants05 section diaeresis copyright ordfeminine guillemotleft notsign hyphen registered macron degree plusminus twosuperior threesuperior
syntax keyword keymapConstants06 acute mu paragraph periodcentered cedilla onesuperior masculine guillemotright onequarter onehalf threequarters questiondown Agrave
syntax keyword keymapConstants07 Aacute Acircumflex Atilde Adiaeresis Aring AE Ccedilla Egrave Eacute Ecircumflex Ediaeresis Igrave Iacute Icircumflex Idiaeresis ETH
syntax keyword keymapConstants08 Ntilde Ograve Oacute Ocircumflex Otilde Odiaeresis multiply Ooblique Ugrave Uacute Ucircumflex Udiaeresis Yacute THORN ssharp agrave
syntax keyword keymapConstants09 aacute acircumflex atilde adiaeresis aring ae ccedilla egrave eacute ecircumflex ediaeresis igrave iacute icircumflex idiaeresis eth
syntax keyword keymapConstants10 ntilde ograve oacute ocircumflex otilde odiaeresis division oslash ugrave uacute ucircumflex udiaeresis yacute thorn ydiaeresis Find
syntax keyword keymapConstants11 Insert Remove Select Prior Next Macro Help Do Pause VoidSymbol Return Show_Registers Show_Memory Show_State Break Last_Console
syntax keyword keymapConstants12 Caps_Lock Num_Lock Scroll_Lock Scroll_Forward Scroll_Backward Boot Caps_On SAK Decr_Console Incr_Console KeyboardSignal
syntax keyword keymapConstants13 Bare_Num_Lock KP_Add KP_Subtract KP_Multiply KP_Divide KP_Enter KP_Comma KP_Period KP_MinPlus dead_grave dead_acute dead_circumflex

" syntax keyword keymapConstants AltGr Shift Control Alt ShiftL ShiftR CtrlL CtrlR CapsShift Compose 
syntax match keymapConstants00 /\v%(^[[:blank:]]*%([a-zA-Z_]+[[:blank:]]+)*keycode[[:blank:]]+[0-9a-zA-Z_]+[[:blank:]]*\=[[:blank:]]*%(%(\+?%([a-zA-Z_-]+|%(U\+|0x)[0-9a-fA-F]+|[0-9]+))[[:blank:]]+)*)@<=<%(Alt%(Gr)?|Shift%(L|R)?|Control|CtrlL|CtrlR|CapsShift|Compose)>/

syntax keyword keymapConstants14 dead_tilde dead_diaeresis dead_cedilla Down Left Right Up Meta_nul Meta_BackSpace Meta_Tab Meta_Linefeed Meta_Escape
syntax keyword keymapConstants15 Meta_Control_backslash Meta_Control_bracketright Meta_Control_asciicircum Meta_Control_underscore Meta_space Meta_exclam
syntax keyword keymapConstants16 Meta_quotedbl Meta_numbersign Meta_dollar Meta_percent Meta_ampersand Meta_apostrophe Meta_parenleft Meta_parenright Meta_asterisk
syntax keyword keymapConstants17 Meta_plus Meta_comma Meta_minus Meta_period Meta_slash Meta_zero Meta_one Meta_two Meta_three Meta_four Meta_five Meta_six Meta_seven
syntax keyword keymapConstants18 Meta_eight Meta_nine Meta_colon Meta_semicolon Meta_less Meta_equal Meta_greater Meta_question Meta_at Meta_bracketleft Meta_backslash
syntax keyword keymapConstants19 Meta_bracketright Meta_asciicircum Meta_underscore Meta_grave Meta_braceleft Meta_bar Meta_braceright Meta_asciitilde Meta_Delete
syntax keyword keymapConstants20 Shift_Lock AltGr_Lock Control_Lock Alt_Lock ShiftL_Lock ShiftR_Lock CtrlL_Lock CtrlR_Lock CapsShift_Lock SShift SAltGr SControl SAlt
syntax keyword keymapConstants21 SShiftL SShiftR SCtrlL SCtrlR SCapsShift Brl_blank


syntax keyword keymapConstants22 Home End PageUp PageDown multiplication pound pilcrow Oslash Shift_L Shift_R AltL AltR Alt_L Alt_R AltGr_L AltGr_R AltLLock
syntax keyword keymapConstants23 AltRLock SCtrl Spawn_Console Uncaps_Shift lambda lamda Lambda Lamda xi ksi Xi Ksi chi khi Chi Khi tilde circumflex
syntax keyword keymapConstants24 dead_ogonek dead_caron dead_breve dead_doubleacute Idotabove Iabovedot dotlessi idotless  paragraph_sign soft_hyphen 
syntax match keymapConstants25   /no-break_space/

syntax keyword keymapConstants26 bielorussian_cyrillic_capital_letter_i ukrainian_cyrillic_capital_letter_i cyrillic_capital_letter_kha 
syntax keyword keymapConstants27 cyrillic_capital_letter_ha cyrillic_capital_letter_ge cyrillic_capital_letter_ghe cyrillic_capital_letter_ia 
syntax keyword keymapConstants28 cyrillic_capital_letter_ya cyrillic_capital_letter_iu cyrillic_capital_letter_yu cyrillic_capital_letter_yeri 
syntax keyword keymapConstants29 cyrillic_capital_letter_yeru cyrillic_capital_letter_reversed_e cyrillic_capital_letter_e cyrillic_capital_letter_ii 
syntax keyword keymapConstants30 cyrillic_capital_letter_i cyrillic_capital_letter_short_ii cyrillic_capital_letter_short_i
syntax keyword keymapConstants31 bielorussian_cyrillic_small_letter_i ukrainian_cyrillic_small_letter_i cyrillic_small_letter_kha 
syntax keyword keymapConstants32 cyrillic_small_letter_ha cyrillic_small_letter_ge cyrillic_small_letter_ghe cyrillic_small_letter_ia 
syntax keyword keymapConstants33 cyrillic_small_letter_ya cyrillic_small_letter_iu cyrillic_small_letter_yu cyrillic_small_letter_yeri 
syntax keyword keymapConstants34 cyrillic_small_letter_yeru cyrillic_small_letter_reversed_e cyrillic_small_letter_e cyrillic_small_letter_ii 
syntax keyword keymapConstants35 cyrillic_small_letter_i cyrillic_small_letter_short_ii cyrillic_small_letter_short_i rightanglequote

highlight link keymapComment Comment
highlight link keymapKeyword Keyword
highlight link keymapComposeKeyword Keyword
highlight link keymapDeclaration Statement
highlight link keymapComposeDeclaration Statement
highlight link keymapModifier StorageClass
highlight link keymapString String
highlight link keymapOperator Operator
highlight link keymapUnicodeCharacter Character
highlight link keymapCharacter Character
highlight link keymapNumber Number
highlight link keymapHexNumber Number
highlight link keymapStringDef PreProc
highlight link keymapBackslashEscape Special
highlight link keymapNumberFormat Special

for s:a in ['Letters', 'LetterU', 'ControlLetters', 'FunctionKeys', 'NumericKPs', 'VirtualConsoles', 
	    \ 'MetaControl', 'MetaLetters', 'AsciiDigits', 'HexDigits', 'BrlDot'
	    \ ]
    execute 'highlight link keymap' . s:a . ' Identifier'
endfor

unlet s:a

for s:a in range(0, 35)
    execute printf('highlight link keymapConstants%02d Identifier', s:a)
endfor

let b:current_syntax = 'keymap'

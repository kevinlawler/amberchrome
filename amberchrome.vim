" =============================================================================
" Name: amberchrome
" Author: kcl
" License: MIT
" Amber theme for Vim
" -----------------------------------------------------------------------------
"
" This is a theme that simulates the retro PC amber monochrome CRT.
"
" Criteria: 
"   • start with old monochrone monitor readings
"   • tune colors to improve appeal
"   • use bold, italic etc styling: historically justifiable and breaks visual monotony
"   • dark and light modes
"   • separate amber and green settings
"
" This theme can toggle between light and dark mode by setting the `background`
" variable to "light" or "dark".
"
" Builds on the work of foxbunny, gunyon, Reversed Engineer, Giorgio Brandi,
"                       lucius/filip, Constantine Kurbatov
"
" =============================================================================

highlight clear

if exists("syntax_on")
  syntax reset
endif

let s:everything = [
      \ "Boolean",
      \ "Character",
      \ "ColorColumn",
      \ "Comment",
      \ "Conceal",
      \ "Conditional",
      \ "Constant",
      \ "Cursor",
      \ "CursorColumn",
      \ "CursorIM",
      \ "CursorLine",
      \ "CursorLineNr",
      \ "Debug",
      \ "Define",
      \ "Delimiter",
      \ "DiffAdd ",
      \ "DiffAdd",
      \ "DiffChange",
      \ "DiffDelete",
      \ "DiffText",
      \ "Directory",
      \ "Error",
      \ "ErrorMsg ",
      \ "ErrorMsg",
      \ "Exception",
      \ "Float",
      \ "FoldColumn",
      \ "Folded ",
      \ "Function",
      \ "Identifier",
      \ "Ignore",
      \ "IncSearch",
      \ "Include",
      \ "Keyword",
      \ "Label",
      \ "LineNr",
      \ "Macro",
      \ "MatchParen",
      \ "ModeMsg",
      \ "MoreMsg",
      \ "NonText",
      \ "Normal",
      \ "Number",
      \ "Operator",
      \ "Pmenu",
      \ "PmenuSbar",
      \ "PmenuSel",
      \ "PmenuThumb",
      \ "PreCondit",
      \ "PreProc",
      \ "Question",
      \ "Repeat",
      \ "Search",
      \ "SignColumn",
      \ "Special",
      \ "SpecialChar",
      \ "SpecialComment",
      \ "SpecialKey",
      \ "SpellBad ",
      \ "SpellBad",
      \ "SpellCap  ",
      \ "SpellCap",
      \ "SpellLocal ",
      \ "SpellRare",
      \ "Statement",
      \ "StatusLine",
      \ "StatusLineNC",
      \ "StatusLineTerm",
      \ "StatusLineTermNC",
      \ "StorageClass",
      \ "String",
      \ "Structure",
      \ "TabLine",
      \ "TabLineFill",
      \ "TabLineSel",
      \ "Tag",
      \ "Title",
      \ "Todo",
      \ "Type",
      \ "Typedef",
      \ "Underlined ",
      \ "Underlined",
      \ "VertSplit",
      \ "Visual",
      \ "VisualNOS",
      \ "WarningMsg",
      \ "WildMenu",
      \ "diffAdded",
      \ "diffFile",
      \ "diffLine",
      \ "diffRemoved",
      \ "htmlBold",
      \ "htmlItalic",
      \ "htmlTitle",
      \ "vimHiAttrib",
      \ "vimNumber",
      \ ]

let s:inverted_items = [
      \ "Cursor",
      \ "CursorIM",
      \ "CursorColunmn",
      \ "CursorLineNr",
      \ "Folded ",
      \ "IncSearch",
      \ "Search",
      \ "StatusLine",
      \ "TabLineSel",
      \ "Visual",
      \ ]

let s:sub_inverted_items = [
      \ "VertSplit",
      \ "StatusLineNC",
      \ "PmenuSel",
      \ ]

let s:special_items = [
      \ "CursorLine",
      \ "ColorColumn",
      \ ]

let s:error_items = [
      \ "SpellBad",
      \ "Error",
      \ ]

let s:constant_items = [
      \ "Boolean",
      \ "Characer",
      \ "Constant",
      \ "Float",
      \ "Number",
      \ "String",
      \]

let s:bold_items = [
      \ "Conditional",
      \ "Define",
      \ "Error",
      \ "Exception",
      \ "Include",
      \ "Keyword",
      \ "Label",
      \ "Macro",
      \ "MatchParen",
      \ "Operator",
      \ "PreCondit",
      \ "PreProc",
      \ "Repeat",
      \ "Statement",
      \ "StorageClass",
      \ "Structure",
      \ "Type",
      \ "Typedef",
      \ "diffFile",
      \ "htmlBold",
      \ "htmlTitle",
      \]

let s:italic_items = [
      \ "Comment",
      \]

let s:underline_items = [
      \ "TabLine",
      \ "TabLineFill",
      \ "TabLineSel",
      \]

call extend(s:underline_items, s:constant_items)
call extend(s:italic_items, ["String", "Remark"])

let s:style = &background

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other file sample contents:
"   " Gotcha: this filename must match the g:colors_name in the other file
"   let g:amberchome_passed_from_green = 1
"   runtime! colors/amberchrome.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:amberchome_passed_from_green = get(g:, 'amberchome_passed_from_green', v:false)

if g:amberchome_passed_from_green
  " [GREEN]
  let s:light = "#5fff5f" " main green light. alternatively, 70ff70
  let s:dark  = "#282828" " main green dark

  let s:clight =  "83" " options are 83 #5fff5f and 120 #87ff87
  let s:cdark  = "235" " actually #262626

  let g:colors_name="amberchrome-phosphorchrome" " Gotcha: must match green filename
else
  " [AMBER]
  let s:light = "#ffb700" " main amber light
  let s:dark  = "#282828" " main amber dark

  let s:clight = "214" " options are 214 #ffaf00 and 220 #ffd700
  let s:cdark  = "235" " actually #262626

  let g:colors_name="amberchrome" " Gotcha: must match this filename
endif

unlet g:amberchome_passed_from_green

if s:style == "dark"
  let s:fg=s:light
  let s:bg=s:dark

  let s:cfg = s:clight
  let s:cbg = s:cdark
  
  " in dark mode, color of nerdtree selector bar
  " let s:special="#1c1008"
  " i think this is eg :tabf autocomplete/autosuggest
  " let s:subbg="#c56306"
else
  let s:fg=s:dark
  let s:bg=s:light

  let s:cfg = s:cdark
  let s:cbg = s:clight

  " let s:special="#e58806"
  " let s:subbg="#9e5d07"
endif

hi clear Normal

highlight EndOfBuffer guifg=bg

for s:item in s:everything
  exec "hi " . s:item . " guifg=" . s:fg . " guibg=" . s:bg .
        \ " gui=none cterm=none term=none"
endfor

for s:item in s:inverted_items
  " "gui=reverse" prevents fun gui tricks later (TabLineSel underline)
  exec "hi " . s:item . " guifg=" . s:bg . " guibg=" . s:fg 
endfor

for s:item in s:sub_inverted_items
  " exec "hi " . s:item . " guifg=" . s:bg . " guibg=" . s:subbg 
  " "gui=reverse" prevents fun gui tricks later (TabLineSel underline)
  exec "hi " . s:item . " guifg=" . s:bg . " guibg=" . s:fg 
endfor

for s:item in s:special_items
  " exec "hi " . s:item . " guibg=" . s:special
  " "gui=reverse" prevents fun gui tricks later (TabLineSel underline)
  exec "hi " . s:item . " guifg=" . s:bg . " guibg=" . s:fg 
endfor

" Other: underdouble, underdotted, underdashed, strikethrough, nocombine, {combinations, eg `italic,underdouble` or `italic,bold`}

" Idea: A better way to do this is to get all the items then build keys=>values [item => gui] with comma separated values then go through once

for s:item in s:underline_items
  exec "hi ". s:item . " gui=underline"
endfor

for s:item in s:bold_items
  exec "hi ". s:item . " gui=bold"
endfor

for s:item in s:italic_items
  exec "hi ". s:item . " gui=italic"
endfor

for s:item in s:error_items
  exec "hi " . s:item . " gui=undercurl guisp=" . s:fg
endfor


scriptencoding utf-8

if exists('g:no_vim_fancy_text') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match rsFancyOperator "->" conceal cchar=
syntax match pyFancyOperator " \* " conceal cchar=∙
syntax match pyFancyOperator " / " conceal cchar=÷
syntax match rsFancyOperator "!=" conceal cchar=≠
syntax match rsFancyOperator "<=" conceal cchar=≤
syntax match rsFancyOperator ">=" conceal cchar=≥
syntax match rsFancyOperator "<<" conceal cchar=«
syntax match rsFancyOperator ">>" conceal cchar=»
syntax match rsFancyOperator "::" conceal cchar=∷
syntax match rsFancyOperator "=>" conceal cchar=
syntax match rsFancyOperator "||" conceal cchar=∥

hi! link rsFancyOperator Operator
hi! link Conceal Operator

setlocal conceallevel=1

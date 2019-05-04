let g:vimtex_view_method = 'skim'
" Set backup font in case the Awesome-fonts don't exist
if has("gui_running")
  if has("gui_gtk2")
    set guifont+=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont+=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont+=Consolas:h11:cANSI
  endif
endif

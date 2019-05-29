" Set backup font in case the Awesome-fonts don't exist
if has("gui_running")
  if has("gui_gtk2")
    set guifont+=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont+=Menlo\ Regular:h14
    let g:vimtex_view_method = 'skim'
  elseif has("gui_win32")
    set guifont+=Consolas:h11:cANSI
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
        \ . ' -inverse-search "gvim --servername ' . v:servername
        \ . ' --remote-send \"^<C-\^>^<C-n^>'
        \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
        \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
        \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
        \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
  endif
endif

augroup latexSurround
autocmd!
autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
let b:surround_{char2nr("e")}
\ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

 if exists('g:fvim_loaded')
     " good old 'set guifont' compatibility
 "    set guifont=Iosevka\ Slab:h16
     " Ctrl-ScrollWheel for zooming in/out
    " nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    " nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
   " nnoremap <A-CR> :FVimToggleFullScreen<CR>

" FVimCustomTitleBar v:false 


" FVimUIPopupMenu v:true 

" FVimUIMultiGrid v:true     " per-window grid system -- work in progress
" FVimUIPopupMenu v:false      " external popup menu
" FVimUITabLine v:false       " external tabline -- not implemented
" FVimUICmdLine v:false       " external cmdline -- not implemented
" FVimUIWildMenu v:false      " external wildmenu -- not implemented
" FVimUIMessages v:false      " external messages -- not implemented
" FVimUITermColors v:false    " not implemented
" FVimUIHlState v:false
endif


" set font for neovide
" set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h12


" nvim-qt settings
" ! suppresses warnings
Guifont! CaskaydiaCove Nerd Font Mono:h12
GuiPopupmenu 0
GuiTabline 0



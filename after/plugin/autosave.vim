let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification 
let g:auto_save_in_insert_mode = 0


" let g:auto_save_postsave_hook = 'call Resource()'

" 'if &ft=='vim' ? 'call AutoSaveToggle() | so ~/.config/nvim/init.vim' : '''

" function Resource()
" if (&ft=='vim')
" " call AutoSaveToggle()
"     autocmd! auto_save
"     so ~/.config/nvim/init.vim
"     echo "vim resourced"
"     endif
" " echo "post hook function run"
" endfunction

" jan 2020 workaround is to set interval only and long update time, so function is not in use at the same time
let g:auto_save_events = ["CursorHold"]

set updatetime=750
" auto save
" autocmd FileType vim autocmd BufWritePost <buffer> echo "hello12345"
" autocmd FileType lua autocmd BufWritePost <buffer> echo "hello12345"
" let g:auto_save_postsave_hook = 'Lua require("a").autosave()'

" manual auto source disabled for now
" auto save when saving any vim file
" augroup vimscript_source
"  au!
"   au BufWritePost,FileWritePost *.vim source <afile> | echo "nvim resourced22"
" augroup END

" function FautoSave()
" " unlet g:auto_save_loaded
" if (&ft=='lua')
"    so $MYVIMRC
"     " echo "vim resourced lua"
" endif

"   if (&ft=='vim')
"     so $MYVIMRC
"     " echo "vim resourced vim"
"     endif
"     return 1
" endfunction
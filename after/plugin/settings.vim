

command! PackerInstall packadd packer.nvim | lua require('plugins').install()
command! PackerUpdate packadd packer.nvim | lua require('plugins').update()
command! PackerSync packadd packer.nvim | lua require('plugins').sync()
command! PackerClean packadd packer.nvim | lua require('plugins').clean()
command! PackerCompile packadd packer.nvim | lua require('plugins').compile()

command! Pi packadd packer.nvim | lua require('plugins').install()
command! Pu packadd packer.nvim | lua require('plugins').update()
command! Psy packadd packer.nvim | lua require('plugins').sync()
command! Pclean packadd packer.nvim | lua require('plugins').clean()
command! Pcompile packadd packer.nvim | lua require('plugins').compile()
command! Pcomp packadd packer.nvim | lua require('plugins').compile()

set title
set titlestring=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}



colorscheme one-nvim



let g:float_preview#docked = 1

" cd to nvim config
cd C:\Users\F1\AppData\Local\nvim






let g:dap_virtual_text = 'all frames'

command! -nargs=0 Prettier :CocCommand prettier.formatFile



" set sessionoptions=blank,resize,winpos,winsize


" " FERN
let g:fern#renderer = "nerdfont"

" hidden files always on


"" reddit output pager into buffer
com -nargs=1 -complete=command Redir
      \ :execute "tabnew | pu=execute(\'" . <q-args> . "\') | setl nomodified" 
" let g:codi#interpreters = {
"       \  'lua': {
"       \ 'bin': 'lua',
"       \ },
"       \}

let g:codi#virtual_text = 1


let g:codi#virtual_text_prefix = " > "
highlight CodiVirtualText guifg=cyan
hi ColorColumn ctermbg=NONE 
                 hi VertSplit ctermbg=NONE 
                 hi NonText ctermfg=0 
                 "let g:codi#raw=1



"echo "CODI LOADED"

let g:codi#log = '/home/f1/.local/share/nvim/logs/codi.log'

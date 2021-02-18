" enables popup
" lua require'lspconfig'.sumneko_lua.setup{}


let g:completion_enable_snippet = 'UltiSnips'


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-Tab> pumvisible() ? "\<C-p>" : "\<C-Tab>"
inoremap <expr> <Esc> pumvisible() ? "\<C-o>". ":startinsert". "\<cr>" : "\<Esc>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" set completeopt-=preview



" let g:completion_sorting = "none"
" let g:completion_matching_ignore_case = 1
" let g:completion_enable_auto_hover = 1
" let g:completion_enable_auto_signature = 1
" let g:completion_timer_cycle = 80 "default value is 80
" let g:completion_trigger_character = []
" let g:completion_enable_auto_paren = 1
" let g:completion_trigger_keyword_length = 1
" let g:diagnostic_enable_virtual_text = 1

"primagean
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Avoid showing message extra message when using completion
" set shortmess+=c







" ultisnips

" lua require'lspconfig'.tsserver.setup { on_attach=require'completion'.on_attach}


let g:UltiSnipsExpandTrigger='<a-f>'
let g:UltiSnipsListSnippets='<a-g>'
let g:UltiSnipsJumpForwardTrigger='<c>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" set completion_matching_strategy



" using deoplete

" deoplete specific settings
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = 'C:\Python39\python.exe'



" float preview.nvim
" let g:float_preview#docked = 1


" nvim-lightbulb config
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" lsp saga config
lua << EOF

local saga = require 'lspsaga'
saga.init_lsp_saga()

-- saga.init_lsp_saga {
--   your custom option here
-- }
EOF
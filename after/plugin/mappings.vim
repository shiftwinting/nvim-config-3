
" map <A-> <cmd>echo "hello1"<cr>
" map <C-A-> <cmd>echo "hello2"<cr>



""" q- y main paine

" map <A->q <cmd>lua require("teleconfig").myFunc("/home/f1/a", "find_files")<cr>
" map! <A->q <cmd>lua require("teleconfig").myFunc("/home/f1/a", "find_files")<cr>

" map <A->w <cmd>lua require("teleconfig").myFunc("/home/f1/.dotfiles", "find_files")<cr>
" map! <A->w <cmd>lua require("teleconfig").myFunc("/home/f1/.dotfiles", "find_files")<cr>

" map <A->e <cmd>lua require("teleconfig").myFunc("/home/f1/.config/nvim", "find_files")<cr>
" map! <A->e <cmd>lua require("teleconfig").myFunc("/home/f1/.config/nvim", "find_files")<cr>

" map <A->r <cmd>lua require("teleconfig").myFunc("/home/f1/a", "live_grep")<cr>
" map! <A->r <cmd>lua require("teleconfig").myFunc("/home/f1/a", "live_grep")<cr>

" map <A->t <cmd>lua require("teleconfig").myFunc("/home/f1/.dotfiles", "live_grep")<cr>
" map! <A->t <cmd>lua require("teleconfig").myFunc("/home/f1/.dotfiles", "live_grep")<cr>

" map <A->y <cmd>lua require("teleconfig").myFunc("/home/f1/.config/nvim", "live_grep")<cr>
" map! <A->y <cmd>lua require("teleconfig").myFunc("/home/f1/.config/nvim", "live_grep")<cr>

" IGNORE
" map <silent> <A->s <cmd>lua require("teleconfig").myFunc("/home/f1/a", "find_dirs")<cr>
" map! <silent> <A->s <cmd>lua require("teleconfig").myFunc("/home/f1/a", "find_dirs")<cr>
" map <A->a <cmd>lua require'main'.run('fd')<cr>
" map! <A->a <cmd>lua require'main'.run('fd')<cr>


map <A->c <Plug>(Luadev-RunLine)


" change wildmenu command line hotkey to `
set wildchar=<Tab>
" :map ` :echo '123'<CR>



map <F14> <cmd>qa!<cr>
map! <F14> <cmd>qa!<cr>



" cut  copy paste undo nvim-qt

map <C-x> d
map! <C-x> <Esc>d
vnoremap <C-c> y

nnoremap <C-v> p
inoremap <C-v> <C-R>+
cnoremap <C-v> <C-R>+


map <C-z> u
map! <C-z> <Esc>p

" ctrl + v paste fvim




" manual save
map <c-s> <cmd>w<cr>
map! <c-s> <cmd>w<cr>


" close window
map <c-q> <cmd>q<cr>
map! <c-q> <cmd>q<cr>

" close buffer
map <c-w> <cmd>bdelete<cr>
map! <c-w> <cmd>bdelete<cr>


" auto resource if file ends in vim or lua
autocmd! BufWritePost * if count(['lua','lua.luapad','vim'],&filetype)
    \ | source $MYVIMRC
    \ | echo "auto resourced!!"
    \ | endif

" manual reload
map <A-p> <cmd>so $MYVIMRC <bar> echo 'manual resource!!'<cr> 
map! <A-p> <cmd>so $MYVIMRC <bar> echo 'manual resource!!'<cr>
" map <A-p> <cmd>so $MYVIMRC <bar> echo "auto resourced!!"<cr> 
" map! <A-p> <cmd>so $MYVIMRC <bar> echo "auto resourced!!"<cr>

map <A-m> <cmd>Messages<cr>
map! <A-m> <cmd>Messages<cr>


map! <F1> <Nop>
map! <F2> <Nop>
map! <F3> <Nop>
map! <F4> <Nop>

map! <F6> <Nop>
map! <F7> <Nop>
map! <F8> <Nop>
map! <F9> <Nop>
" map! <F10> <Nop>
" map! <A-> <Nop>
" map! <F12> <Nop> " left out because F12 is escape modifier

exe "set cedit=\<C-Y>"



" nnoremap <A->a <Esc> :!nvr --servername=/tmp/nv2 -c "lua require'main'.run('fd')" & xdotool search --name zsh2nd windowactivate<CR>
" xdotool search --name zsh2nd windowactivate & nvr --servername=/tmp/nv2 -c 'lua require('telescope.builtin').find_files()'



" bufferline
" These commands will navigate through buffers in order regardless of which
" mode you are using
" " e.g. if you change the order of buffers :bnext and :bprevious will not
" respect the custom ordering
 nnoremap <silent><A-Tab> :BufferLineCycleNext<CR>
 nnoremap <silent><A-q> :BufferLineCyclePrev<CR>
"
" " These commands will move the current buffer backwards or forwards in the
" bufferline
" nnoremap <silent><mymap> :BufferLineMoveNext<CR>
" nnoremap <silent><mymap> :BufferLineMovePrev<CR>


" coc-explorer
map <A-a>a <cmd>CocCommand explorer<cr>
map! <A-a>a <cmd>CocCommand explorer<cr>





" Lwin -> Command Line
" these ones have to be nnoremap
nnoremap : <Nop>
nnoremap <F15> :
inoremap <F15> <c-\><c-n> :
cnoremap <F15> <cr>


" NOT DONe
map <M-h> <Plug>(Luadev-RunLine)<CR>
nnoremap <Leader>f :Luadev<CR>


map <A-s>q <cmd>SClose<cr>
map! <A-s>q <cmd>SClose<cr>
map <A-s>d <cmd>SDelete<cr>
map! <A-s>d <cmd>SDelete<cr>
map <A-s>l <cmd>SLoad<cr>
map! <A-s>l <cmd>SLoad<cr>
map <A-s>o <cmd>SLoad<cr>
map! <A-s>o <cmd>SLoad<cr>
map <A-s>h <cmd>Startify<cr>
map! <A-s>h <cmd>Startify<cr>
map <A-s>s <cmd>SSave<cr>
map! <A-s>s <cmd>SSave<cr>

"nnoremap <A-> <C-w>w<CR>

map <c-/> <plug>NERDCommenterToggle


" snippets
"
map <A-i> <cmd>lua require'futil'.saveSnippet()<cr>
map! <A-i> <cmd>lua require'futil'.saveSnippet()<cr>
" map <A-o> <cmd>UltiSnipsEdit<cr>
"xmap <A-o>  <Plug>(coc-convert-snippet)
" xmap <A-u> <cmd>CocCommand snippets.editSnippets<cr>

" (coc-convert-snippet)
" map <A->x <Plug>(coc-convert-snippet)
" map! <A->x <Plug>(coc-convert-snippet)
map <A-y> <cmd>call Test()<cr>
map! <A-y> <cmd>call Test()<cr>
" show LspInfo
map <A-l> <cmd>LspInfo<cr>
map! <A-l> <cmd>LspInfo<cr>

" nvim-lspconfig github default config mappers converted from lua syntax

"nvim lsp-config actions that are in sagalsp
map <A-z>d <Cmd>lua vim.lsp.buf.declaration()<CR>
map <A-z>f <Cmd>lua vim.lsp.buf.definition()<CR>
map <A-z>h <Cmd>lua vim.lsp.buf.hover()<CR>
map <A-z>i <cmd>lua vim.lsp.buf.implementation()<CR>
map <A-z>s <cmd>lua vim.lsp.buf.signature_help()<CR>
map <A-z>a <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
map <A-z>r <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
map <A-z>l <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
map <A-z>t <cmd>lua vim.lsp.buf.type_definition()<CR>
map <A-z>y <cmd>lua vim.lsp.buf.rename()<CR>
map <A-z>r <cmd>lua vim.lsp.buf.references()<CR>
map <A-z>p <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
map <A-z>g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
map <A-z>h <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
map <A-z>p <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
map <A-z>c <cmd>lua vim.lsp.buf.code_action()<CR>

" nvim-lspconfig actions in sagalsp so not using


"lsp saga mappings

" this is definition and reference
nnoremap <silent><A-x>f <cmd>lua require('lspsaga.provider').lsp_finder()<CR>

nnoremap <silent><A-x>c <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><A-x>a <cmd>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent><A-x>k <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>


nnoremap <silent> <A-x>j <cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>
nnoremap <silent> <A-x>k <cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>

nnoremap <silent><A-x>h <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent><A-x>r <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent><A-x>d <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent><A-x>di <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent><A-x>p  <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent><A-x>n <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" nnoremap <silent><A-x>t <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> -- or open_float_terminal('lazygit')<CR>
" tnoremap <silent><A-x>t <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>


" NOT DONe
" from coc-snippets

" " Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" " Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)

map <A-h> <cmd>lua require('ultipreview').load_floating_contents()<cr>
map <A-j> <cmd>lua require('futil').snippetsList()<cr>

map <A-g> <cmd>call UltiSnips#ListSnippets()<cr>
map! <A-g> <cmd>call UltiSnips#ListSnippets()<cr>
" fern
map <A-f>f <cmd>Fern . -drawer<cr>
map! <A-f>f <cmd>Fern . -drawer<cr>
map <A-f>c <cmd>Fern C:\Users\F1\aacode\code-library -drawer<cr>
map! <A-f>c <cmd>Fern C:\Users\F1\aacode\code-library -drawer<cr>
map <A-f>v <cmd>Fern C:\Users\F1\AppData\Local\nvim-data\site\pack\packer -drawer<cr>
map! <A-f>v <cmd>Fern C:\Users\F1\AppData\Local\nvim-data\site\pack\packer -drawer<cr>

" autocmd Filetype fern 

" focus window 1 - 3
map <A-`> <cmd>call FocusFern()<cr>
map! <A-`> <cmd>call FocusFern()<cr>
map <A-1> <cmd>lua require("futil").focusWindow(1)<cr>
map! <A-1> <cmd>lua require("futil").focusWindow(1)<cr>
map <A-2> <cmd>lua require("futil").focusWindow(2)<cr>
map! <A-2> <cmd>lua require("futil").focusWindow(2)<cr>
map <A-3> <cmd>lua require("futil").focusWindow(3)<cr>
map! <A-3> <cmd>lua require("futil").focusWindow(3)<cr>

" basic telescope built ins to try



" map <A-a>a <cmd>call Test()<CR>
" map! <A-a>a <cmd>call Test()<CR>
" nmap <A-a>s <cmd>call FernTelescope("find_dirs")<CR>
" nmap <A-a>d <cmd>call FernTelescope("live_grep")<CR>

map <A-t> <cmd>lua require('telescope').extensions.packer.plugins(opts)<cr>


map <A-a>a <cmd>call Telescope("", "find_files")<cr>
map! <A-a>a <cmd>call Telescope("", "find_files")<cr>

" find_dirs
map <A-a>s <cmd>call Telescope("C:/Users/F1/aacode/code2", "find_dirs")<cr>
map! <A-a>s <cmd>call Telescope("C:/Users/F1/aacode/code2", "find_dirs")<cr>

map <A-a>c <cmd>call Telescope("C:/Users/F1/aacode/code2/code-library", "find_dirs")<cr>
map! <A-a>c <cmd>call Telescope("C:/Users/F1/aacode/code2/code-library", "find_dirs")<cr>


map <A-a>d <cmd>call Telescope("", "live_grep")<cr>
map! <A-a>d <cmd>call Telescope("", "live_grep")<cr>

"  " defaults im using
map <A-a>k <cmd>lua require('telescope.builtin').keymaps()<cr>
map! <A-a>k <cmd>lua require('telescope.builtin').keymaps()<cr>
map <A-a>m <cmd>lua require('telescope.builtin').man_pages()<cr>
map! <A-a>m <cmd>lua require('telescope.builtin').man_pages()<cr>
map <A-a>q <cmd>lua require('telescope.builtin').buffers()<cr>
map! <A-a>q <cmd>lua require('telescope.builtin').buffers()<cr>
map <A-a>e <cmd>lua require('telescope.builtin').grep_string()<cr>
map! <A-a>e <cmd>lua require('telescope.builtin').grep_string()<cr>

map <A-a>g <cmd>lua require('telescope.builtin').builtin()<cr>
map! <A-a>g <cmd>lua require('telescope.builtin').builtin()<cr>


map <A-a>e <cmd>lua require('telescope.builtin').registers()<cr>
map! <A-a>e <cmd>lua require('telescope.builtin').registers()<cr>

map <A-a>r <cmd>lua require('telescope.builtin').oldfiles()<cr>
map! <A-a>r <cmd>lua require('telescope.builtin').oldfiles()<cr>

map <A-a>v <cmd>lua require('telescope.builtin').commands()<cr>
map! <A-a>v <cmd>lua require('telescope.builtin').commands()<cr>














" old converted to my func


" map <A-w> <cmd>lua require('telescope.builtin').find_files()<cr>
" map! <A-w> <cmd>lua require('telescope.builtin').find_files()<cr>

" map <A-r> <cmd>lua require('telescope.builtin').live_grep()<cr>
" map! <A-r> <cmd>lua require('telescope.builtin').live_grep()<cr>

" old not using these - using builtin





" map <A->a <cmd>lua require('telescope.builtin').tags()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').tags()<cr>

" map <A->a <cmd>lua require('telescope.builtin').command_history()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').command_history()<cr>

" map <A->a <cmd>lua require('telescope.builtin').help_tags()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').help_tags()<cr>

" map <A->a <cmd>lua require('telescope.builtin').marks()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').marks()<cr>

" map <A->a <cmd>lua require('telescope.builtin').colorscheme()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').colorscheme()<cr>

" map <A->a <cmd>lua require('telescope.builtin').quickfix()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').quickfix()<cr>

" map <A->a <cmd>lua require('telescope.builtin').loclist()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').loclist()<cr>

" map <A->a <cmd>lua require('telescope.builtin').vim_options()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').vim_options()<cr>



" map <A->a <cmd>lua require('telescope.builtin').autocommands()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').autocommands()<cr>

" map <A->a <cmd>lua require('telescope.builtin').spell_suggest()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').spell_suggest()<cr>

" map <A->a <cmd>lua require('telescope.builtin').filetypes()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').filetypes()<cr>

" map <A->a <cmd>lua require('telescope.builtin').highlights()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').highlights()<cr>

" map <A->a <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

" map <A->a <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>
" map! <A->a <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>

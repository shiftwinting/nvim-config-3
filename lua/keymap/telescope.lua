local api = vim.api
-- telescope mappings
api.nvim_set_keymap('', '<A-a>t', [[<cmd>lua require('telescope').extensions.packer.plugins(opts)<cr>]], {})
api.nvim_set_keymap('!', '<A-a>t', [[<cmd>lua require('telescope').extensions.packer.plugins(opts)<cr>]], {})


api.nvim_set_keymap('', '<A-a>f', [[<cmd>lua require'omnimenu'.show_telescope()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>f', [[<cmd>lua require'omnimenu'.show_telescope()<<cr>]], {})
-- omnimenu save visual selection
-- api.nvim_set_keymap('', '<A-,>m', [[<cmd>lua require'omnimenu'.save_to_config()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-,>m', [[<cmd>lua require'omnimenu'.save_to_config()<cr>]], {})



-- =========== current files test start here
-- testing better find_files
api.nvim_set_keymap('', '<A-a>2', [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>2', [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]], {})


api.nvim_set_keymap('', '<A-a>1', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>1', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})




--============ current files test end here

-- disabled this added my own func
--api.nvim_set_keymap('', '<A-a>a', [[<cmd>call Telescope("", "find_files")<cr>]], {})
--api.nvim_set_keymap('!', '<A-a>a', [[<cmd>call Telescope("", "find_files")<cr>]], {})

api.nvim_set_keymap('', '<A-a>a', [[<cmd>lua require'plugin/teleconfig'.myFunc("]] .. vim.fn.getcwd() .. [[", "find_files")<cr>]], {})
api.nvim_set_keymap('!', '<A-a>a', [[<cmd>lua require'plugin/teleconfig'.myFunc("]] .. vim.fn.getcwd() .. [[", "find_files")<cr>]], {})

api.nvim_set_keymap('', '<A-a>c', [[<cmd>lua require'plugin/teleconfig'.myFunc("~/code-library/cl", "find_files")<cr>]], {})
api.nvim_set_keymap('!', '<A-a>c', [[<cmd>lua require'plugin/teleconfig'.myFunc("~/code-library/cl", "find_files")<cr>]], {})

api.nvim_set_keymap('', '<A-a>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("~/.dotfiles", "find_files")<cr>]], {})
api.nvim_set_keymap('!', '<A-a>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("~/.dotfiles", "find_files")<cr>]], {})


api.nvim_set_keymap('', '<A-a>v', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.local/share/nvim/site/pack/packer/opt", "find_files")<cr>]], {})
api.nvim_set_keymap('!', '<A-a>v', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.local/share/nvim/site/pack/packer/opt", "find_files")<cr>]], {})


api.nvim_set_keymap('', '<A-a>b', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.config/nvim/plugins-manual", "find_files")<cr>]], {})
api.nvim_set_keymap('', '<A-a>b', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.config/nvim/plugins-manual", "find_files")<cr>]], {})
api.nvim_set_keymap('', '<A-a>n', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.config/nvim/plugins-me", "find_files")<cr>]], {})
api.nvim_set_keymap('', '<A-a>n', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.config/nvim/plugins-me", "find_files")<cr>]], {})


api.nvim_set_keymap('', '<A-a>s', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "find_dirs")<cr>]], {})
api.nvim_set_keymap('!', '<A-a>s', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "find_dirs")<cr>]], {})



api.nvim_set_keymap('', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.dotfiles", "live_grep")<cr>]], {})
api.nvim_set_keymap('!', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("/home/f1/.dotfiles", "live_grep")<cr>]], {})

api.nvim_set_keymap('', '<A-d>a', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})
api.nvim_set_keymap('!', '<A-d>a', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})

-- api.nvim_set_keymap('', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})
-- api.nvim_set_keymap('!', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})

-- api.nvim_set_keymap('', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})
-- api.nvim_set_keymap('!', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})

-- api.nvim_set_keymap('', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})
-- api.nvim_set_keymap('!', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})

-- api.nvim_set_keymap('', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})
-- api.nvim_set_keymap('!', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})

-- api.nvim_set_keymap('', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})
-- api.nvim_set_keymap('!', '<A-d>d', [[<cmd>lua require'plugin/teleconfig'.myFunc("", "live_grep")<cr>]], {})


api.nvim_set_keymap('', '<A-z>z', [[<cmd>lua require'futil/send_to_old'.send_visual()<cr>]], {})
api.nvim_set_keymap('!', '<A-z>z', [[<cmd>lua require'futil/send_to_old'.send_visual()<cr>]], {})






-- defaults im using---
api.nvim_set_keymap('', '<A-a>k', [[<cmd>lua require('telescope.builtin').keymaps()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>k', [[<cmd>lua require('telescope.builtin').keymaps()<cr>]], {})
api.nvim_set_keymap('', '<A-a>m', [[<cmd>lua require('telescope.builtin').man_pages()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>m', [[<cmd>lua require('telescope.builtin').man_pages()<cr>]], {})
api.nvim_set_keymap('', '<A-a>q', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>q', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
api.nvim_set_keymap('', '<A-a>e', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>e', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], {})
api.nvim_set_keymap('', '<A-a>g', [[<cmd>lua require('telescope.builtin').builtin()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>g', [[<cmd>lua require('telescope.builtin').builtin()<cr>]], {})
api.nvim_set_keymap('', '<A-a>o', [[<cmd>lua require('telescope.builtin').registers()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>o', [[<cmd>lua require('telescope.builtin').registers()<cr>]], {})
api.nvim_set_keymap('', '<A-a>r', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>r', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], {})
api.nvim_set_keymap('', '<A-a>v', [[<cmd>lua require('telescope.builtin').commands()<cr>]], {})
api.nvim_set_keymap('!', '<A-a>v', [[<cmd>lua require('telescope.builtin').commands()<cr>]], {})


api.nvim_set_keymap('', '<A-a>l', [[<cmd>lua require'telescope'.extensions.ultisnips.ultisnips{}<cr>]], {})
api.nvim_set_keymap('!', '<A-a>l', [[<cmd>lua require'telescope'.extensions.ultisnips.ultisnips{}<cr>]], {})



-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').tags()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').tags()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').command_history()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').command_history()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').marks()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').marks()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').loclist()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').loclist()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').vim_options()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').vim_options()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').autocommands()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').autocommands()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').spell_suggest()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').spell_suggest()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').filetypes()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').filetypes()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').highlights()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').highlights()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], {})
-- api.nvim_set_keymap('', '<A-a>', [[<cmd>lua require('telescope.builtin').current_buffer_tags()<cr>]], {})
-- api.nvim_set_keymap('!', '<A-a>', [[<cmd>lua require('telescope.builtin').current_buffer_tags()<cr>]], {})

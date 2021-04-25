local api = vim.api

api.nvim_set_keymap('', '<A-f>f', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', ']] .. vim.fn.getcwd() .. [[')<cr>]], {})
api.nvim_set_keymap('!', '<A-f>f', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', ']] .. vim.fn.getcwd() .. [[')<cr>]], {})


api.nvim_set_keymap('', '<a-f>c', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/code-library/AA')<cr>]], {})
api.nvim_set_keymap('!', '<a-f>c', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/code-library/AA')<cr>]], {})

api.nvim_set_keymap('', '<a-f>d', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.dotfiles')<cr>]], {})
api.nvim_set_keymap('!', '<a-f>d', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.dotfiles')<cr>]], {})

api.nvim_set_keymap('', '<a-f>v', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.local/share/nvim/site/pack/packer/opt')<cr>]], {})
api.nvim_set_keymap('!', '<a-f>v', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.local/share/nvim/site/pack/packer/opt')<cr>]], {})

api.nvim_set_keymap('', '<a-f>b', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.config/nvim/plugins-manual')<cr>]], {})
api.nvim_set_keymap('!', '<a-f>b', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.config/nvim/plugins-manual')<cr>]], {})

api.nvim_set_keymap('', '<a-f>n', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.config/nvim/plugins-me')<cr>]], {})
api.nvim_set_keymap('!', '<a-f>n', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.config/nvim/plugins-me')<cr>]], {})


api.nvim_set_keymap('', '<a-f>z', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.zplug/repos')<cr>]], {})
api.nvim_set_keymap('!', '<a-f>z', [[<cmd>lua require'nvim-tree'.on_keypress('cdtree', '/home/f1/.zplug/repos')<cr>]], {})







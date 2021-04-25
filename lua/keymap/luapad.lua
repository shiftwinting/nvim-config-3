local api = vim.api
local log1 = require "log1"
-- api.nvim_set_keymap("", "<A-r>s", [[<cmd>lua require'keymap/luapad'.start_luapad_noeval()<cr>]], {})
-- api.nvim_set_keymap("!", "<A-r>s", [[<cmd>lua require'keymap/luapad'.start_luapad_noeval()<cr>]], {})

-- luafile %
api.nvim_set_keymap("", "<A-r>a", [[<cmd>luafile %<cr>]], {})
api.nvim_set_keymap("!", "<A-r>a", [[<cmd>luafile %<cr>]], {})


-- attaches luapad to current buffer, and if already attached, runs it
api.nvim_set_keymap("", "<A-r>r", [[<cmd>lua require'plugin/luapad'.manual_eval()<cr>]], {})
api.nvim_set_keymap("!", "<A-r>r", [[<cmd>lua require'plugin/luapad'.manual_eval()<cr>]], {})

-- toggle editor eval on change true false
api.nvim_set_keymap("", "<A-r>t", [[<cmd>lua require'plugin/luapad'.toggle_eval_on_change()<cr>]], {})
api.nvim_set_keymap("!", "<A-r>t", [[<cmd>lua require'plugin/luapad'.toggle_eval_on_change()<cr>]], {})



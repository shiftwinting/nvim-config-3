local actions = require('telescope.actions')

-- require('telescope').setup{
--   defaults = {
--     vimgrep_arguments = {
--       'rg',
--       '--color=never',
--       '--no-heading',
--       '--with-filename',
--       '--line-number',
--       '--column',
--       '--smart-case'
--     },
--     prompt_position = "bottom",
--     prompt_prefix = ">",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "descending",
--     layout_strategy = "horizontal",
--     layout_defaults = {
--         preview_width = 0.8,
--       -- TODO add builtin options.
--     },
--     file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--     file_ignore_patterns = {},
--     generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--     shorten_path = true,
--     winblend = 0,
--     width = 0.2,
--     preview_cutoff = 40,
--      results_height = 0.4,
--     results_width = 0.5,
--        border = {},
--     borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
--     color_devicons = true,
--     use_less = true,
--     set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
--     file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
--     grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
--     qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

--     mappings = {
--       i = {
--          ["<esc>"] = actions.close,
--         ["<c-s"] = actions.move_selection_next,
--         ["<c-w>"] = actions.move_selection_previous,
--           -- ["<CR>"] = actions.goto_file_selection_edit,
--       },
--   },
--   }
-- }


--  require('telescope').setup{
--     defaults = {
--      results_width = 0.1,
--      layout_strategy = 'horizontal',
--    --  results_height = 44,
--    --  height = 44
--  },
--  extensions = {
--     frecency = {
--       show_scores = true,
--       show_unindexed = true,
--       ignore_patterns = {"*.git/*", "*/tmp/*"},
--       workspaces = {
--         ["conf"]    = "/home/f1/.config",
--         ["data"]    = "/home/f1/.local/nvim"
--       }
--     },
-- fzy_native = {
--             override_generic_sorter = true,
--             override_file_sorter = true,
--         }
--   },
--  }



-- Built-in actions
-- local transform_mod = require('telescope.actions.mt').transform_mod

-- -- or create your custom action
-- local my_cool_custom_action = transform_mod({
--   x = function()
--     print("This function ran after another action. Prompt_bufnr: " .. prompt_bufnr)
--     -- Enter your function logic here. You can take inspiration from lua/telescope/actions.lua
--   end,
-- })




require('telescope').load_extension('fzy_native')
--require('telescope').load_extension('snippets')
require'telescope'.load_extension("cheat")
--require('telescope').load_extension('ultisnips')
require('telescope').load_extension('livetablelogger')
--require('telescope').load_extension('frecency')



local M = {}

function M.modify_window(win_opts, window)
 -- l('========= START MODIFY ========')
 -- local line_count = vim.o.lines - vim.o.cmdheight
 --  if vim.o.laststatus ~= 0 then
 --    line_count = line_count - 1
 --  end

local x = 7
local x = vim.o.lines - x
local height = 40

  if window == 'Results' then
  --  win_opts = {}
 --   win_opts['relative'] = 'editor'
 win_opts['height'] = height
 win_opts['row'] = x
win_opts['anchor'] = 'SW'
--win_opts['width'] = 50
--win_opts['col'] = 20
--win_opts['bufpos'] = {100,20}
elseif window == 'Preview' then
 -- win_opts['height'] = math.ceil(vim.o.lines / 3 - 5)
 -- win_opts['row'] = math.ceil(vim.o.lines - vim.o.lines / 3)
 win_opts['height'] = height + 3
 win_opts['row'] = x + 3
 win_opts['anchor'] = 'SW'
else
win_opts['row'] = x + 3
win_opts['height'] = 1
 win_opts['anchor'] = 'SW'

end



--l(window)
--l(win_opts)



return win_opts

end

-- function M.onTelescopePrompt()
-- lo('telescope trig')
-- lo(vim.api.nvim_list_wins())
--    for _, winnr in pairs(vim.api.nvim_list_wins()) do
--       local bufnr = vim.fn.winbufnr(winnr)
--       local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
-- lo(filetype)
-- if filetype == 'TelescopePrompt' then
--   lo('trigerred')
--   vim.api.nvim_win_set_config(winnr, {

-- --relative='editor', width = 12, height = 3, row = 1, col = 1
--  relative='win', width=12, height=3, bufpos={100,10}

--   })



-- end

--     end

-- end

return M

local log1 = require 'log1'
local po = require 'futil/printoutput'

require'luapad'.config {
  preview = false,
  eval_on_move = false,
  eval_on_change = false
  -- important, sets the default for auto luapad attach
  -- f: disabled, doing it in global config as this context is only active when luapad is attached to buffer
  -- context = {
  --     l = function(input) log1.info(input) end,
  --     p = function(input) print(vim.inspect(input)) end,
  --     po = function(input) po.print(input) end,
  --     }
}
--fstate.luapad.editor_eval_on_change = false
--fstate.luapad.btmwindow_eval_on_change = true
--vim.g.eval_on_change = false

local M = {}

local luapad = require("luapad")
local api = vim.api
local print_output_path = vim.fn.stdpath('data') .. '/logs/.printoutput/printoutput.lua'
local print_refresh_path = vim.fn.stdpath('data') .. '/logs/.printoutput/printrefresh.lua'
local luapad_status = require("luapad/statusline").status()

-- manual attach
-- api.nvim_set_keymap("", "<A-r>a", [[<cmd>lua require'luapad'.attach()<cr>]], {})
-- api.nvim_set_keymap("!", "<A-r>a", [[<cmd>lua require'luapad'.attach()<cr>]], {})
-------------------------------

function M.toggle_editor_eval_on_change()
  if fstate.btmwindow_exists == false then
    if fstate.luapad.editor_eval_on_change == true then
      -- log1.info('eval_on_change trigerred to false')
      fstate.luapad.editor_eval_on_change = false
      luapad.config {eval_on_change = false}
    elseif fstate.luapad.editor_eval_on_change == false then
      fstate.luapad.editor_eval_on_change = true
      luapad.config {eval_on_change = true}
      -- log1.info('eval_on_change trigerred to true')
    end
  elseif fstate.btmwindow_exists == true then
    if fstate.luapad.btmwindow_eval_on_change == true then
      -- log1.info('eval_on_change trigerred to false')
      fstate.luapad.btmwindow_eval_on_change = false
      luapad.config {eval_on_change = false}
    elseif fstate.luapad.btmwindow_eval_on_change == false then

      fstate.luapad.btmwindow_eval_on_change = true
      luapad.config {eval_on_change = true}
      -- log1.info('eval_on_change trigerred to true')
    end
  end
end








function M.eval_in_current_buffer() end








-- function M.toggle_btmwindow_eval_on_change()
--  if fstate.luapad.btmwindow_eval_on_change ~= nil then

-- end

-- end

function M.manual_eval()
  -- clear log first
  local printoutput = require 'futil/printoutput'

  local fp3 = io.open(print_output_path, "w")

  fp3:write('-----------------------------\n')
  fp3:close()

  require'futil/printoutput'.open_or_refresh_window(print_output_path)

  -- log1.info(luapad_status)
  if luapad_status ~= 'ok' then
    --    log1.info('ATTACH TRIGERRED')
    luapad.config {eval_on_change = false}

    luapad.attach()

    if luapad_status ~= 'ok' then print('FAILED TO ATTACH LUAPAD - CHECK SYNTAX ERRRORS') end

  else
    log1.info('EVAL TIGERRED')

    local luapad = require"luapad/state".current()
    luapad:eval()

  end
end








-- function M.start_luapad_noeval()
--   luapad.config {eval_on_change = false}
--   luapad.attach()
-- end

-- f: problem: when opening btmwindow for the 1st time. this gets run before it, so it doesnt set changeback to true for luapad. so have to add a trigger to btmwin too
function M.onWinEnter()

  -- local btmwindow = pcall(nvim_win_get_var, 0, 'btmwindow')

  --    log1.info('onbufenter1 trig')
  --    log1.info(fstate.btmwindow_exists)
  --     log1.info(vim.g.eval_on_change)
  --     if fstate.btmwindow_exists == true then
  --         if vim.g.eval_on_change == false then
  --             vim.g.luapad_changeback = true
  --             luapad.config{ eval_on_change = true }

  --         end
  --     end

  if fstate.btmwindow_exists == true then
    luapad.config {eval_on_change = fstate.luapad.btmwindow_eval_on_change}
  elseif fstate.btmwindow_exists == false then
    lo('at luapad.lua 142')
    lo(fstate)
    luapad.config {eval_on_change = fstate.luapad.editor_eval_on_change}
  end

end








function M.onBufEnter()
  -- log1.info('bufenter trig')
  -- log1.info(vim.b.btmwindow)
  -- log1.info(vim.bo.filetype)
  --  log1.info(luapad_status)
  --   log1.info(require('luapad/statusline').status())
  -- AUTO ATTACH TO LUA FILES - COMMENT TO NOT AUTO ATTACH

  local bufpath = vim.api.nvim_buf_get_name(0)

  -- if
  --   fstate.btmwindow_exists == nil and vim.bo.filetype == "lua" and luapad_status ~= "ok" and
  --     bufpath:match("/printoutput[^.]*.lua") == nil
  --  then
  --  -- luapad.attach()
  -- end
end








function M.onWinLeave()
  --  log1.info("onwinleave trig")
  --  log1.info(fstate.btmwindow_exists)
  -- log1.info(vim.g.luapad_changeback)
  -- target of this autocmd is btmwindow
  -- if fstate.btmwindow_exists == true then
  -- if vim.g.luapad_changeback == true then

  -- luapad.config{ eval_on_change = false}
  --            log1.info('did this trig')
  --    end
  -- end

  -- if fstate.btmwindow_exists == true then
  -- l('CHANGED TO VIM.G.EDITOR')
  --   luapad.config {eval_on_change = fstate.luapad.editor_eval_on_change}
  -- elseif fstate.btmwindow_exists == nil then
  -- l('CHANGED TO VIM.G.BTMWINDOW')
  -- luapad.config {eval_on_change = fstate.luapad.btmwindow_eval_on_change}
  --   end

end








return M

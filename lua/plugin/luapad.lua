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


local M = {}

local luapad = require("luapad")
local api = vim.api
local print_output_path = vim.fn.stdpath('data') .. '/logs/.printoutput/printoutput.lua'
local print_refresh_path = vim.fn.stdpath('data') .. '/logs/.printoutput/printrefresh.lua'


-------------------------------


local function toggle_editor_eval_on_change()
 if fstate.luapad.editor_eval_on_change == true then
      -- log1.info('eval_on_change trigerred to false')
      fstate.luapad.editor_eval_on_change = false
   --   fstate.luapad.galaxyline_eval_on_change = false
      luapad.config {eval_on_change = false}
    elseif fstate.luapad.editor_eval_on_change == false then
      fstate.luapad.editor_eval_on_change = true
   --   fstate.luapad.galaxyline_eval_on_change = true
      luapad.config {eval_on_change = true}
      -- log1.info('eval_on_change trigerred to true')
    end

end


local function toggle_btmwindow_eval_on_change()
 if fstate.luapad.btmwindow_eval_on_change == true then
          fstate.luapad.btmwindow_eval_on_change = false
      --    fstate.luapad.galaxyline_eval_on_change = false
      luapad.config {eval_on_change = false}
    elseif fstate.luapad.btmwindow_eval_on_change == false then
      fstate.luapad.btmwindow_eval_on_change = true
   --   fstate.luapad.galaxyline_eval_on_change = true
      luapad.config {eval_on_change = true}
        end

end


function M.toggle_eval_on_change()
local current_winnr = vim.api.nvim_get_current_win()

if fstate.btmwindow_exists == true then
  if current_winnr == fstate.btmwindow.luapad.winnr then
    toggle_btmwindow_eval_on_change()
     else 
    toggle_editor_eval_on_change()
     end
  else
  toggle_editor_eval_on_change()
     end
 --    lo('state after manual toggle:')
 --    lo(fstate.luapad)
end



function M.all_luapad_bufnr()
local all_luapad_bufnr = {}
for k, v in pairs(State.instances) do 
table.insert(all_luapad_bufnr, tonumber(k))
end
--lo(all_luapad_bufnr)
return all_luapad_bufnr
end


function M.save_all_luapad_filenames_to_fstate()
fstate.luapad.filenames = {}
for k, _ in pairs(State.instances) do table.insert(fstate.luapad.filenames, vim.api.nvim_buf_get_name(k)) end
end

-- function M.eval_in_current_buffer() end

function M.manual_eval()
--local luapad_status = require("luapad/statusline").status()

  -- clear log first
  -- local printoutput = require 'futil/printoutput'
  -- local fp3 = io.open(print_output_path, "w")
  -- fp3:write('-----------------------------\n')
  -- fp3:close()
  -- require'futil/printoutput'.open_or_refresh_window(print_output_path)




  if require'luapad/statusline'.status() ~= 'ok' then
     luapad.config {eval_on_change = false}
    luapad.attach()
   -- if require'luapad/statusline'.status() ~= 'ok' then print('FAILED TO ATTACH LUAPAD - CHECK SYNTAX ERRRORS') end
M.save_all_luapad_filenames_to_fstate()
   else


    local luapad = require"luapad/state".current()
    luapad:eval()

  end
end





-- local function isLuapad()

-- end


-- f: problem: when opening btmwindow for the 1st time. this gets run before it, so it doesnt set changeback to true for luapad. so have to add a trigger to btmwin too
function M.onWinEnter()
vim.defer_fn(function() -- have to defer_fn so it can detect btmwindow exist on first open
local current_winnr = vim.api.nvim_get_current_win()

 -- luapad switch eval depending on btmwindow or editor
  if fstate.btmwindow_exists == true then
    if current_winnr == fstate.btmwindow.luapad.winnr then
  --    lo('luapad config changed to luapad btmwindow')
    luapad.config {eval_on_change = fstate.luapad.btmwindow_eval_on_change}
  else
--lo('luapad config changes to editor')
     luapad.config {eval_on_change = fstate.luapad.editor_eval_on_change}
  end
  elseif fstate.btmwindow_exists == false then
--lo('luapad config changes to editor')

    luapad.config {eval_on_change = fstate.luapad.editor_eval_on_change}
  end
--lo('state after luapad onWinEnter')
--lo(fstate.luapad)
-- update fstate luapad array
M.save_all_luapad_filenames_to_fstate()
end, 50)

end

return M

















-- old





--fstate.luapad.editor_eval_on_change = false
--fstate.luapad.btmwindow_eval_on_change = true
--vim.g.eval_on_change = false

-- manual attach
-- api.nvim_set_keymap("", "<A-r>a", [[<cmd>lua require'luapad'.attach()<cr>]], {})
-- api.nvim_set_keymap("!", "<A-r>a", [[<cmd>lua require'luapad'.attach()<cr>]], {})


-- function M.toggle_btmwindow_eval_on_change()
--  if fstate.luapad.btmwindow_eval_on_change ~= nil then

-- end

-- end



-- function M.start_luapad_noeval()
--   luapad.config {eval_on_change = false}
--   luapad.attach()
-- end



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


-- function M.onBufEnter()
--  local bufpath = vim.api.nvim_buf_get_name(0)


-- end




  -- log1.info('bufenter trig')
  -- log1.info(vim.b.btmwindow)
  -- log1.info(vim.bo.filetype)
  --  log1.info(luapad_status)
  --   log1.info(require('luapad/statusline').status())
  -- AUTO ATTACH TO LUA FILES - COMMENT TO NOT AUTO ATTACH


  -- if
  --   fstate.btmwindow_exists == nil and vim.bo.filetype == "lua" and luapad_status ~= "ok" and
  --     bufpath:match("/printoutput[^.]*.lua") == nil
  --  then
  --  -- luapad.attach()
  -- end


-- function M.onWinLeave()
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

-- end

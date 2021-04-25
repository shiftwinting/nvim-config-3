-- f: everything here related to window tracking without nvim tree sidebar
-- and opening up
local M = {}
local log1 = require 'log1'


function M.flatten(table)
  for k, v in ipairs(table) do table = v end
  return table
end

-- scan all windows, add all to either included or excluded
function M.onBufLeave() end

-- this works to fix telescope getting adding to included because:
-- WinClosed -- after telescope window has shut
-- WinNew -- doesnt get triggered on telescope popup window open (dont know why)
function M.onWinNewClosed()

  -- might not need defer_fn but leaving it there anyway
  vim.defer_fn(function()
    -- lo('=========== NEW RUN =============')

    -- l('bufenter trig')
    fstate.window.included = {}
    fstate.window.excluded = {}

    local allWindows = vim.api.nvim_list_wins()

    -- lo(allWindows)

    for _, winnr in pairs(allWindows) do
      local bufnr = vim.fn.winbufnr(winnr)
      local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

  
      local include = false
  
      if filetype ~= 'fern' and filetype ~= 'NvimTree' and filetype ~= 'vista_kind' and filetype ~= 'TelescopePrompt' and winnr ~= fstate.btmwindow.luapad.winnr and winnr ~= fstate.btmwindow.fterminal.winnr and winnr ~= fstate.btmwindow.quickfix.winnr then
        --  lo('exclude trigerred')
        include = true
      end

      if include == false then
      --   lo('added to excluded:' .. winnr)
        table.insert(fstate.window.excluded, winnr)
      elseif include == true then

     --    lo('added to included: ' .. winnr)
        table.insert(fstate.window.included, winnr)
      end

    end -- end for loop

   end, 200)
end

function M.onWinEnter()

 -- vim.defer_fn(function()
    -- current winnr last winnr BELOW HERE
    -- set current/last
    local current_winnr = vim.api.nvim_get_current_win()


    -- iterate through excluded array. if exists, return
    -- local exclude = false
  --  lo(State.window.excluded)
--  lo('window onwinenter')
--  lo(State)
    if fstate.window.excluded ~= nil then
    for _, excluded_winnr in ipairs(fstate.window.excluded) do if current_winnr == excluded_winnr then return end end
  end


  if fstate.window.included ~= nil then
    for _, included_winnr in ipairs(fstate.window.included) do
      if current_winnr == included_winnr then
        fstate.window.current_winnr = current_winnr
        return
      end
    end
  end


--  end, 250)
end

function M.onVimEnter()
 -- lo('window vimenter')
 -- lo(fstate)
--  print(fstate.window)
--vim.cmd([[e /home/f1/.config/nvim/lua/asd6.lua]])
vim.cmd([[e /home/f1/.config/nvim/plugins-me/livetablelogger.nvim/lua/tests/window-config.lua]])

if fstate.window.current_winnr == nil then fstate.window.current_winnr = 1000 end

end

function M.focusWindow(index)
  -- print(vim.inspect(vim.api.nvim_list_wins(index)))
  -- local windowHandle = getWindowHandle(index)
  local allWindows = M.findWindows()
  --  print(vim.inspect(vim.g.windowArray))
  vim.api.nvim_set_current_win(allWindows[index])
end

-- mar 2021 this is keymapped to ctrl+q
--function M.close_current_buf()
--end


return M

--- old

  --lo('analyze windows')
 -- local btmstate = require'futil/btmwindow'.btmstate
 -- local btmstate_exists = require'futil/btmwindow'.btmstate_exists
    -- local btmwindow
      --       if pcall(vim.api.nvim_buf_get_var, bufnr, 'btmwindow') == true then
      --          btmwindow = vim.api.nvim_buf_get_var(bufnr, 'btmwindow')
      --    end

      -- for _, v in pairs(btmstate) do

      -- end

      -- lo('WINNR BEING CHECKED IN LOOP: ' .. winnr)
      --    lo('filetype is: ' .. filetype)

      --    lo(btmwindow)
      --  lo(btmstate_exists)

      --         local wininfo = M.flatten(vim.api.nvim_eval([[getwininfo(]] .. winnr .. [[)]]))
      -- local buflisted = vim.api.nvim_eval([[buflisted(]] .. bufnr .. [[)]])
   -- if filetype ~= 'fern' and filetype ~= 'NvimTree' and filetype ~= 'TelescopePrompt' then
      --         include = true
      --          end



    --     for i, winnr in ipairs(M.State.included) do
    --         if current_winnr == winnr then

    --         if M.State.last_winnr ~= M.State.current_winnr then
    --         M.State.last_winnr = vim.deepcopy(M.State.current_winnr)
    --         M.State.last_winnr = vim.deepcopy(M.State.current_winnr)
    --         end

    --         M.State.current_winnr = i
    --                     M.State.current_winnr = vim.deepcopy(current_winnr)
    --     end
    -- end


  -- if exclude == false then
    -- M.State.current_winnr = current_winnr
    -- return
    -- end


  -- table.insert(M.State.included, vim.api.nvim_get_current_win())
  -- M.State.current_winnr = vim.api.nvim_get_current_win()
  -- l(M.State)

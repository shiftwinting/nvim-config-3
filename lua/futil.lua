local log1 = require('log1')
local M = {}


function M._get_visual_selection_range()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return csrow - 1, cscol - 1, cerow - 1, cecol
  else
    return cerow - 1, cecol - 1, csrow - 1, cscol
  end
end



-- THIS FUNCTION KEYMAPPED TO ALT-I
function M.test()
print(vim.api.nvim_get_current_win())
end





function M.snippetsList()
   local snippetsList = vim.call('UltiSnips#SnippetsInCurrentScope', 1)

    --local snippetsList = vim.call('UltiSnips#ListSnippets')
  
  --  print(vim.inspect(vim.g.current_ulti_dict_info))
--log.info(vim.g.current_ulti_dict_info)
print(vim.inspect(vim.g.current_ulti_dict_info))
--log.info(snippetsList)

end

-- function M.resource()
--   require('plenary.reload').reload_module("init")
--   --require("init")
--   vim.cmd([[luafile init.lua]])
--     print('init.lua reloaded')
-- end






-- -- per file reload for lua & vim
-- function M.recurr()
--     -- f: i need to match 'lua' in filepath because you cant pass absolute path to plenary reload, it has to be the required path. this function has to take filepath -> required path
-- local ft = vim.api.nvim_buf_get_option(0, 'filetype')
-- local filepath = vim.api.nvim_eval('expand("%:p")')
-- local filename = vim.api.nvim_eval('expand("%:t")')

-- if ft == 'lua' then

-- local reload = require('plenary.reload').reload_module 



-- --log.info(filepath)
-- if string.match(filepath,'[\\/?]lua[\\/?]') ~= nil then
--             local filepath = string.match(filepath,'[\\/?]lua[\\/?]([^$]+)%.')
--             print(filepath)

--                     if string.match(filepath, '\\') ~= nil then
--                    local filepath = string.gsub(filepath,'\\','/')
--                         end 

--                         --print(filepath)
--             reload(filepath)
--             print('lua file plenary reloaded: ' .. filepath)

--     elseif filename == 'init.lua' then
--                 reload('init')
--                 print('plenary reload: init.lua')
--         else 
--             print('filepath didnt contain lua - did nothing')
--     end --ifstringmatch

-- --if ft == 'lua' then
-- --reload(filepath)
-- --print('RELOADED LUA: ' .. filepath)

-- elseif ft == 'vim' then
--     vim.cmd('so %')
--     print('RELOADED VIM: ' .. filepath)

--  end -- if filetype=
-- end -- endfunction




















function M.saveSnippet()


local visual = vim.api.nvim_exec(
[[
let visual = GetVisualSelection()
echo visual
]], true)
-- print(result)
local snippetKeyword = vim.api.nvim_exec(
        [[
        let keyword = input('Keyword: ')
        echo keyword
        ]], true)

local snippetDescription = vim.api.nvim_exec(
    [[
    let description = input('Description: ')
    echo description
    ]], true)





  -- print('result is', vim.g.prompt)

-- vim.g.snippetDescription = 'DescHere123'
-- vim.g.snippetKeyword = 'keywordHere123' 



local outstr = '\n\n' ..'snippet ' .. snippetKeyword .. ' "' .. snippetDescription .. '" b' .. '\n' .. visual .. '\n' .. 'endsnippet'

-- find path to snippet file of current buffer filetype
local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
-- local outfile = 'C:/Users/F1/AppData/Local/nvim-data/testy.snippets'
local outfile = string.format('%s\\%s\\%s.snippets', vim.api.nvim_call_function('stdpath', {'config'}), 'Ultisnips', filetype)
-- print(outfile)

local fp = io.open(outfile, "a")
fp:write(outstr)
fp:close()


end



function M.highlightDebug()
local highlightgroup = vim.api.nvim_eval([[getcompletion('', 'highlight')]])
log1.info(type(highlightgroup))

count = 1
 log1.info('------- NEW RUN -------')
for k, v in pairs(highlightgroup) do
  if count >= 485 and count <= 490 then
  vim.cmd([[highlight clear ]]..v)
    log1.info(v)
    -- put :verbose hi Comment
    -- if not Last Set.. then it hasnt been edited since launch
    --log1.info(count)
  end

  count = count + 1

end

end




-- function M.flatten(table)
--         for k, v in ipairs(table) do
--         table = v
--         end
--     return table
-- end




-- -- finds windows without fern, and in future terminal, repl etc, only main editor windows
-- function M.findWindows()



--  local allWindows = vim.api.nvim_list_wins()
  
--   -- print(allWindows)


-- local allWindowsWithout = {}

-- for _, winnr in ipairs(allWindows) do
--     local bufnr = vim.fn.winbufnr(winnr)
--     --local filetype = vim.fn.getbufvar(bufnr, "&filetype")
--     local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
--     local wininfo = M.flatten(vim.api.nvim_eval([[getwininfo(]] .. winnr .. [[)]]))
--     local buflisted = vim.api.nvim_eval([[buflisted(]] .. bufnr .. [[)]])
   

--    if filetype ~= 'fern' and filetype ~= 'NvimTree' and filetype ~= 'TelescopePrompt' and wininfo['winrow'] ~= 1 and buflisted == 1 then
--       -- log.info(filetype)
--        table.insert(allWindowsWithout, winnr)
--     end -- if filetype = fern
--   end

-- return allWindowsWithout

-- end









-- function M.focusWindow(index)
--     -- print(vim.inspect(vim.api.nvim_list_wins(index)))
--        -- local windowHandle = getWindowHandle(index)
--          local allWindows = M.findWindows()
--             --  print(vim.inspect(vim.g.windowArray))
--                 vim.api.nvim_set_current_win(allWindows[index])
--                  end









-- M.lastWindow = ''
-- M.lastWinnr = ''












-- function M.onWinEnter()





-- -- ABOVE HERE is log jump hack


-- -- debug only
  


--     --vim.g.currentWindow = 
--     local cwinnr = vim.api.nvim_get_current_win()  
--     local allWindows = M.findWindows()
-- --  log1.info(allWindows)





-- -- local changed = 0

--     for i, winnr in ipairs(allWindows) do
--         if cwinnr == winnr then

--       -- if print(M.lastWindow) == nil then
--       --           log1.info('got hereeeee')
-- -- M.lastWindow = 1000
-- -- M.lastWinnr = 1000
-- -- end
        
-- -- if vim.g.lastWindow == nil then 

-- --     end 
--         if M.lastWindow ~= vim.g.currentWindow then
--         M.lastWindow = vim.deepcopy(vim.g.currentWindow)
--         M.lastWinnr = vim.deepcopy(vim.g.currentWinnr)
--         end     


--      --   log1.info(M.lastWindow)
--      --   log1.info(M.lastWinnr)

--         vim.g.currentWindow = i
--             --log1.info(cwinnr)
--             vim.g.currentWinnr = vim.deepcopy(cwinnr)
            
--            -- log1.info(vim.g.currentWindow)
--            -- log1.info(vim.g.currentWinnr)
--         --changed = 1
--        --log.info('vim.g.currentWindow set to: ')
--        --log.info(vim.g.currentWindow)
       
--     end
-- end


--     return allWindows
    
--     -- print('onWinEnter trig')
-- end















function M.checkit()
--log.info(findWindows())
-- local allWindows = vim.api.nvim_list_wins()
vim.api.nvim_set_current_win(1008)
-- for _, winnr in ipairs(allWindows) do
--     local bufnr = vim.fn.winbufnr(winnr)
--     local filetype = vim.fn.getbufvar(bufnr, "&filetype")
--     log.info(filetype)
-- end
end



-- function M.printoutput_onWinEnter()
--     log1.info('printoutput onwinenter trig')
--     log1.info(vim.g.printoutputjump)
-- if vim.g.printoutputjump == true then
--         log1.info('JUMP TRIGERRED')
--         vim.api.nvim_feedkeys('G', 'n', false)
--  vim.g.printoutputjump = false
--     end

 
-- end








return M



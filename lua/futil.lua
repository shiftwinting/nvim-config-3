local log = require('log')

local function _get_visual_selection_range()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return csrow - 1, cscol - 1, cerow - 1, cecol
  else
    return cerow - 1, cecol - 1, csrow - 1, cscol
  end
end





local function snippetsList()
   local snippetsList = vim.call('UltiSnips#SnippetsInCurrentScope', 1)

    --local snippetsList = vim.call('UltiSnips#ListSnippets')
  
  --  print(vim.inspect(vim.g.current_ulti_dict_info))
log.info(vim.g.current_ulti_dict_info)
print(vim.inspect(vim.g.current_ulti_dict_info))
log.info(snippetsList)

end






local function test()
  local visiblebufs = vim.fn.getbufinfo({buflisted = 1})

  log.info(visiblebufs)
end




local function rlsp()

  local visiblebufs = vim.fn.getbufinfo({buflisted = 1})



print(vim.inspect(visiblebufs))
print(type(visiblebufs))


end




local function saveSnippet()


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






local function findWindowsWithoutFern()
  local allWindows = vim.api.nvim_list_wins()
  -- print(allWindows)

  local allWindowsWithoutFern = {}

  for _, win in ipairs(allWindows) do
      -- print(win)
       local bufnr = vim.fn.winbufnr(win)
         -- print(vim.fn.winbufnr(win)) 
           local buffiletype = vim.fn.getbufvar(bufnr, "&filetype")
            -- print(buffiletype)
               if buffiletype ~= 'fern' then
                   table.insert(allWindowsWithoutFern, win)
                     end

                   end
                   return allWindowsWithoutFern
                    end



local function focusWindow(index)
    -- print(vim.inspect(vim.api.nvim_list_wins(index)))
       -- local windowHandle = getWindowHandle(index)
         local allWindowsWithoutFern = findWindowsWithoutFern()
            --  print(vim.inspect(vim.g.windowArray))
                vim.api.nvim_set_current_win(allWindowsWithoutFern[index])
                 end





focusWindow()





return {
    focusWindow = focusWindow, 
    test = test,
    findWindowsWithoutFern = findWindowsWithoutFern,
    rlsp = rlsp,
    saveSnippet = saveSnippet,
    snippetsList = snippetsList,
  }



local M = {}





function M.onWinClosed()
vim.defer_fn(function()
--lo('nvim-tree onwinenter trig')
 local nvimtree_exists = false 



 local allWindows = vim.api.nvim_list_wins()

--     lo(allWindows)

    for _, winnr in pairs(allWindows) do
      local bufnr = vim.fn.winbufnr(winnr)
      local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
--lo(filetype)
 
    if filetype == 'NvimTree' then 
      lo('this ran')
        nvimtree_exists = true
        end
    end

--lo(nvimtree_exists)
if nvimtree_exists == false then 
  State.nvimtree_cwd = nil 
--lo('nvim tree cwd set to nil')
end


-- for _, bufnr in pairs(vim.api.nvim_list_bufs()) do
--     --  local bufnr = vim.fn.winbufnr(winnr)
--     local nvimtree_exists = false  
--     if vim.api.nvim_buf_get_option(bufnr, 'filetype') == 'NvimTree' then 
--         nvimtree_exists = true
--         end
--     end
 
-- if nvimtree_exists == false then 
--   State.nvimtree_cwd = nil 
-- lo('nvim tree cwd set to nil')
-- end

--lo(State.nvimtree_cwd)
end, 400)
  end




return M





--- old


-- this is called when opening a file with nvim tree (doesnt do telescope)

-- local function check_before_open(winnr)
--     local bufnr = vim.fn.winbufnr(winnr)
--     --local filetype = vim.fn.getbufvar(bufnr, "&filetype")
--     local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
--     local wininfo = M.flatten(vim.api.nvim_eval([[getwininfo(]] .. winnr .. [[)]]))
--     local buflisted = vim.api.nvim_eval([[buflisted(]] .. bufnr .. [[)]]) 
--   if filetype ~= 'fern' and filetype ~= 'NvimTree' and filetype ~= 'TelescopePrompt' and wininfo['winrow'] ~= 1 and buflisted == 1 then
--         return true
--     else
--         return false
--     end --
--     end







--function M.open_file(filename)




-- vim.cmd('e ' .. vim.fn.fnameescape(filename))




       --  if vim.g.currentWinnr ~= nil and check_before_open(vim.g.currentWinnr) == true then
       --  log1.info('picked current')
       --  vim.api.nvim_set_current_win(vim.g.currentWinnr)
       --         elseif M.lastWinnr ~= nil and check_before_open(M.lastWinnr) == true then
       --  log1.info('picked last')
       --  vim.api.nvim_set_current_win(M.lastWinnr)
       --  vim.cmd('e ' .. vim.fn.fnameescape(filename))

       --  else
       --  log1.info('picked else')
       --  vim.api.nvim_set_current_win(1000)
       --  log1.info(vim.fn.fnameescape(filename))
       -- vim.cmd('e ' .. vim.fn.fnameescape(filename))
        

        -- iterate and go to 1st window found that returns true when put through check_before_open
        --print('current & last checked - no window available - error')

        -- end
--nd

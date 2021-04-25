-- f: everything here related to window tracking without nvim tree sidebar
-- and opening up 



local M = {}
local log1 = require'log1'

M.State = {
  included = {},
  excluded = {},
    current_winnr = nil,
    last_winnr = nil

}



function M.vsplit()
lo('vsplit trig')
end


function M.onVimEnter()
table.insert(M.State.included, vim.api.nvim_get_current_win())
M.State.current_winnr = vim.api.nvim_get_current_win()
--l(M.State)

end










function M.focusWindow(index)
    -- print(vim.inspect(vim.api.nvim_list_wins(index)))
       -- local windowHandle = getWindowHandle(index)
         local allWindows = M.findWindows()
            --  print(vim.inspect(vim.g.windowArray))
                vim.api.nvim_set_current_win(allWindows[index])
                 end


return M

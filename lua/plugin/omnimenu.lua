local actions = require'omnimenu.actions'
local send_to_old = require'futil/send_to_old'

require'omnimenu'.setup {
 {
    cat = "custom",
    desc = "",
    name = "open Config: Omnimenu",
    subcat = "",
    action = function() 
      actions.open_in_floating('omnimenu/config', true, { name = 'main', title='Omnimenu Config'})
    end,
   keymap = { {'', '<F8>', {} }, {'!', '<F8>', {}} }
  },
 {
    cat = "custom",
    desc = "",
    name = "open send_to_old",
    subcat = "",
    action = function() 
      local current_filepath, old_file_exists, old_filepath, _ = send_to_old.prepare()
      -- lo('current_filepath is: ')
      -- lo(current_filepath)
      -- lo(old_file_exists)
      -- lo('old_filepath is: ')
      -- lo(old_filepath)

     actions.open_in_floating(old_filepath, false, { name = 'main', title='send_to_old' })
     end,
   keymap = { {'', '<A-z>x', {} }, {'!', '<A-z>x', {}} }
  },





  -- app launch
-- {
--     cat = "custom",
--     desc = "",
--     name = "open Dolphin",
--     subcat = "",
--     action = function() 
--       vim.cmd([[silent exec "!dolphin &"]])
--       end,
--   },
-- {
--     cat = "custom",
--     desc = "",
--     name = "kde-system-settings",
--     subcat = "",
--     action = function() 
--       vim.cmd([[silent exec "!systemsettings5 &"]])
--       end,
--   },

-- {
--     cat = "custom",
--     desc = "",
--     name = "open xev",
--     subcat = "",
--     action = function() 
--       vim.cmd([[silent exec "!xev &"]])
--       end,
--   },





}




-- not using anymore
 -- {
 --    cat = "custom",
 --    desc = "",
 --    name = "switch config: main",
 --    subcat = "",
 --    action = function() 
 --      require'futil/switch_config'.switch_config('main')
 --      end,
 --  },
 -- {
 --    cat = "custom",
 --    desc = "",
 --    name = "switch config: 2nd",
 --    subcat = "",
 --    action = function() 
 --      require'futil/switch_config'.switch_config('2')
 --      end,
 --  },


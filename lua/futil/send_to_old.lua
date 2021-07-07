local send = {}

local uv = vim.loop
local open_mode = uv.constants.O_CREAT + uv.constants.O_WRONLY + uv.constants.O_TRUNC
local utils = require 'futil/utils'

local accepted_filepaths = {
    string.format('%s/%s', vim.fn.stdpath('config'), 'lua'),
    string.format('%s/%s', vim.fn.stdpath('config'), 'plugins-me'),
   string.format('%s/%s', vim.fn.stdpath('config'), 'plugins-manual'),


}

local old_root = '/home/f1/code-library/AA/old'





  local function create_file(file)
        uv.fs_open(file, "w", open_mode, vim.schedule_wrap(function(err, fd)
            if err then
                vim.api.nvim_err_writeln('Could not create file ' .. file)
            else
                -- FIXME: i don't know why but libuv keeps creating file with executable permissions
                -- this is why we need to chmod to default file permissions
                uv.fs_chmod(file, 420)
                uv.fs_close(fd)
            end
        end))
    end


send.prepare = function()
  
    -- check if filepath of current buffer is in list of filepaths that i want to send_to_old to
    local current_filepath = vim.api.nvim_buf_get_name(0)
      local should_continue = false
    local accepted_index, accepted_filepath
    for i, fp in ipairs(accepted_filepaths) do
        if current_filepath:find(fp, 1, true) then
            should_continue = true
            accepted_index = i
            accepted_filepath = fp
        end
    end

   -- create send_to_old destination filepath from source
    local old_relpath, old_sub, old_filepath

-- for if plugins
local plugin_name, filename

 -- accepted index so i can choose a different sub folder to target
    if accepted_index == 1 then 
      -- lua configs
      old_sub = 'lua/config'
 old_relpath = current_filepath:gsub(accepted_filepath, ''):sub(2)
 old_relpath = string.format('%s/%s', old_sub, old_relpath)
old_filepath = string.format('%s/%s', old_root, old_relpath)
    elseif accepted_index == 2 or accepted_index == 3 then 
      -- plugins-me
if accepted_index == 2 then
old_sub = 'lua/plugins-me'
    _, _, plugin_name = current_filepath:find('/plugins%-me/(.*)/lua/')
  elseif accepted_index == 3 then
old_sub = 'lua/plugins-manual'
    _, _, plugin_name = current_filepath:find('/plugins%-manual/(.*)/lua/')
  end

_, _, filename = current_filepath:find('.*/(.*)')
 old_relpath = string.format('%s/%s/%s', old_sub, plugin_name, filename)
old_filepath = string.format('%s/%s', old_root, old_relpath)
end
 -- elseif accepted_index == 3 then old_sub = 'lua/plugins-manual' end



-- TEST: uncomment, then go to plugins-me, root and within subfolders, and lua dir, and plugins-manual
-- print('accepted index is: ')
-- print(accepted_index)
-- print(accepted_filepath)
-- print(current_filepath)
-- print('old paths:')
-- print('old relpath ')
--  print(old_relpath)
-- print('old_filepath: ')
--  print(old_filepath)
--   print(should_continue)

  -- return if it isnt
    if not should_continue then
        assert(false, 'buf filepath not in list of accepted filepaths')
        return
    end

 local old_file_exists = uv.fs_stat(old_filepath, nil)


    -- check if file already exists
       if old_file_exists == nil then
    -- IF NOT, create file and make sure all directories are created and exist
         utils.create_fp_dirs(old_root, old_relpath)
       create_file(old_filepath)
     end





  return current_filepath, old_file_exists, old_filepath, old_relpath

end



send.send_visual = function()
-- sends visual selection to code library
  -- get visual selection
    local visual = vim.api.nvim_call_function('GetVisualSelection', {})

    local current_filepath, old_file_exists, old_filepath, old_relpath = send.prepare() 
  

    -- if file already exists in send_to_old, write to that, if not create and then write

  utils.append_to_file(old_filepath, visual)


--     -- check if file already exists
--        if old_file_exists == nil then
--     -- IF NOT, create file and make sure all directories are created and exist
--          utils.create_fp_dirs(old_root, old_relpath)
--        create_file(old_filepath)
--      else
--   -- IF TRUE then simply write to file
--  -- lo('else ran')
-- utils.append_to_file(old_filepath, visual)
--     end
  

  end


return send

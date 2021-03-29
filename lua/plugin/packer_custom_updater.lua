--local util = require('packer.util')
--local result = require('packer.result')

--local a = require('packer.async')
----local log = require('packer.log')
--local plugin_utils = require('packer.plugin_utils')



local M = {}


M.update_rebase = function(plugin_name)
local log1 = require'log1'
local a = require('packer.async')
local async = a.sync
local await = a.wait


--local results = {}
--await(clean(plugins, results))

local display = require('packer.display')


    --local update = require('packer.update')
--update_tasks, display_win = update(plugins, installed_plugins, display_win, results)

--log1.info(display_win)
log1.info(plugin_name)
    -- display.open_preview('yeshere', 'asdlol', 10)
    display.open('open_preview')
--log1.info(display)


 return function(plugins, missing_plugins, results)
--local log1 = require'log1'
log1.info('this got damn run')
----display_win:task_start(plugin_name, 'updating...')

   end

--log1.info(results)

end


return M




-- local function update_plugin(plugin, display_win, results)
--   local plugin_name = util.get_plugin_full_name(plugin)
--   -- TODO: This will have to change when separate packages are implemented
--   local install_path = util.join_paths(config.pack_dir, plugin.opt and 'opt' or 'start',
--                                        plugin.short_name)
--   plugin.install_path = install_path
--   return async(function()
--     if plugin.lock or plugin.disable then return end
--     display_win:task_start(plugin_name, 'updating...')
--     local r = await(plugin.updater(display_win))
--     if r ~= nil and r.ok then
--       local msg = 'up to date'
--       if plugin.type == plugin_utils.git_plugin_type then
--         local info = r.info
--         local actual_update = info.revs[1] ~= info.revs[2]
--         msg = actual_update and ('updated: ' .. info.revs[1] .. '...' .. info.revs[2])
--                 or 'already up to date'
--         if actual_update then
--           log.debug(fmt('Updated %s: %s', plugin_name, vim.inspect(info)))
--           r = r:and_then(await, plugin_utils.post_update_hook(plugin, display_win))
--         end
--       end

--       if r.ok then display_win:task_succeeded(plugin_name, msg) end
--     else
--       display_win:task_failed(plugin_name, 'failed to update')
--       log.debug(fmt('Failed to update %s: %s', plugin_name, vim.inspect(r.err)))
--     end

--     results.updates[plugin_name] = r
--     results.plugins[plugin_name] = plugin
--   end)
-- end

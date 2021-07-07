-- Built-in actions
-- asdasdasd
-- REMEMBER you have to reload nvim if editing in kate
local function myFunc(inputdir, action)
  -- print(inputdir)
  local actions = require('telescope.actions')
 -- local futil = require('futil')
  -- local teleopen = require('teleopen')

  -- to make open function work
  --
  local a = vim.api
  local log = require('telescope.log')
  local path = require('telescope.path')
  local state = require('telescope.state')
  local utils = require('telescope.utils')
  local sorters = require('telescope.sorters')

  local log1 = require 'log1'

  local window = require 'futil/window'
  -- OPEN BELOW HERE

  local teleopen = function(prompt_bufnr, command)
    local entry = actions.get_selected_entry(prompt_bufnr)

    if not entry then
      print("[telescope] Nothing currently selected")
      return
    else
      local filename, row, col
      if entry.filename then
        filename = entry.path or entry.filename

        -- TODO: Check for off-by-one
        row = entry.row or entry.lnum
        col = entry.col
      elseif not entry.bufnr then
        -- TODO: Might want to remove this and force people
        -- to put stuff into `filename`
        local value = entry.value
        if not value then
          print("Could not do anything with blank line...")
          return
        end

        if type(value) == "table" then value = entry.display end

        local sections = vim.split(value, ":")

        filename = sections[1]
        row = tonumber(sections[2])
        col = tonumber(sections[3])
      end

      local preview_win = state.get_status(prompt_bufnr).preview_win
      if preview_win then a.nvim_win_set_config(preview_win, {style = ''}) end

      local entry_bufnr = entry.bufnr

      -- actions.close(prompt_bufnr)

      if entry_bufnr then
        if command == 'edit' then
          vim.cmd(string.format(":buffer %d", entry_bufnr))
        elseif command == 'new' then
          vim.cmd(string.format(":sbuffer %d", entry_bufnr))
        elseif command == 'vnew' then
          vim.cmd(string.format(":vert sbuffer %d", entry_bufnr))
        elseif command == 'tabedit' then
          vim.cmd(string.format(":tab sb %d", entry_bufnr))
        end
      else
        filename = path.normalize(vim.fn.fnameescape(filename), vim.fn.getcwd())

        local bufnr = vim.api.nvim_get_current_buf()
        if filename ~= vim.api.nvim_buf_get_name(bufnr) then
          vim.cmd(string.format(":%s %s", command, filename))
          bufnr = vim.api.nvim_get_current_buf()
          a.nvim_buf_set_option(bufnr, "buflisted", true)
        end

        if row and col then
          local ok, err_msg = pcall(a.nvim_win_set_cursor, 0, {row, col})
          if not ok then log.debug("Failed to move to cursor:", err_msg, row, col) end
        end
      end
      vim.api.nvim_command("doautocmd filetypedetect BufRead " .. vim.fn.fnameescape(filename))
    end
  end








  --

  local getPath = function(prompt_bufnr)
    local entry = actions.get_selected_entry(prompt_bufnr)
    return entry.cwd .. "\\" .. entry[1]
  end








  local getPathRoot = function(prompt_bufnr)
    local entry = actions.get_selected_entry(prompt_bufnr)
    return entry.cwd

  end








  local cd = function(prompt_bufnr)
    local path = getPath()
    vim.api.nvim_set_current_dir(path)
    -- vim.cmd('tcd ' .. path)
    -- vim.api.nvim_command('let dir = getcwd()')
    vim.api.nvim_command(
      'call CocAction("runCommand", "explorer.doAction", "3", {"name": "cd", "args": [getcwd()]})'
    )
    -- vim.api.nvim_command('call MyFunc1()')
  end








  local cdRoot = function(prompt_bufnr)
    local path = getPathRoot()
    print(path)
    vim.api.nvim_set_current_dir(path)
  end








  -- function name syntax = where function can be called with a hotkey from _ what the function does
  -- example: find_dirs_find_files = in find_dirs dropdown, push hotkey to go to find files

  local find_dirs_find_files = function(prompt_bufnr)
    local path = getPath(prompt_bufnr)
    actions.close(prompt_bufnr)
    myFunc(path, 'find_files')
    vim.api.nvim_feedkeys('i', 'n', false)
    -- vim.cmd('lua require("plugin/teleconfig2").myFunc("c:/Users/F1/Downloads", "find_files")')
  end








  local find_dirs_find_dirs = function(prompt_bufnr)
    local path = getPath(prompt_bufnr)
    actions.close(prompt_bufnr)
    myFunc(path, 'find_dirs')
    vim.api.nvim_feedkeys('i', 'n', false)
    -- vim.cmd('lua require("plugin/teleconfig2").myFunc("c:/Users/F1/Downloads", "find_files")')
  end








  local find_dirs_live_grep = function(prompt_bufnr)
    local path = getPath(prompt_bufnr)
    actions.close(prompt_bufnr)
    myFunc(path, 'live_grep')
    vim.api.nvim_feedkeys('i', 'n', false)
    -- vim.cmd('lua require("plugin/teleconfig2").myFunc("c:/Users/F1/Downloads", "find_files")')
  end








  -- local openInWindow1 = function(prompt_bufnr)
  --   -- local actions = require'telescope.actions'
  -- -- local entry = actions.get_selected_entry(prompt_bufnr)

  -- vim.api.nvim_set_current_win(1001)
  --    -- print('aa')
  --   -- futil.focusWindow(1)
  --   --  local entry = actions.get_selected_entry(prompt_bufnr)
  -- -- print(vim.inspect(entry))
  --     -- vim.cmd(string.format(":buffer %d", entry.bufnr))

  --  vim.api.nvim_set_current_win(window.State.current_winnr)
  --     teleopen(prompt_bufnr, "edit")
  -- local escape = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  --         vim.api.nvim_feedkeys(escape, 'n', true)
  -- --  actions.close
  --   -- actions.goto_file_selection_edit(entry.bufnr)

  -- end

  -- local openInWindow2 = function(prompt_bufnr)
  --     -- local actions = require'telescope.actions'
  --     -- local entry = actions.get_selected_entry(prompt_bufnr)
  --         futil.focusWindow(2)
  --             -- actions.goto_file_selection_edit(prompt_bufnr)
  --             teleopen(prompt_bufnr, "edit")

  --           end

  -- local openInWindow3 = function(prompt_bufnr)
  --     -- local actions = require'telescope.actions'
  --     -- local entry = actions.get_selected_entry(prompt_bufnr)
  --         futil.focusWindow(3)
  --         teleopen(prompt_bufnr, "edit")
  -- local escape = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  --         vim.api.nvim_feedkeys(escape, 'n', true)
  --            --  actions.goto_file_selection_edit(prompt_bufnr)
  --           end

  local openInActiveWindow = function(prompt_bufnr)
    local entry = actions.get_selected_entry(prompt_bufnr)
    lo('active window trig')
      lo(entry)
    vim.api.nvim_set_current_win(fstate.window.current_winnr)
    if entry.lnum ~= nil then

      entry.filename = entry.filename:gsub('^.', '')

      --   lo('live grep ran')
      vim.cmd('e! ' .. vim.fn.fnameescape(entry.cwd .. entry['filename']))
      vim.api.nvim_win_set_cursor(0, {entry.lnum, entry.col})
    else
      -- this is find_files

      --   lo(entry.cwd)
      --   lo(entry[1])
      vim.cmd('e! ' .. vim.fn.fnameescape(entry.cwd .. '/' .. entry[1]))
    end
    -- if entry.col then  end

    -- actions.close
    --   teleopen(prompt_bufnr, "edit")

    local escape = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
    vim.api.nvim_feedkeys(escape, 'n', true)
  end








  if inputdir == '' and vim.bo.filetype ~= 'NvimTree' then
    inputdir = vim.fn.getcwd()
  elseif vim.bo.filetype == 'NvimTree' then
    inputdir = require'nvim-tree'.on_keypress('getPath')
    -- log1.info(currentNode)
    -- inputdir = currentNode.absolute_path

    -- inputdir = require'nvim-tree/lib'.get_node_at_cursor()
  else
    -- do nothing
  end

  local default_dir_mappings = function(prompt_bufnr, map)
    map('i', '<C-e>', cd)
    map('i', '<C-r>', cdRoot)
    map('i', '<Esc>', actions.close)
    map('i', '<C-s>', actions.move_selection_next)
    map('i', '<C-w>', actions.move_selection_previous)
    map('i', '<A-a>a', find_dirs_find_files)
    map('i', '<A-a>d', find_dirs_live_grep)
    map('i', '<A-a>s', find_dirs_find_dirs)
    map('i', '<CR>', find_dirs_find_files)
    map('i', '<C-CR>', find_dirs_live_grep)
    map('i', '<Up>', actions.move_selection_previous)
    map('i', '<Down>', actions.move_selection_next)
    return true
  end








  local default_file_mappings = function(prompt_bufnr, map)
    map('i', '<A-1>', openInWindow1)
    map('i', '<A-2>', openInWindow2)
    map('i', '<A-3>', openInWindow3)
    map('i', '<C-e>', cd)
    map('i', '<C-r>', cdRoot)
    map('i', '<Esc>', actions.close)
    map('i', '<C-s>', actions.move_selection_next)
    map('i', '<C-w>', actions.move_selection_previous)
    map('i', '<CR>', openInActiveWindow)
    map('i', '<Up>', actions.move_selection_previous)
    map('i', '<Down>', actions.move_selection_next)
    map('i', '<A-a>a', find_dirs_find_files)
    map('i', '<A-a>d', find_dirs_live_grep)
    return true
  end








  -- actions.goto_file_selected_edit

  if action == "find_dirs_depth1" then

    -- local actions = require('telescope.actions')
    --
    --
    require('telescope.builtin').fd(
      {
        attach_mappings = default_dir_mappings,
        find_command = {'fd', '-H', '--type', 'd', '--type', 'l', '-L'},
        cwd = inputdir,
        previewer = false,
        width = 0.5
      }
    )

  elseif action == "find_dirs" then

    require('telescope.builtin').fd(
      {
        attach_mappings = default_dir_mappings,
        find_command = {
          'fd', '--no-ignore', '--type', 'd', '--type', 'l', '--max-depth', '2', '-H', '-L',
          '--exclude', 'node_modules'
        },
        cwd = inputdir,
        previewer = false,
        width = 0.5
      }
    )

  elseif action == "find_files" then
    require('telescope.builtin').find_files {
      attach_mappings = default_file_mappings,
      find_command = {'fd', '-HI', '--type', 'f', '-L'}, -- old find_command{ 'fd', '--type', 'f', '-e', 'cpp', '-e', 'hpp', '-e', 'c', '-e', 'h', '-L' },
      file_ignore_patterns = {'.git/*'},
      shorten_path = false,
      initial_mode = "insert",
      cwd = inputdir,
      height = 10,
      prompt_prefix = inputdir,

      layout_strategy = 'horizontal',
      layout_options = {preview_width = 0.40}
    }

  elseif action == "builtin" then
    require('telescope.builtin').builtin {}

  elseif action == "live_grep" then
    require('telescope.builtin').live_grep {
      attach_mappings = default_file_mappings,
      vimgrep_arguments = {
        'rg', '--color=never', '--hidden', '--no-heading', '--with-filename', '--line-number',
        '--column', '--smart-case', '-u' -- thats the new thing -- ignore .gitignore files show everything
      },
      shorten_path = false,
      cwd = inputdir,
      height = 10,
      prompt_prefix = inputdir,

      layout_strategy = 'horizontal',
      layout_options = {preview_width = 0.50}
      --         cwd = inputdir,
      --         color_devicons = true,
      --         prompt_prefix = inputdir,
    }

  end
end








return {myFunc = myFunc}


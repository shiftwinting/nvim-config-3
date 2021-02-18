function teleopen(prompt_bufnr, command)
    local command = "edit"
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
  
        if type(value) == "table" then
          value = entry.display
        end
  
        local sections = vim.split(value, ":")
  
        filename = sections[1]
        row = tonumber(sections[2])
        col = tonumber(sections[3])
      end
  
      local preview_win = state.get_status(prompt_bufnr).preview_win
      if preview_win then
        a.nvim_win_set_config(preview_win, {style = ''})
      end
  
      local entry_bufnr = entry.bufnr
  
      actions.close(prompt_bufnr)
  
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
          if not ok then
            log.debug("Failed to move to cursor:", err_msg, row, col)
          end
        end
      end
      vim.api.nvim_command("doautocmd filetypedetect BufRead " .. vim.fn.fnameescape(filename))
    end
  end


return {

    teleopen = teleopen
}
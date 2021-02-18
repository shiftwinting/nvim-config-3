local gl = require('galaxyline')
local utils = require('utils')

local gls = gl.section


-- Colors
local colors = {
  bg = '#282a36',
  fg = '#f8f8f2',
  section_bg = '#38393f',
  yellow = '#f1fa8c',
  cyan = '#8be9fd',
  green = '#50fa7b',
  orange = '#ffb86c',
  magenta = '#ff79c6',
  blue = '#8be9fd',
  red = '#ff5555'
}

-- Local helper functions
local buffer_not_empty = function()
  -- had to be outside of any loaded lua file on init
  return not utils.is_buffer_empty() 
end

-- local is_buffer_empty = function()
--   -- Check whether the current buffer is empty
--   return vim.fn.empty(vim.fn.expand('%:t')) == 1
-- end

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  return mode_colors[vim.fn.mode()]
end

-- Left side
-- gls.left[1] = {
--   FirstElement = {
--     provider = function() return '▋' end,
--     highlight = { colors.cyan, colors.section_bg }
--   },
-- }
gls.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
      return alias[vim.fn.mode()]..' '
    end,
    highlight = { colors.bg, colors.bg },
    separator = "  ",
    separator_highlight = {colors.bg, colors.section_bg},
  },
}
gls.left[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}
gls.left[3] = {
  FileName = {
    provider = { 'FileName'},
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg},
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.section_bg}
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange,colors.section_bg},
  }
}
gls.left[15] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.section_bg},
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}
gls.left[15] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' 💡 ',
    highlight = {colors.blue,colors.section_bg},
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}
-- gls.left[16] = {
--   Test = {
--   provider = function() 
--       vim.g.countup = 1
--       print(vim.g.countup)
--       vim.g.countup = vim.g.countup + 1
--     end
--   }
-- }

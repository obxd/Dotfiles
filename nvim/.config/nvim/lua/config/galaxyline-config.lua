-- https://github.com/glepnir/galaxyline.nvim
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

COLORS ={
  bg =       '#32302f',
  fg =       '#bbc2cf',
  yellow =   '#ECBE7B',
  cyan =     '#008080',
  darkblue = '#081633',
  green =    '#98be65',
  orange =   '#FF8800',
  violet =   '#a9a1e1',
  magenta =  '#c678dd',
  blue =     '#51afef';
  red =      '#ec5f67';
}

gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {COLORS.blue,COLORS.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = COLORS.red, i = COLORS.green,v=COLORS.blue,
                          [''] = COLORS.blue,V=COLORS.blue,
                          c = COLORS.magenta,no = COLORS.red,s = COLORS.orange,
                          S=COLORS.orange,[''] = COLORS.orange,
                          ic = COLORS.yellow,R = COLORS.violet,Rv = COLORS.violet,
                          cv = COLORS.red,ce=COLORS.red, r = COLORS.cyan,
                          rm = COLORS.cyan, ['r?'] = COLORS.cyan,
                          ['!']  = COLORS.red,t = COLORS.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()] ..' guibg='..COLORS.bg)
      return '  '
    end,
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {COLORS.fg,COLORS.bg}
  }
}
gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,COLORS.bg},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {COLORS.fg,COLORS.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',COLORS.bg},
    highlight = {COLORS.fg,COLORS.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',COLORS.bg},
    highlight = {COLORS.fg,COLORS.bg,'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {COLORS.red,COLORS.bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {COLORS.yellow,COLORS.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {COLORS.cyan,COLORS.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {COLORS.blue,COLORS.bg},
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {COLORS.yellow,COLORS.bg,'bold'}
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',COLORS.bg},
    highlight = {COLORS.green,COLORS.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',COLORS.bg},
    highlight = {COLORS.green,COLORS.bg,'bold'}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',COLORS.bg},
    highlight = {COLORS.violet,COLORS.bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {COLORS.violet,COLORS.bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {COLORS.green,COLORS.bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {COLORS.orange,COLORS.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {COLORS.red,COLORS.bg},
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {COLORS.blue,COLORS.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',COLORS.bg},
    highlight = {COLORS.blue,COLORS.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {COLORS.fg,COLORS.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {COLORS.fg,COLORS.bg}
  }
}

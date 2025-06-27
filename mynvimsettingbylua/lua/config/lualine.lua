function lualine()
  vim.cmd [[packadd! lualine.nvim]]
  vim.cmd [[packadd! lualine-lsp-progress]]
  vim.cmd [[packadd! nvim-navic]] -- 添加 navic 插件加载
end

lualine()

-- 确保 navic 已经加载并配置
local navic = require("nvim-navic")

local colors = {
  color0   = "#e4e4e4",
  color1   = "#3886ab",
  color3   = "#dddddd", --a区域的背景
  color2   = "#464646", --a区域的字
  color4   = "#0e749f", --b区域的背景
  color5   = "#dddddd", --b区域的字
  color6   = "#0a4b74", --c区域的背景
  color7   = "#eaeaea", --c区域的字
  color10  = "#859900",
  color11  = "#586e75",
  color12  = "#839496",
  color15  = "#dc322f",
}

local solarized_custom = {
  normal = {
    c = {fg = colors.color7, bg = colors.color6},
    a = {fg = colors.color2, bg = colors.color3, gui = "bold",},
    b = {fg = colors.color5, bg = colors.color4},
    z = {fg = colors.color2, bg = colors.color3, gui = "bold"},
  },
  visual = {
    a = {fg = colors.color2, bg = colors.color7, gui = "bold",},
    b = {fg = colors.color2, bg = colors.color4},
    z = {fg = colors.color2, bg = colors.color3, gui = "bold"},
  },
  insert = {
    a = {fg = colors.color2, bg = colors.color10, gui = "bold",},
    b = {fg = colors.color2, bg = colors.color4},
    z = {fg = colors.color2, bg = colors.color3, gui = "bold"},
  },
  inactive = {
    c = {fg = colors.color11, bg = colors.color1},
    a = {fg = colors.color12, bg = colors.color1, gui = "bold",},
    b = {fg = colors.color12, bg = colors.color1},
    z = {fg = colors.color2, bg = colors.color3, gui = "bold"},
  },
  replace = {
    a = {fg = colors.color2, bg = colors.color15, gui = "bold",},
    b = {fg = colors.color2, bg = colors.color4},
    z = {fg = colors.color2, bg = colors.color3, gui = "bold"},
  },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme  = solarized_custom,
    section_separators = {left = '▶', right = '◀'},
    component_separators = {left = '▶', right = '◀'},
    disabled_filetypes = {
    },
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
      "branch", "diff",
      {
        'filename',
        file_status = true,      -- Displays file status (readonly status, modified status)
        newfile_status = false,  -- Display new file status (new file means no write after created)
        path = 1,                -- 0: Just the filename
                                 -- 1: Relative path
                                 -- 2: Absolute path
                                 -- 3: Absolute path, with tilde as the home directory
        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]',     -- Text to show for new created file before first writting
        }
      }
    },
    lualine_c = {
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return navic.is_available()
        end,
        color = { fg = colors.color7 }, -- 设置 navic 的文本颜色
      },
      "lsp_progress", -- 将 lsp_progress 放在 navic 后面
    },
    lualine_x = {
      --{gps.get_location, cond = gps.is_available},
      "encoding",
      "fileformat",
    },
    lualine_y = {"os.date(\"%a %H:%M\")"},
    lualine_z = {
      "filetype",
      "location",
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        sections = {'error'},
        diagnostics_color = {
          error = 'gray', -- Changes diagnostics' error color.
        },
        symbols = {error = '✗'},
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false   -- Show diagnostics even if there are none.
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {'quickfix', 'fugitive'},
})

local colors = {
  black        = '#232831',
  white        = '#e5e9f0',
  red          = '#bf616a',
  pink         = '#bf99bc',
  green        = '#a3be8c',
  blue         = '#81a1c1',
  cyan         = '#60728a',
  yellow       = '#ebcb8b',
  orange       = '#c9826b',
  gray         = '#2e3440',
}

local theme = {
	normal = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white},
    x = {bg = colors.gray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.gray, fg = colors.white},
  },
  insert = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white},
    x = {bg = colors.gray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.gray, fg = colors.white},
  },
  visual = {
    a = {bg = colors.pink, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white},
    x = {bg = colors.gray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.gray, fg = colors.white},
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white},
    x = {bg = colors.gray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.gray, fg = colors.white},
  },
  command = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white},
    x = {bg = colors.gray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.gray, fg = colors.white},
  },
  inactive = {
    a = {bg = colors.gray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.gray},
    c = {bg = colors.gray, fg = colors.white},
    x = {bg = colors.gray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.gray, fg = colors.white},
  }}

local modes = {
	'mode',
	separator = { left = "", right = "" },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.gray, fg = colors.white },
}

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local lsp = {
	function()
		return getLspName()
	end,
	color = { bg = colors.blue, fg = colors.black },
	separator = { left = "", right = "" },
}

local dia = {
	'diagnostics',
	color = { bg = colors.black, fg = colors.white },
	separator = { left = "", right = "" },
}

local branch = {
	'branch',
	color = { bg = colors.blue, fg = colors.black },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = colors.black, fg = colors.white },
	separator = { left = "", right = "" },
}

local filename = {
	'filename',
	color = { bg = colors.blue, fg = colors.black },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = colors.black },
	separator = { left = "", right = "" },
}

-- local toggleterm = {
--   sections = {
--     lualine_a = {
--       space,
--       {
--         'toggleterm',
--         color = { bg = colors.blue, fg = colors.black },
--         separator = { left = "", right = "" },
--       },
--     }
--   },
--   filetypes = {'toggleterm'}
-- }

return {
  {
    'nvim-lualine/lualine.nvim',
    pin = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
    },
    lazy = false,
    opts = {
      options = {
        theme = theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- disabled_filetypes = { 'neo-tree' },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          space,
          modes
        },
        lualine_b = {space},
        lualine_c = {
          lsp,
          dia,
          space,
          branch,
          diff,
        },
        lualine_x = {
          {
            'lsp_progress',
            -- spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' }
          },
          space,
        },
        lualine_y = {
          filename,
          filetype,
        },
        lualine_z = {space,},
      },
      extensions = {
        'neo-tree',
        'toggleterm',
        -- toggleterm,
      }
    }
  },
}

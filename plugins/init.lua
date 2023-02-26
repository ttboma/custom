local overrides = require "custom.plugins.overrides"
-- @type {[PluginName]: NvPluginConfig|false}
local plugins = {
  -- Enables plugins
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
    override_options = function()
      require "custom.plugins.whichkey"
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    disable = false,
    override_options = function()
      require('telescope').load_extension('projects')
      require'telescope'.extensions.projects.projects{}
    end,
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("project_nvim").setup()
    end
  },
	["kevinhwang91/rnvimr"] = {
		cmd = "RnvimrToggle",
	},

  -- git
  ['f-person/git-blame.nvim'] = {},
	["sindrets/diffview.nvim"] = {
		event = "BufRead",
	},
	["tpope/vim-fugitive"] = {
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit"
		},
		ft = { "fugitive" },
	},

  -- coding experience
  ["jose-elias-alvarez/null-ls.nvim"] = { -- formatting, linting etc
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
	['liuchengxu/vista.vim'] = {},
  ["folke/trouble.nvim"] = {
		cmd = "TroubleToggle",
	},
  ['RRethy/vim-illuminate'] = {},
  ['mrjones2014/nvim-ts-rainbow'] = {
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          -- ...
        },
        -- ...
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
      })
    end,
  },
  ['folke/todo-comments.nvim'] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  ["utilyre/barbecue.nvim"] = {
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      local M = require"custom.plugins.barbecue"
      require("barbecue").setup(M)
    end,
  },
  ["chentoast/marks.nvim"] = {
    config = function()
      local M = require"custom.plugins.marks"
      require"marks".setup(M)
    end,
  },

  -- Markdown
	["iamcco/markdown-preview.nvim"] = {
		run = "cd app && npm install",
		ft = "markdown",
	},
  ['jghauser/follow-md-links.nvim'] = {},
	['mzlogin/vim-markdown-toc'] = {},

  ["rcarriga/nvim-notify"] = {
    config = function()
      require"notify".setup{}
    end,
  },

  ['ggandor/leap.nvim'] = {
    requires = "tpope/vim-repeat",
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  -- Debugging
  -- ['mfussenegger/nvim-dap'] = {},

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins

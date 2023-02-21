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

  -- code 
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

  -- Markdown
	["iamcco/markdown-preview.nvim"] = {
		run = "cd app && npm install",
		ft = "markdown",
	},
  ['jghauser/follow-md-links.nvim'] = {},
	['mzlogin/vim-markdown-toc'] = {},

  ['folke/todo-comments.nvim'] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  ["giusgad/pets.nvim"] = {
    requires = {
      "edluffy/hologram.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("pets").setup()
    end,
  }

  -- Debugging
  -- ['mfussenegger/nvim-dap'] = {},

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins

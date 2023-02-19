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
	['liuchengxu/vista.vim'] = {},
  ["folke/trouble.nvim"] = {
		cmd = "TroubleToggle",
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
	["sindrets/diffview.nvim"] = {
		event = "BufRead",
	},
	["iamcco/markdown-preview.nvim"] = {
		run = "cd app && npm install",
		ft = "markdown",
	},
  ['jghauser/follow-md-links.nvim'] = {},
	['mzlogin/vim-markdown-toc'] = {},

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Debugging
  -- ['mfussenegger/nvim-dap'] = {},

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins

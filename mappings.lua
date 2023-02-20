-- @type MappingsConfig
local M = {}

M.rnvimr = {
  n = {
    ["<leader>E"] = { "<cmd> RnvimrToggle <CR>", "Ranger Toggle", opts = { nowait = true } },
  },
}
M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
  n = {
    -- remember u can "<leader>x" to delete and close buffer (mapping of tabuline)
    ["<leader>q"] = { "<cmd> q <CR>", "Close window", opts = { nowait = true } },

    ["L"] = { "g_", opts = { nowait = true } },
    ["H"] = { "_", opts = { nowait = true } },
    ["J"] = { "<C-d>", opts = { nowait = true } },
    ["K"] = { "<C-u>", opts = { nowait = true } }, -- overwirte lspconfig

    ["<S-up>"] = { "<C-w>+", opts = { nowait = true } },
    ["<S-down>"] = { "<C-w>-", opts = { nowait = true } },
    ["<S-right>"] = { "<C-w>>", opts = { nowait = true } },
    ["<S-left>"] = { "<C-w><", opts = { nowait = true } },

    -- switch between windows with ALT 
    -- (ALT is a better choice in terms of consistence with terminal mode
    -- while CRL mappings are predifined by shell, e.g "<C-l>")
    ["<A-h>"] = { "<C-w>h", "window left" },
    ["<A-l>"] = { "<C-w>l", "window right" },
    ["<A-j>"] = { "<C-w>j", "window down" },
    ["<A-k>"] = { "<C-w>k", "window up" },

    -- jumps to tags
    ["<C-l>"] = { "<C-]>", "Jump to definition" },
    ["<C-h>"] = { "<C-t>", "Jump back" },
    ["<C-k>"] = { "<cmd>tp<CR>", "Jump to previous tag" },
    ["<C-j>"] = { "<cmd>tn<CR>", "Jump to next tag" },

    -- cycle through tabs 
    ["<TAB>"] = { "<cmd>tabnext<CR>", "Next Tab", opts = { nowait = true } }, -- overwirte tabuline
    ["<S-Tab>"] = { "<cmd>tabNext<CR>", "Prev Tab", opts = { nowait = true } }, -- overwirte tabuline
  },
  x = {
    ["L"] = { "g_", opts = { nowait = true } },
    ["H"] = { "_", opts = { nowait = true } },
    ["J"] = { "<C-d>", opts = { nowait = true } },
    ["K"] = { "<C-u>", opts = { nowait = true } },
  },
  t = {
    ["<leader>q"] = { "<cmd> q <CR>", "Quiit", opts = { nowait = true } },
  }
}
M.tabufline = {
  n = {
    -- cycle through buffers
    ["<C-p>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<C-n>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  },
}
M.lspconfig = {
  n = {
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
    ["<leader>lh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
    ["<leader>lr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },
    ["<leader>ldc"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },
    ["<leader>ldf"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },
    ["<leader>ldt"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },
    ["<leader>li"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },
    ["<leader>ln"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["<leader>lc"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["<leader>df"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["<leader>dl"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "setloclist diagnostic",
    },
    ["<leader>dn"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto_prev diagnostic",
    },
    ["<leader>dN"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next diagnostic",
    },
  },
}
M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>fgt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>ftm"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>fth"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}
M.whichkey = {
  n = {
    ["<leader>ka"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>kl"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}
M.nvterm = {
  t = {
    -- Change to NTerminal mode (different from "<ESC>", try it your self)
    ["<ESC><ESC>"] = {
      vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
      "escape terminal mode",
    },

    -- switch between windows
    ["<A-h>"] = { "<C-\\><C-N><C-w>h", "window left" },
    ["<A-l>"] = { "<C-\\><C-N><C-w>l", "window right" },
    ["<A-j>"] = { "<C-\\><C-N><C-w>j", "window down" },
    ["<A-k>"] = { "<C-\\><C-N><C-w>k", "window up" },
    -- Remember u can "<C-l>" to send ^L to shell (clear)
    -- Remember u can "<C-c>" to send ^C to shell (terminate)
    -- Remember u can "<C-d>" to delete terminal buffer (EOF)

    -- toggle in terminal mode
    ["<leader>tt"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>tx"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
  n = {
    -- toggle in normal mode
    ["<leader>tt"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>tx"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new
    ["<leader>tX"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },
    ["<leader>tV"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
    -- Remember <leader>pt is mapped to pick hidden term!!

  },
}
M.vista = {
  n = {
    ["<leader>vl"] = { "<cmd>silent! Vista nvim_lsp <CR>", "Vista Nvim LSP", opts = { nowait = true } },
    ["<leader>vc"] = { "<cmd>silent! Vista ctags <CR>", "Vista Ctags", opts = { nowait = true } },
  },
}
M.wiki = {
  n = {
    ["<leader>ww"] = {
      "<cmd> edit /Users/shiehyuehchang/SYCWikiSite/README.md <cr>",
      "Open Wiki Index (md)"
    },
    ["<leader>wh"] = {
      "<cmd>silent !make open <cr>",
      "Open Wiki Index (html)"
    },
    ["<leader>wt"] = {
      "<cmd> GenToGFM <cr>",
      "GenToGFM"
    },
  },
}
M.md_link = {
  n = {
    ['<bs>'] = { '<cmd> edit # <cr>', { silent = true } },
  }
}
M.disabled = {
  t = {
    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<C-x>"] = "",
  },
  n = {
    -- nvimtree
    ["<C-n>"] = "",
    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    -- whichkey
    ["wK"] = "",
    ["wk"] = "",
    -- telescope
    ["<leader>tk"] = "",
    ["<leader>pt"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>th"] = "",
    -- lspconfig
    ["<leader>fm"] = "",
    ["gD"] = "",
    ["gd"] = "",
    ["gk"] = "",
    ["gi"] = "",
    ["gr"] = "",
    ["<leader>D"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>f"] = "",
    ["[d"] = "",
    ["d]"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
  },
}

return M

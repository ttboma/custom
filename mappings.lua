-- @type MappingsConfig
local M = {}

M.nvimtree = {
  n = {
    -- Remember you can "q" to quit after focus
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}
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
    ["<leader>q"] = { "<cmd> q <CR>", "Quiit", opts = { nowait = true } },

    ["L"] = { "g_", opts = { nowait = true } },
    ["H"] = { "_", opts = { nowait = true } },
    ["J"] = { "<C-d>", opts = { nowait = true } },
    ["K"] = { "<C-u>", opts = { nowait = true } },

    ["<S-up>"] = { "<C-w>+", opts = { nowait = true } },
    ["<S-down>"] = { "<C-w>-", opts = { nowait = true } },
    ["<S-right>"] = { "<C-w>>", opts = { nowait = true } },
    ["<S-left>"] = { "<C-w><", opts = { nowait = true } },

    -- switch between windows 
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
    ["<TAB>"] = { "<cmd>tabnext<CR>", "Next Tab", opts = { nowait = true } },
    ["<S-Tab>"] = { "<cmd>tabNext<CR>", "Prev Tab", opts = { nowait = true } },
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
M.lspconfig = {
  n = {
    ["gk"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Lsp hover", opts = { nowait = true } },
  },
}
M.vista = {
  n = {
    ["<leader>v"] = { "<cmd>silent! Vista nvim_lsp <CR>", "Vista Nvim LSP", opts = { nowait = true } },
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
    ["<A-i>"] = "", -- nvterm
    ["<A-h>"] = "", -- nvterm
    ["<A-v>"] = "", -- nvterm
  },
  n = {
    ["<C-n>"] = "", -- nvimtree
    ["<A-i>"] = "", -- nvterm
    ["<A-h>"] = "", -- nvterm
    ["<A-v>"] = "", -- nvterm
    ["<leader>h"] = "", -- nvterm
    ["<leader>v"] = "", -- nvterm
  },
}


-- more keybinds!

return M

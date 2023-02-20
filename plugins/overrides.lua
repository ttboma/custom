local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "make",
    "cmake",
    "rust",
    "toml",
    "lua",
    "vim",
    "python",
    "markdown",
    "yaml",
    "html",
    "css",
    "javascript",
  },
}

M.mason = {
  ensure_installed = {
    -- cpp
    "clangd",
    "clang-format",

    -- rust
    "rust-analyzer",

    -- python
    "pyright",
    "python-lsp-server",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- markdown
    "marksman",
  },
}

-- git support in nvimtree
M.nvimtree = {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = true, -- modified
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true, -- modified
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  ignore_buf_on_tab_change = {},
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = true, -- modified
  respect_buf_cwd = true, -- modified
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,
  view = {
    float = { -- modified
      enable = false,
      quit_on_focus_loss = false,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_h = screen_h * 0.9
        local window_h_int = math.floor(window_h)
        local center_x = screen_w - 30
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = 30,
          height = window_h_int,
        }
        end,
    },
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = { -- modified
        { key = { "l", "<CR>", "<2-LeftMouse>" }, action = "edit" },
        { key = { "h", "<BS>" }, action = "close_node" },
        { key = { "H", }, action = "dir_up" },
        { key = { "L", "<2-RightMouse>" }, action = "cd" },
        { key = { "K", }, action = "first_sibling" },
        { key = { "J", }, action = "last_sibling" },
        { key = "C", action = "collapse_all" },
        { key = "E", action = "expand_all" },
        ---
        { key = "<A-v>", action = "vsplit" },
        { key = "<A-x>", action = "split" },
        { key = "<A-t>", action = "tabnew" },
        { key = "<A-e>", action = "edit_in_place" },
        { key = "<A-o>", action = "edit_no_picker" },
        { key = "<Tab>", action = "preview" },
        ---
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "gr", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "p", action = "paste" },
        ---
        { key = "g?", action = "toggle_help" },
        { key = "z", action = "toggle_dotfiles" },
        { key = "m", action = "toggle_mark" },
        { key = "i", action = "toggle_file_info" },
        { key = "I", action = "toggle_git_ignored" },
        { key = "U", action = "toggle_custom" },
        ---
        { key = ".", action = "run_file_command" },
        { key = "s", action = "system_open" },
        ---
        { key = "R", action = "refresh" },
        { key = "S", action = "search_node" },
        { key = "q", action = "close" },
        ---
        { key = "[p", action = "parent_node" },
        { key = "[e", action = "prev_diag_item" },
        { key = "[c", action = "prev_git_item" },
        { key = "[s", action = "prev_sibling" },
        { key = "]e", action = "next_diag_item" },
        { key = "]c", action = "next_git_item" },
        { key = "]s", action = "next_sibling" },
        { key = "f", action = "live_filter" },
        { key = "F", action = "clear_live_filter" },
        { key = "bmv", action = "bulk_move" },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = true, -- modified
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,  -- modified
    update_root = false, -- modified
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true, -- modified
    show_on_dirs = true, -- modified
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true, -- modified
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  git = {
    enable = true,
    ignore = false, -- modified
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
}
M.nvterm = {
  terminals = {
    list = {},
    type_opts = {
      float = {
        relative = "editor",
        row = 0.025,
        col = 0.05,
        width = 0.9,
        height = 0.8,
        border = "rounded",
      },
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
  behavior = {
    close_on_exit = true,
    auto_insert = true,
  },
  enable_new_mappings = true,
}
M.alpha = require "custom.plugins.alpha"

return M

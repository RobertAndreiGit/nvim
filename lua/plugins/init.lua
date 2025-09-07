return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      }
    end,
    lazy = false,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "qpkorr/vim-bufkill",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "tsx",
        "json",
      },
      highlight = {
        enable = true,
        disable = {},
      },
    },
  },
  -- ~/.config/nvim/lua/plugins/init.lua
  {
    "andymass/vim-matchup",
    init = function()
      -- modify your configuration vars here
      vim.g.matchup_treesitter_stopline = 500

      -- or call the setup function provided as a helper. It defines the
      -- configuration vars for you
      require("match-up").setup {
        treesitter = {
          stopline = 500,
        },
      }
    end,
    -- or use the `opts` mechanism built into `lazy.nvim`. It calls
    -- `require('match-up').setup` under the hood
    -- -@type matchup.Config
    opts = {
      treesitter = {
        stopline = 500,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "thenbe/neotest-playwright",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-playwright").adapter {
            options = {
              -- persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          },
        },
        consumers = {
          playwright = require("neotest-playwright.consumers").consumers,
        },
      }
    end,
  },
  -- {
  --   "quolpr/quicktest.nvim",
  --   config = function()
  --     local qt = require "quicktest"
  --
  --     qt.setup {
  --       -- Choose your adapter, here all supported adapters are listed
  --       adapters = {
  --         require "quicktest.adapters.golang" {},
  --         require "quicktest.adapters.vitest" {},
  --         require "quicktest.adapters.playwright" {},
  --         require "quicktest.adapters.pytest" {},
  --         require "quicktest.adapters.elixir",
  --         require "quicktest.adapters.criterion",
  --         require "quicktest.adapters.dart",
  --         require "quicktest.adapters.rspec",
  --       },
  --       -- split or popup mode, when argument not specified
  --       default_win_mode = "split",
  --       use_builtin_colorizer = true,
  --     }
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   keys = {
  --     {
  --       "<leader>tl",
  --       function()
  --         local qt = require "quicktest"
  --         -- current_win_mode return currently opened panel, split or popup
  --         qt.run_line()
  --         -- You can force open split or popup like this:
  --         -- qt.run_line('split')
  --         -- qt.run_line('popup')
  --       end,
  --       desc = "[T]est Run [L]line",
  --     },
  --     {
  --       "<leader>tf",
  --       function()
  --         local qt = require "quicktest"
  --
  --         qt.run_file()
  --       end,
  --       desc = "[T]est Run [F]ile",
  --     },
  --     {
  --       "<leader>td",
  --       function()
  --         local qt = require "quicktest"
  --
  --         qt.run_dir()
  --       end,
  --       desc = "[T]est Run [D]ir",
  --     },
  --     {
  --       "<leader>ta",
  --       function()
  --         local qt = require "quicktest"
  --
  --         qt.run_all()
  --       end,
  --       desc = "[T]est Run [A]ll",
  --     },
  --     {
  --       "<leader>tp",
  --       function()
  --         local qt = require "quicktest"
  --
  --         qt.run_previous()
  --       end,
  --       desc = "[T]est Run [P]revious",
  --     },
  --     {
  --       "<leader>tt",
  --       function()
  --         local qt = require "quicktest"
  --
  --         qt.toggle_win "split"
  --       end,
  --       desc = "[T]est [T]oggle Window",
  --     },
  --     {
  --       "<leader>tc",
  --       function()
  --         local qt = require "quicktest"
  --
  --         qt.cancel_current_run()
  --       end,
  --       desc = "[T]est [C]ancel Current Run",
  --     },
  --   },
  -- },
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    -- -@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    keys = {
      {
        "<leader>cc",
        "<cmd>CopilotChatToggle<cr>",
        desc = "Toggle Copilot Chat",
      },
    },
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    lazy = false,
  },
}

return {
  'nvim-lua/popup.nvim',
  'MunifTanjim/nui.nvim',
  'kyazdani42/nvim-web-devicons',
  'RRethy/vim-illuminate',
  'cohama/lexima.vim',
  'kana/vim-operator-user',
  { 'kana/vim-operator-replace', dependencies = { 'kana/vim-operator-user' } },
  { 'tyru/operator-camelize.vim', dependencies = { 'kana/vim-operator-user' } },
  'kana/vim-textobj-user',
  { 'rhysd/vim-textobj-ruby', dependencies = { 'kana/vim-textobj-user' } },
  'simeji/winresizer',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  'AndrewRadev/switch.vim',
  'folke/neodev.nvim',
  'machakann/vim-highlightedyank',
  'haya14busa/vim-asterisk',
  'svermeulen/vim-macrobatics',
  'dhruvasagar/vim-table-mode',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'vim-denops/denops.vim',
  'skanehira/denops-germanium.vim',
  'rhysd/clever-f.vim',
  "github/copilot.vim",
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    '0xAdk/full_visual_line.nvim',
    config = function ()
      require 'full_visual_line'.setup {}
    end
  },
  {
    "chrisbra/csv.vim",
    config = function()
      vim.g.csv_default_delim = ","
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end
        },
      }
    end
  },
  {
    "mogulla3/rspec.nvim",
    config = function()
      require('rspec').setup {
        open_quickfix_when_spec_failed = false,
      }
      vim.keymap.set("n", "<leader>en", ":RSpecNearest<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ef", ":RSpecCurrentFile<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>er", ":RSpecRerun<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>eF", ":RSpecOnlyFailures<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>es", ":RSpecShowLastResult<CR>", { noremap = true, silent = true })
    end
  },
  {
    'monaqa/dial.nvim',
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.constant.alias.ja_weekday,
        },
      }
    end,
  },
  {
    'savq/melange',
    config = function()
      vim.cmd([[colorscheme melange]])
    end,
  },
  {
   'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        -- columns = {
        --   "icon",
        -- },
        keymaps = {
          ["?"] = "actions.show_help",
          ["-"] = "actions.parent",
          ["<C-l>"] = "actions.refresh",
          ["<CR>"] = "actions.select",
          ["<C-t>"] = "actions.select_tab",
          ["<C-m>"] = "actions.preview",
          ["g."] = "actions.toggle_hidden",
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = true,
        },
      })

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set("n", "<leader>f", ':execute ":e" expand("%:h")<CR>', { noremap = true, silent = true })
    end
  },
  -- {
  --   'cocopon/vaffle.vim',
  --   config = function()
  --     vim.g.vaffle_show_hidden_files = 1
  --   end,
  -- },
  {
    'folke/noice.nvim',
    dependencies = {
      'rcarriga/nvim-notify',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'tyru/open-browser.vim',
    init = function()
      vim.g.openbrowser_browser_commands = {
        {
          name = 'lemonade',
          args = {'{browser}', 'open', '{uri}'}
        }
      }
    end
  },
  {
    'tyru/open-browser-github.vim',
    dependencies = { 'tyru/open-browser.vim' }
  },
  {
    'xiyaowong/nvim-transparent',
    lazy = false,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    init = function()
      require"telescope".load_extension("frecency")
    end,
    dependencies = {"kkharji/sqlite.lua"}
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    init = function()
      require('telescope').load_extension('media_files')
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
  },
  {
    'monaqa/dial.nvim',
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    init = function()
      vim.opt.list = true

      require("indent_blankline").setup {
        show_end_of_line = true,
      }
    end,
  },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
}

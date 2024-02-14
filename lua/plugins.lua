return {
  'nvim-lua/popup.nvim',
  'MunifTanjim/nui.nvim',
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
  'folke/neodev.nvim',
  'machakann/vim-highlightedyank',
  'dhruvasagar/vim-table-mode',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'vim-denops/denops.vim',
  'rhysd/clever-f.vim',
  {
  "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true

      local keymap = vim.keymap.set
      -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
      keymap(
        "i",
        "<C-g>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, script = true, replace_keycodes = false }
      )
      keymap("i", "<C-j>", "<Plug>(copilot-next)")
      keymap("i", "<C-k>", "<Plug>(copilot-previous)")
      keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
      keymap("i", "<C-s>", "<Plug>(copilot-suggest)")

    end
  },
  { 'kiran94/s3edit.nvim', config = true, cmd = "S3Edit"},
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
        default_file_explorer = true,
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
    'lukas-reineke/indent-blankline.nvim',
    init = function()
      -- vim.opt.list = true
      local highlight = {
          "CursorColumn",
          "Whitespace",
      }
      require("ibl").setup {
          indent = { highlight = highlight, char = "" },
          whitespace = {
              highlight = highlight,
              remove_blankline_trail = false,
          },
          scope = { enabled = false },
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
  {
    'rainbowhxch/accelerated-jk.nvim',
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      'neovim/nvim-lspconfig',
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup_handlers({
        function(server_name)
          local opts = {}
          opts.on_attach = function(_, bufnr)
            local bufopts = { silent = true, buffer = bufnr }
          end
          nvim_lsp[server_name].setup(opts)
        end,
      })
      vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
      vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
      vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
      vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
      vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
      vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    end
  },
}

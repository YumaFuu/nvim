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
  -- 'nvim-treesitter/nvim-treesitter-context',
  'vim-denops/denops.vim',
  'rhysd/clever-f.vim',
  'lambdalisue/kensaku.vim',
  {
    'lambdalisue/kensaku-search.vim',
    config = function()
      vim.api.nvim_set_keymap(
        'c',
        '<CR>',
        '<Plug>(kensaku-search-replace)<CR>',
        {noremap = true, silent = true}
      )
    end
  },
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
    config = function()
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
      local opts = { noremap = true, silent = true }
      local Terminal = require("toggleterm.terminal").Terminal
      local lazydocker = Terminal:new({
        cmd = "lazydocker",
        -- dir = "git_dir",
        direction = "float",
        hidden = true,
        close_on_exit = true,
        float_opts = {
          border = "curved",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Space>d", "<CMD>close<CR>", opts)
        end,
      })
      function _toggleLazydockerTerminal()
        lazydocker:toggle()
      end

      vim.api.nvim_set_keymap("n", "<Space>d", "<cmd>lua _toggleLazydockerTerminal()<CR>", opts)

      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        hidden = true,
        close_on_exit = true,
        float_opts = {
          border = "curved",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-\\>", "<CMD>close<CR>", opts)
        end,
      })

      function _toggleLazygitTerminal()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<c-\\>", "<cmd>lua _toggleLazygitTerminal()<CR>", opts)
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
    'rmehri01/onenord.nvim',
    config = function() vim.cmd("colorscheme onenord") end,
  },
  -- {
  --   'savq/melange',
  --   config = function()
  --     vim.cmd([[colorscheme melange]])
  --   end,
  -- },
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
        columns = {
          -- "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
      })

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set(
        "n",
        "<leader>f",
        ':execute ":e" expand("%:h")<CR>',
        { noremap = true, silent = true }
      )
    end
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
    'xiyaowong/nvim-transparent',
    lazy = false,
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
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({})
    end
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({--[[ your config ]]})
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require 'rainbow-delimiters'

      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterRed',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  { 'lewis6991/gitsigns.nvim' },
  {
    'kevinhwang91/nvim-hlslens',
    init = function() require('hlslens').setup() end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = true end,
    opts = {
      -- animation = true,
      -- insert_at_start = true,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '<C-p>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<C-n>', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<D-<>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<D->>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<D-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<D-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<D-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<D-4>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<D-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<D-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<D-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<D-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<D-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<D-0>', '<Cmd>BufferLast<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      map('n', '<Space>bp', '<Cmd>BufferPick<CR>', opts)
      -- Sort automatically by...
      map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
      map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
      map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
      map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
      map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
    end
  },
  { 'kevinhwang91/nvim-bqf' },
  {
    'kazhala/close-buffers.nvim',
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map(
        'n',
        '<leader>q',
        "<cmd>BDelete this<CR>",
        opts
      )
      map(
        'n',
        '<leader>o',
        "<cmd>BDelete other<CR>",
        opts
      )
    end
  },
  {
    'b0o/incline.nvim',
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 2 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#44406e',
          }
        end,
      }
    end
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
  {
    'sindrets/diffview.nvim',
  },
  {
    'lambdalisue/guise.vim',
  },
}

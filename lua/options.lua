local o = vim.opt

vim.cmd([[
  hi NormalFloat guibg=None
  hi FloatBorder guibg=None guifg=#444444
  hi ActiveWindow guibg=None
  hi InactiveWindow guibg=None
  set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC
]])

o.fillchars = {
  vert = '│',
  vertleft  = '┤',
  vertright = '├',
  verthoriz = '┼',
  horiz = '─',
  horizup = '┴',
  horizdown = '┬',
  eob = ' ',
}
o.termguicolors = true
o.confirm = true
o.ts = 4
o.backup = false
o.swapfile = false
o.compatible = false
o.cursorline = false
o.cursorcolumn = false
o.smartindent = true
o.showmatch = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.list = true
o.listchars = {tab='▸-', trail='·', extends='»', precedes='«', nbsp='%'}
o.fileformats = "unix,dos,mac"
o.fileencodings = "utf-8,sjis"
o.hlsearch = true
o.ignorecase = true
o.ruler = true
o.autoread = true
o.backspace = "indent,eol,start"
o.exrc = true
o.secure = true
o.nu = true
o.wildmenu = true
o.wildmode = "full"
o.encoding = 'UTF-8'
o.splitbelow = true
o.splitright = true
o.foldtext = "FoldCCtext()"
o.clipboard:append{'unnamedplus'}
o.laststatus = 3
o.cmdheight = 1

-- vim.api.nvim_create_augroup( 'lua', {} )
-- vim.api.nvim_create_autocmd( 'bufwritepre', {
--   group = 'lua',
--   callback = function() print('insert enter') end
-- })

if vim.fn.has('linux') == 1 then
  vim.g.clipboard = {
    name = 'lemonade',
    copy = {
      ['+'] = 'lemonade copy',
      ['*'] = 'lemonade copy',
    },
    paste = {
      ['+'] = 'lemonade paste',
      ['*'] = 'lemonade paste',
    },
    cache_enabled = 0,
  }
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

maps = {
  n = {
    [';']          = ':',
    ['te']         = ':execute ":e" expand("%:h")<CR>',
    ['<C-[><C-[>'] = ':nohlsearch<CR><Esc>',
    ['j']          = 'gj',
    ['k']          = 'gk',
    ['R']          = '<Plug>(operator-replace)',
    ['go']         = '<Plug>(openbrowser-smart-search)',
    ["<C-[><C-[>"] = ':nohl<CR>',
    ["<ECS><ECS>"] = ':nohl<CR>',
    ['<Leader>c'] = '<plug>(operator-camelize-toggle)',
  },
  i = {
    ['<C-h>'] = '<Left>',
    ['<C-l>'] = '<Right>',
  },
  v = {
    ['go'] = '<Plug>(openbrowser-smart-search)',
  },
}

for mode, _maps in pairs(maps) do
  for k, v in pairs(_maps) do
    vim.keymap.set(mode, k, v, { noremap = true, silent = true })
  end
end

vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})

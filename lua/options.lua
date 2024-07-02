local hl = vim.api.nvim_set_hl

hl(0, 'NormalFloat', { bg=None })
hl(0, 'FloatBorder', { bg=None, fg='#444444' })
hl(0, 'ActiveWindow', { bg=None })
hl(0, 'InactiveWindow', { bg=None })
hl(0, 'LineNr', { fg='#3A3A3A' })
hl(0, 'NotifyBackground', { bg=None })
hl(0, "TelescopeNormal", { bg=None })
hl(0, "HlSearchNear", { bg='#444444', fg='#7CB0FF' })
hl(0, "HlSearchLens", { bg=None, fg='#7CB0FF' })
hl(0, "HlSearchLensNear", { bg='None', fg='#7BAFDA' })

vim.cmd("set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC")

local o = vim.opt

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


local map = vim.api.nvim_set_keymap
maps = {
  n = {
    -- [';']          = ':',
    -- ['te']         = ':execute ":e" expand("%:h")<CR>',
    ['te']         = '<cmd>execute ":tabe" expand("%:h")<CR>',
    ['<C-[><C-[>'] = '<cmd>noh<CR><Esc>',
    ['C-l']        = '<cmd>noh<CR>',
    ["<C-[><C-[>"] = '<cmd>noh<CR>',
    ["<ECS><ECS>"] = '<cmd>noh<CR>',
    ['j']          = 'gj',
    ['k']          = 'gk',
    ['R']          = '<Plug>(operator-replace)',
    ['go']         = '<Plug>(openbrowser-smart-search)',
    ['<Leader>c'] = '<plug>(operator-camelize-toggle)',
    ['<C-n>'] = '<cmd>tabnext<CR>',
    ['<C-p>'] = '<cmd>tabprevious<CR>',
    ['tt'] = '<cmd>terminal<CR>',
    ['tv'] = '<cmd>vsplit | terminal<CR>',
    ['ts'] = '<cmd>split | terminal<CR>',
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

vim.cmd([[
" ターミナルを開いたらに常にinsertモードに入る
autocmd TermOpen * :startinsert
" ターミナルモードで行番号を非表示
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

tnoremap <C-W><C-J>   <cmd>wincmd j<cr>
tnoremap <C-W>j       <cmd>wincmd j<cr>
tnoremap <C-W><C-K>   <cmd>wincmd k<cr>
tnoremap <C-W>k       <cmd>wincmd k<cr>
tnoremap <C-W><C-H>   <cmd>wincmd h<cr>
tnoremap <C-W>h       <cmd>wincmd h<cr>
tnoremap <C-W><C-L>   <cmd>wincmd l<cr>
tnoremap <C-W>l       <cmd>wincmd l<cr>

]])


vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})

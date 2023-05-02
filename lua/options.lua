vim.opt.termguicolors = true
vim.opt.confirm = true
vim.opt.ts = 4
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.compatible = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = {tab='▸-', trail='·', extends='»', precedes='«', nbsp='%'}
vim.opt.fileformats = "unix,dos,mac"
vim.opt.fileencodings = "utf-8,sjis"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.ruler = true
vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start"
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.nu = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.encoding = 'UTF-8'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldtext = "FoldCCtext()"
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.showtabline = 2
vim.opt.cmdheight = 1

vim.api.nvim_create_augroup( 'lua', {} )
vim.api.nvim_create_autocmd( 'bufwritepre', {
  group = 'lua',
  callback = function() print('insert enter') end
})

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

vim.api.nvim_exec([[
  function! TrimWhitespace()
    %s/\s\+$//e
  endfunction
  autocmd BufWritePre * call TrimWhitespace()
]], true)

maps = {
  n = {
    [';']          = ':',
    ['te']         = ':execute ":tabe" expand("%:h")<CR>',
    ['<C-[><C-[>'] = ':nohlsearch<CR><Esc>',
    ['<C-n>']      = 'gt<CR>',
    ['<C-p>']      = 'gT<CR>',
    ['j']          = 'gj',
    ['k']          = 'gk',
    ['R']          = '<Plug>(operator-replace)',
    ['go']         = '<Plug>(openbrowser-smart-search)',
    ["<Leader>'"]  = ':Telescope frecency workspace=CWD<CR>',
    ["<Leader>\""]  = ':Telescope find_files<CR>',
    ["<Leader>b"]  = ':Telescope buffers<CR>',
    ["<Leader>a"]  = ':Telescope live_grep<CR>',
    ["<C-[><C-[>"] = ':nohl<CR>',
    ["<ECS><ECS>"] = ':nohl<CR>',
    ["<C-g>"] = ':execute ":tabe" expand("%:h")<CR>:Telescope find_files<CR>',
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
vim.keymap.set("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
vim.keymap.set("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})

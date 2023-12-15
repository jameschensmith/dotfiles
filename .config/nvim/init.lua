local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',
        },
    },
})

-- NOTE: `mason.nvim` requires setup to be done in this order
require('mason').setup()
require('mason-lspconfig').setup()
require('neodev').setup()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({
    Lua = {
        telemetry = { enable = false },
    },
})

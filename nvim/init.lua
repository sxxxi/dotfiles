require("config.lazy")

vim.api.nvim_set_keymap('n', '<C-p>', '<ESC>:Telescope file_browser<CR><ESC>', { noremap = true, silent = true })

vim.cmd([[
    filetype plugin indent on
    syntax on
    set clipboard=unnamed
    set number
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set autoread
    set relativenumber
]])

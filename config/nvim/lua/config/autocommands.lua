vim.api.nvim_clear_autocmds({event={'FocusLost'}})

-- Save file when leaving the buffer, but only if it's not readonly
vim.api.nvim_create_autocmd('FocusLost', {
    pattern = {'*'},
	callback = function()
		if vim.bo.buftype == '' and not vim.bo.readonly then
            vim.cmd('w')
		end
    end
})

-- File specific settings
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function()
	end
})

if vim.g.save_clipboard_on_exit ~= nil then
	return
end
vim.g.save_clipboard_on_exit = 1

local groupname = "save_clipboard_on_exit"
vim.api.nvim_create_augroup(groupname, { clear = true })

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		require("save-clipboard-on-exit").save()
	end,
	once = true,
})

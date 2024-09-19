if vim.g.loaded_testplugin then
	return
end
vim.g.loaded_testplugin = true

vim.api.nvim_command('command! -nargs=0 FetchTodos lua require("test-plugin").fetch_todos()')
vim.api.nvim_command('command! -nargs=0 InsertTodo lua require("test-plugin").insert_todo()')
vim.api.nvim_command('command! -nargs=0 CompleteTodo lua require("test-plugin").complete_todo()')

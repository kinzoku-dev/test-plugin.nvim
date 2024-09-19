local sqlite = require("sqlite")

local M = {}

M.init_tbl_query =
	"CREATE TABLE todo_list(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL, completed TEXT DEFAULT 'No');"

function M.create_db(dir)
	if M.db_exists(dir) then
		return
	end
	if M.table_exists(dir) then
		os.execute("sqlite3 " .. dir .. '/todo.db ".exit"')
	else
		os.execute("sqlite3 " .. dir .. '/todo.db "' .. M.init_tbl_query .. '" ".exit"')
	end
end

function M.delete_db(dir)
	if M.db_exists(dir) then
		os.execute("rm " .. dir .. "/todo.db")
	end
end

function M.db_exists(dir)
	local f = io.open(dir .. "/todo.db", "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function M.table_exists(dir)
	local db = sqlite:open(dir .. "/todo.db")

	local res = db:select("todo_list")
	if res ~= {} then
		return true
	else
		return false
	end
end

return M

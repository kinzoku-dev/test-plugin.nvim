local sqlite = require("sqlite")
local dbm = require("test-plugin.db")

local M = {}

function M.fetch_todos(dir)
	if dbm.db_exists(dir) ~= true then
		dbm.create_db(dir)
	end
	local db = sqlite:open(dir .. "/todo.db")

	local db_results = db:select("todo_list", {
		where = { completed = "No" },
	})
	-- "SELECT * FROM todo_list WHERE completed == 'No';"
	print("=========")
	print("= Todos =")
	print("=========")
	print("")
	for _, item in pairs(db_results) do
		print("----------")
		print("Description : " .. item.description)
		print("completed : " .. item.completed)
	end
	db:close()
end

return M

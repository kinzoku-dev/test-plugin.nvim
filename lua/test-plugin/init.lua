local fetch = require("test-plugin.fetch")
local update = require("test-plugin.update")
local db = require("test-plugin.db")

local M = {}

_config = {}

function M.setup(config)
	_config = config
end

local dir = _config.sqlite_db_dir or "~/.cache/test-plugin_nvim"

function M.fetch_todos()
	fetch.fetch_todos(dir)
end
function M.insert_todo()
	update.insert_todo(dir)
end
function M.complete_todo()
	update.complete_todo(dir)
end
function M.create_db()
	db.create_db(dir)
end
function M.delete_db()
	db.delete_db(dir)
end
function M.db_exists()
	db.db_exists(dir)
end

return M

require 'sqlite3'

class SQLite < Database
	def initialize(db)
		connect db
	end
	def dispose
		disconnect
	end
	
	def connect(addr)
		@db = SQLite3::Database.new addr
	end
	def disconnect
		@db.close
	end
	
	def prepare(query)
		@db.prepare query
	end
	def execute(query)
		@db.execute query
	end
end

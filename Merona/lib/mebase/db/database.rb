class Database
	def initialize(addr="localhost", port=9999, id="public", pw="")
		connect(addr, port , id, pw)
	end
	def dispose
		disconnect
	end
	
	def connect(addr="localhost", port=9999, id="public", pw="")
	end
	def disconnect
	end
	
	def prepare(query)
	end
	def execute(query)
	end
	
	def select(table, row, condition="", option="")
		stm = prepare("select #{row} from #{table} #{condition=="" ? "" : "where"} #{condition} #{option};")
		return stm, stm.execute
	end
	def update(table, update, condition="", option="")
		execute("update #{table} set #{update} #{condition=="" ? "" : "where"} #{condition} #{option};")
	end
	def insert(table, row, data, option="")
		execute("insert into #{table} (#{row}) values (#{data}) #{option};")
	end
	def delete(table, condition, option="")
		execute("delete from #{table} #{condition=="" ? "" : "where"} #{condition} #{option};")
	end
end
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
	def execute(stm)
	end
	def next(rs)
	end
	
	def select(table, row, condition="", option="")
		stm = prepare("select #{row} from #{table} #{condition=="" ? "" : "where"} #{condition} #{option};")
		return stm, execute(stm)
	end
	def update(table, update, condition="", option="")
		stm = prepare("update #{table} set #{update} #{condition=="" ? "" : "where"} #{condition} #{option};")
		return stm, execute(stm)
	end
	def insert(table, row, data, option="")
		stm = prepare("insert into #{table} (#{value}) values (#{data}) #{option};")
		return stm, execute(stm)
	end
	def delete(table, condition, option="")
		stm = prepare("delete from #{table} #{condition=="" ? "" : "where"} #{condition} #{option};")
		return stm, execute(stm)
	end
end
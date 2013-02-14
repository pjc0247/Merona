class Database
	def initialize(addr="localhost", port=9999, id="public", pw="")
	end
	def dispose
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
	
	def select(table, row, condition, option="")
		stm = prepare("select #{row} from #{table} where #{condition} #{option};")
		return stm, execute(stm)
	end
	def update(table, update, condition, option="")
		stm = prepare("update #{table} set #{update} where #{condition} #{option};")
		return stm, execute(stm)
	end
	def insert(table, row, data, option="")
		stm = prepare("insert into #{table} (#{value}) values (#{data}) #{option};")
		return stm, execute(stm)
	end
	def delete(table, condition, option="")
		stm = prepare("delete from #{table} where #{condition} #{option};")
		return stm, execute(stm)
	end
end
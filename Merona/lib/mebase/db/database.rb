class Database
	def initialize
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
		"select "+table+" from "+row" where "+condition+" "+option+";";
	end
	def update
	end
	def insert
	end
	def delete
	end
end
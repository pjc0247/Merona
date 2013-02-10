class Database
	def initialize
	end
	def dispose
	end
	
	def connect
	end
	def disconnect
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
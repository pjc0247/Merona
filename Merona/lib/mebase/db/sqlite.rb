require 'sqlite3'

class SQLite < Database
	def initialize(db)
		@db = SQLite3::Databases.new db
	end
	def dispose
		@db.close
	end
	
	def prepare(query)
		@db.prepare query
	end
	def execute(stm)
		@stm.execute
	end
	def next(rs)
		@rs.next
	end
	
	def select(table, row, condition, option="")
		stm = prepare("select #{row} from #{table} where #{condition} #{option};")
		execute(stm)
	end
end

puts "ASDF"
begin
    
    db = SQLite3::Database.new ":memory:"
    puts db.get_first_value 'SELECT SQLITE_VERSION()'
	
rescue SQLite3::Exception => e 
    
    puts "Exception occured"
    puts e
    
ensure
    db.close if db
end
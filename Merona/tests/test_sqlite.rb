load '../lib/mebase/db/database.rb'
load '../lib/mebase/db/sqlite.rb'

load 'test_util.rb'

begin

	db = SQLite.new("test.db")

	# create table
	db.execute "create table account(id TEXT, nick TEXT)"
	db.insert("account", "id, nick", "'hello', 'world'")
	db.insert("account", "id, nick", "'aaa', 'bbb'")
	db.insert("account", "id, nick", "'foo', 'bar'")

	# enum table data
	rs = db.select("account", "*")
	
	while (row = rs.next)
		p row
	end
	
	rs.close

	db.dispose
	
rescue SQLite3::Exception => e 
	puts "[error] " + e.to_s
end
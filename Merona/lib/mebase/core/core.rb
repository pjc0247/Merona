def polling(&block)
	EventMachine.run block
end

def meInitialize
	
	t = Time.new 
	logfile = "log/#{t.year}.#{t.month}.#{t.day}.log"
	Log.logfile = File.new(logfile, "a")
	
	return true
end
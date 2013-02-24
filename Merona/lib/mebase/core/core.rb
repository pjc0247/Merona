def polling(&block)
	EventMachine.run block
end

def meInitialize
	
	Signal.trap("INT")  do
		Log.output "quit by user"
		EventMachine.stop
	end
  
	t = Time.new 
	logfile = "log/#{t.year}.#{t.month}.#{t.day}.log"
	Log.logfile = File.new(logfile, "a")
	
	return true
end
# Merona main

import 'mebase/merona'

begin
	if meInitialize
		Log.output "Merona engine started"
	else
		Log.output "Cannot initialize Merona!!"
	end
	
	polling do
		# write code here
		
		test = Server.new("test", 9916)
		test.add_handler ChatHandler
	end
end
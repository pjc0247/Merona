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
		
		Server.new("test", 9916)
	end
end
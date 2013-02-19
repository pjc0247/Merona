# Merona main

import 'mebase/merona'
import 'config_db.rb'

begin
	if meInitialize
		Log.output "Merona engine started"
	else
		Log.output "Cannot initialize Merona!!"
	end
	
	polling do
		# write code here
		
		pubsub = Server.new("pubsub", 9911)
	end
end
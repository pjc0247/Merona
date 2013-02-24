# Merona main

import 'mebase/merona'
import 'config/*'

begin
	if meInitialize
		Log.output "Merona engine started"
	else
		Log.error "Cannot initialize Merona!!"
	end
	
	polling do
		# write code here
		
		$oid = 0
	
		test = Server.new("test", 9916)
		test.add_handler ChatHandler
		test.add_handler PubsubHandler
		test.add_handler SyncHandler
	end
	
rescue
	Log.output "[Error] : #{$!}"
end
# Merona main

import 'merona'

import 'dbms/*'
import 'sharedmem/*'
import 'handler/*'
import 'protocol/*'

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
	
		echo = Server.new("echo_server", 9916)
		echo.add_handler EchoHandler
	end
	
rescue
	Log.error "#{$!}"
end
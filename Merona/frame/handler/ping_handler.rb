require 'win32api'

$t = Win32API.new("kernel32", "GetTickCount", nil, 'L')
$t.call()

class PingHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::PING
				connection.send packet
		end
	end
end
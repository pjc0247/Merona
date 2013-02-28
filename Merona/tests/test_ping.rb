require 'eventmachine'

load '../lib/packet/packet.rb'
load '../lib/protocol/pubsub_protocol.rb'
load '../lib/protocol/sync_protocol.rb'

load 'test_util.rb'

require 'Win32API'

$t = Win32API.new("kernel32", "GetTickCount", nil, 'L')
$t.call()

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	def initialize(*args)
		p = Packet.new
		p.id = Protocol::SUBSCRIBE
		send_object p
		
		p.id = 1
		
		100.times do
			p["ping"] = $t.call()	
			send_object p
			p "send " + ($t.call() - p["ping"]).to_s
		end
	end
	def unbind
	end
	
	def receive_object(obj)
		p "reply " + ($t.call() - obj["ping"]).to_s
	end
end

EM::run do
	EM::connect "localhost", 9916, Connection
end

	
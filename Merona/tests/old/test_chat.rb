require 'socket'

load '../lib/protocol/chat_protocol.rb'
load '../lib/packet/packet.rb'
load '../lib/packet/chat_packet.rb'

load 'test_util.rb'

if ARGV.size == 2
	addr = ARGV[0]
	port = ARGV[1]
else
	addr = "localhost"
	port = 9916
end
sock = TCPSocket.new addr, port

packet = ChatPacket.new
packet.id = Protocol::CHAT
packet.sender = "Aqwer"
packet.msg = "AEWF"

send_obj(sock, packet)
require 'socket'

def send_obj(sock,obj)
	data = Marshal.dump(obj)
	sock.send [data.respond_to?(:bytesize) ? data.bytesize : data.size, data].pack('Na*'), 0
end
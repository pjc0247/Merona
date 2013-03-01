class Packet
	attr_accessor :id
	attr_accessor :size
	attr_accessor :data
	attr_accessor :ch
	
	def initialize(id = 0, ch = "*")
		@data = {}
		
		@id = id
		@ch = ch
	end
	def dispose
	end
	
	def freeze
		data = Marshal.dump(self)
        [data.respond_to?(:bytesize) ? data.bytesize : data.size, data].pack('Na*')
	end
	
	# 패킷에 데이터를 넣는다
	def push(name,data)
		if name == nil
			return
		end
		
		@data[name] = data
	end
	
	# 패킷에서 데이터를 가져온다
	def get(name)
		if name == nil
			return
		end
		
		@data[name]
	end
	
	# 패킷에 데이터를 넣는다
	def []=(name,data)
		push(name, data)
	end
	
	# 패킷에서 데이터를 가져온다
	def [](name)
		get(name)
	end

	# 패킷을 전송할 채널을 설정한다
	def ch=(ch)
		@ch = ch
	end
	
	# 패킷의 채널 값을 가져온다
	def ch
		@ch
	end
end
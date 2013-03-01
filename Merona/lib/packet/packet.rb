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
	
	# ��Ŷ�� �����͸� �ִ´�
	def push(name,data)
		if name == nil
			return
		end
		
		@data[name] = data
	end
	
	# ��Ŷ���� �����͸� �����´�
	def get(name)
		if name == nil
			return
		end
		
		@data[name]
	end
	
	# ��Ŷ�� �����͸� �ִ´�
	def []=(name,data)
		push(name, data)
	end
	
	# ��Ŷ���� �����͸� �����´�
	def [](name)
		get(name)
	end

	# ��Ŷ�� ������ ä���� �����Ѵ�
	def ch=(ch)
		@ch = ch
	end
	
	# ��Ŷ�� ä�� ���� �����´�
	def ch
		@ch
	end
end
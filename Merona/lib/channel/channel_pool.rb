class ChannelPool
	def initialize
		@channel = {}
	end
	def dispose
	end
	
	# ä�� �̸��� ��ūȭ�ؼ� �ֻ��� ������ ä�ο� ������ �� ����
	# �ڵ� ����� �����Ų��.
	#
	# ex ) "ch.map.party"
	#       "ch.map"
	#       "ch"
	def tokenize(name, &block)
		token = name.split(".")
		if token.size > 1
			ch = ""
			for i in 0..token.size-2
				ch += token[i] + "."
			end
			ch = ch[0..ch.length-2]
			
			block.call ch
		end
	end
	
	# ������ �̸��� ä���� �����Ѵ�
	def subscribe(name, client)
		tokenize(name) do |t|
			subscribe t, client
		end
		
		if @channel[name] == nil
			@channel[name] = Channel.new
		end
		
		@channel[name].subscribe client
	end
	
	# ������ �̸��� ä���� ������ �����Ѵ�
	def unsubscribe(name, client)
		tokenize(name) do |t|
			unsubscribe t, client
		end
		
		return if @channel[name] == nil
		
		if not @channel[name].unsubscribe(client)
			@channel[name].delete name
		end
	end
	
	# ������ �̸��� ä�ο� ��Ŷ�� �����Ѵ�
	def publish(name, packet)
		return if @channel[name] == nil
		
		@channel[name].publish packet
	end
end
class ChannelPool
	def initialize
		@channel = {}
	end
	def dispose
	end
	
	# 채널 이름을 토큰화해서 최상위 레벨의 채널에 도달할 때 까지
	# 코드 블록을 실행시킨다.
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
	
	# 지정된 이름의 채널을 구독한다
	def subscribe(name, client)
		tokenize(name) do |t|
			subscribe t, client
		end
		
		if @channel[name] == nil
			@channel[name] = Channel.new
		end
		
		@channel[name].subscribe client
	end
	
	# 지정된 이름의 채널의 구독을 해지한다
	def unsubscribe(name, client)
		tokenize(name) do |t|
			unsubscribe t, client
		end
		
		return if @channel[name] == nil
		
		if not @channel[name].unsubscribe(client)
			@channel[name].delete name
		end
	end
	
	# 지정된 이름의 채널에 패킷을 전송한다
	# 
	# to_super 인자가 true일 경우 상위 채널 모두에도 패킷을 전송
	def publish(name, packet, to_super = false)
		if to_super == true
			tokenize(name) do |t|
				publish t, packet
			end
		end
		
		return if @channel[name] == nil
		
		@channel[name].each do |client|
			client.publish packet
		end
	end
end
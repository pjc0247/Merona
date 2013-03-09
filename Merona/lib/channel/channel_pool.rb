class ChannelPool
	# ChannelPool을 초기화한다.
	def initialize
		@channel = {}
	end
	
	# ChannelPool을 정리한다.
	def dispose
	end
	
	# 채널 이름을 토큰화해서 최상위 레벨의 채널에 도달할 때 까지
	# 코드 블록을 실행시킨다.
	#
	# name : 토큰화할 채널 이름
	# &block : 토큰 후 실행될 블록
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
	#
	# name : 구독할 채널의 이름
	# client : 구독할 클라이언트
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
	#
	# name : 구독 해지할 채널의 이름
	# client : 구독 해지할 클라이언트
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
	# name : 전송할 채널의 이름
	# packet : 전송할 패킷
	def publish(name, packet)
		return if @channel[name] == nil
		
		@channel[name].publish packet
	end
end
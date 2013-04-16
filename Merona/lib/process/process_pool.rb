class WorkItem
	attr_accessor :packet
	attr_accessor :sender
	
	def initialize(sender, packet)
		@packet = packet
		@sender = sender
	end
end

class ProcessPool
	def initialize(server)
		@server = server
		@worker = Array.new
		
		@queue = Queue.new
	end
	def dispose
	end
	
	# 지정된 개수만큼의 일꾼을 생성한다
	#
	# n : 생성할 일꾼의 개수
	def create_worker(n)
		n.times do
			thread = Thread.new do
				while true
					item = @queue.deq(false)
					
					# 보낸이가 죽어있으면 패킷 무시
					next if item.sender.is_alive? == false
					
					@server.handler.each do |handler|
						handler.recv(@server, item.sender, item.packet)
					end
				end
			end
			
			@worker.push thread
		end
	end
	
	# 모든 일꾼을 없엔다
	def kill
		@worker.each do |worker|
			worker.kill
		end
	end
	
	# 큐에 패킷을 넣는다
	#
	# sender : 패킷을 전송한 클라이언트
	# item : 넣을 패킷
	def enqueue(sender, item)
		@queue.push WorkItem.new(sender, item)
	end
end
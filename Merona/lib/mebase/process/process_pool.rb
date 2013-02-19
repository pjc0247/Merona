class WorkItem
	attr_accessor :packet
	attr_accessor :sender
	
	def initialize(packet, sender)
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
	
	def create_worker(n)
		n.times do
			thread = Thread.new do
				while true
					item = @queue.deq(false)
					
					@server.handler.each do |handler|
						handler.recv(@server, item.sender, item.packet)
					end
				end
				
				@worker.push thread
			end
		end
	end
	def kill
		@worker.each do |worker|
			worker.kill
		end
	end
	
	def enqueue(sender, item)
		@queue.push WorkItem.new(sender, item)
	end
	
end
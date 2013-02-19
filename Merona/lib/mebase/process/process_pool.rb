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
			conn = 0
			thread = Thread.new do
				while true
					if not @queue.empty?
						item = @queue.pop
						
						@server.handler.each do |handler|
							handler.recv(@server, item.sender, item.packet)
						end
					end
				end
			end
			
			@worker.push conn
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
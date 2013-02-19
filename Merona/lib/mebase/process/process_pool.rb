require 'win32/process'
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
	
	def enqueue(item)
		@queue.push item
	end
	
end
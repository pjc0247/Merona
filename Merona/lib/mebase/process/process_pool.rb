require 'win32/process'
class ProcessPool
	def initialize
		@worker = Array.new
		
		@queue = Queue.new
	end
	def dispose
	end
	
	def create_worker(n, port)
		n.times do
			thread = Thread.new do
				polling do
					EventMachine.connect("127.0.0.1", port, WorkerConnection, self)
				end
			end
			
			@worker.push thread
		end
	end
	def kill
		@worker.each do |worker|
			worker.kill
		end
	end
end
require 'eventmachine'

class WorkerState
	BUSY = 1
	IDLE = 2
end

class WorkerConnection < Connection
	attr_reader :state
	
	def initialize(*args)
		@thread = args[0]
		
		@state = WorkerState::IDLE
	end
	def unbind
	end
	
	def receive_object(obj)
		@state = BUSY
		super obj
		@state = IDLE
	end
	def kill
		@thread.kill
	end
end
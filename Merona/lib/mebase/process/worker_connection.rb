require 'eventmachine'

class WorkerState
	BUSY = 1
	IDLE = 2
end

class WorkerConnection < Connection
	attr_reader :state
	
	def initialize(*args)
		@state = WorkerState::IDLE
	end
	def unbind
	end
	
	def receive_object(obj)
		@state = BUSY
		super obj
		@state = IDLE
	end 
end
require 'eventmachine'

class Worker
	attr_reader :handler

	def initialize
		EventMachine.connect("127.0.0.1", 9911, WorkerConnection, self)

		@handler = Array.new
	end
	def dispose
	end
	
	def add_handler(handler)
		@handler.push handler.new
	end
	def delete_handler(handler)
		@handler.each do |value|
			if value.class == handler
				@handler.delete value
			end
		end
	end
end
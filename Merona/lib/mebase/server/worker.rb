require 'eventmachine'

class Worker
	def initialize
		EventMachine.connect("127.0.0.1", 9911, Connection, self)

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
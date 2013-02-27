$server = {}

class Server
	attr_reader :name
	attr_reader :port
	attr_reader :handler, :process
	attr_reader :pubsub
	
	attr_accessor :clients
	
	# ������ �����Ѵ�
	#
	# name : ������ �̸�
	# port : ������ ��Ʈ
	# klass : Connection �ڵ鷯 Ŭ����
	def initialize(name,port,klass=Connection)
		EventMachine.start_server("localhost", port, klass, self)

		@clients = Array.new
		@handler = Array.new
		
		@pubsub = ChannelPool.new
		@process = ProcessPool.new(self)
		@process.create_worker SERVER_WORKERS
		
		@name = name
		@port = port
		
		$server[@name] = self
	end
	
	# ������ �ڿ��� �����Ѵ�
	def dispose
		$server.delete @name
	end
	
	# ������ �ڵ鷯�� �߰��Ѵ�
	#
	# handler : �߰��� �ڵ鷯 Ŭ����
	def add_handler(handler)
		@handler.push handler.new
	end
	
	# ������ ��ϵ� �ڵ鷯�� �����Ѵ�
	#
	# handler : ������ �ڵ鷯 Ŭ����
	def delete_handler(handler)
		@handler.each do |value|
			if value.class == handler
				@handler.delete value
			end
		end
	end
	
	# �ش� ������ ������ Ŭ���̾�Ʈ ����� ���´�
	#
	# connection : ������ ����
	def exclude(connection)
		@clients.reject { |c| connection == c }
	end
	
	# ��� Ŭ���̾�Ʈ���� ��Ŷ�� ��ε�ĳ�����Ѵ�
	#
	# packet : ��ε�ĳ������ ��Ŷ
	# exclusion : ������ Ŭ���̾�Ʈ
	def broadcast(packet, exclusion = nil)
		(exclusion ? exclude(exclusion) : @clients).each do |client|
			client.send packet
		end
	end
end
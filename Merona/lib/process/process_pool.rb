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
	
	# ������ ������ŭ�� �ϲ��� �����Ѵ�
	#
	# n : ������ �ϲ��� ����
	def create_worker(n)
		n.times do
			thread = Thread.new do
				while true
					item = @queue.deq(false)
					
					# �����̰� �׾������� ��Ŷ ����
					next if item.sender.is_alive? == false
					
					@server.handler.each do |handler|
						handler.recv(@server, item.sender, item.packet)
					end
				end
			end
			
			@worker.push thread
		end
	end
	
	# ��� �ϲ��� ������
	def kill
		@worker.each do |worker|
			worker.kill
		end
	end
	
	# ť�� ��Ŷ�� �ִ´�
	#
	# sender : ��Ŷ�� ������ Ŭ���̾�Ʈ
	# item : ���� ��Ŷ
	def enqueue(sender, item)
		@queue.push WorkItem.new(sender, item)
	end
end
class Handler
	def initialize
	end
	def dispose
	end
	
	# ��Ŷ�� �������� �� �ҷ����� �޼ҵ�
	#
	# server : ������ ����
	# connection : ��Ŷ�� ���� Ŭ���̾�Ʈ
	# packet : ������ ��Ŷ
	def recv(server,connection,packet)
		#case packet.id
		#	when Protocol::PacketID
		#		process code here
		#end
	end
end
class Message
	def initialize(observers)
		@observers = observers
	end

	def send(message_type)
		@observers.each do |observer|
			observer.message_sent(message_type)

		end
	end
			
end

class FriendMessage
	def message_sent(message_type)
		if message_type != "friend_message"
			return
		end
		puts "sending message to contact"
	end
end

class StrangerMessage
	def message_sent(message_type)
		if message_type != "stranger_message"
			return
		end

		puts "sending message to stranger"
	end
end


friend_message = FriendMessage.new
stranger_message = StrangerMessage.new
m = Message.new([friend_message, stranger_message])

m.send("stranger_message")
m.send("friend_message")

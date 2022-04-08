require "delegate"

class Contact
	def friend = 2

	def origin = "Irish phone number"
end

class Additional < SimpleDelegator
	def initialize(contact)
		@contact = contact
		super
	end

	def class = __getobj__.class

	def friend = @contact.friend + 1
end

contact = Contact.new
puts "Original number of contacts: (#{contact.origin}): #{contact.friend}"
newContact = Additional.new(contact)
puts "New number of contacts (#{newContact.origin}): #{newContact.friend}"
puts "New: #{newContact.class}" 
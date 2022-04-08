class Contact < ApplicationRecord
	has_one_attached :image
	belongs_to :user

	def self.search(search)
		if search
			contact = Contact.find_by(fname: search)
			if Contact
				self.where(userId: Contact)
			else
				Contact.all
			end
		else
			Contact.all
		end
	end
end

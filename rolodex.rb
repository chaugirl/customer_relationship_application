class Rolodex
	attr_reader :contacts
	@@index = 1000
	def initialize
		@contacts = [] # each Contact object is being stored in the contacts array.
					   # each Contact object is an element in the array
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def modify_contact(contact_id, attribute)
		puts "Changed!"
	end

	def display_all_contacts
		
	end

	def display_particular_contact
		
	end

	def display_info_by_attribute
		
	end

	def delete_contacts
		
	end
end
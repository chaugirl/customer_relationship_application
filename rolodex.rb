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

	# def modify_contact(contact_id_to_be_changed, attrib_to_be_modified)
	# 	@contacts.each do |contact|
	# 		if (@contacts.contact_id == contact_id_to_be_changed)
	# 			puts "Changed"
	# 		else
	# 			puts "Go to next contact"
	# 		end
	# 	end
	# end

	def display_particular_contact(id)
		@contacts.each do |contact|
			if contact.id != id
				next
			else 
				return contact
			end
		end
	end

	def display_info_by_attribute
		
	end

	def delete_contacts
		
	end
end
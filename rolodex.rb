require "pry"

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

	def modify_contact(id, attrib)
		@contacts.each do |contact|
			if contact.id != id
				next
			else
				case attrib 
				when 1 then 
					puts "What do you want to change first_name to?"
					change = gets.chomp.to_s
					puts "Changing #{contact.first_name} to #{change}"
					# binding.pry
					contact.first_name = change
				end
			end
		end
	end

	def display_particular_contact(id)
		@contacts.each do |contact|
			if contact.id != id
				next
			else 
				return contact
			end
		end
	end

	# def display_info_by_attribute(attrib)
	# 	@contacts.each do |contact|
	# 		if attrib == contacts[0]
	# 			return contact.first_name
	# 		end
	# 	end
	# end

	def delete_contacts
		
	end
end
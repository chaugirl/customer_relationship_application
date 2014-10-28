require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name # same as def name @name = name end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:" #choose 1
	end

	def main_menu
		puts "Welcome to #{@name}"
		while true
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7
			choose_option(input)
			#puts "input at main menu #{input}" 1
		end
	end

	def choose_option(option)
		#puts "input at choose_option: 	#{option}" #12
		#option = 12	
		#puts "input at choose_option after change #{option}" #1
		case option
		when 1 then add_new_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete_contact
		else
			puts "Invalid option."
			return
		end
	end

	#option 1
	def add_new_contact
		print "First Name: "
		first_name = gets.chomp
		print "Last Name: "
		last_name = gets.chomp
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp

		# see contact.rb
		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	#option 2
	def modify_contact
		display_all_contacts
		puts "Enter the contact ID of the person you want to modify: "
		contact_id_to_be_changed = gets.chomp.to_i
		puts "Which contact attribute should be modified:\n"
		puts "Enter 1 for first_name, 2 for last_name, 3 for email, 4 for note\n"
		attrib_to_be_modified = gets.chomp.to_i
		puts "Please confirm that you want #{attrib_to_be_modified} (y/n):"
		confirmation = gets.chomp
		if confirmation == "y"
			#prompt to change id, first_name, last_name, email, notes
			@rolodex.modify_contact(contact_id_to_be_changed, attrib_to_be_modified)
		else
			return
		end
	end

	#option 3
	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
		end
	end


	#option 4
	def display_contact
		puts "Which Contact ID would you like to display?"
		contact_id_to_be_displayed = gets.chomp.to_i
		contact = @rolodex.display_particular_contact(contact_id_to_be_displayed)
		puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
	end

	#option 5
	def display_attribute
		puts "Which attribute would you like to see?"
		attrib_to_be_shown = gets.chomp.downcase
		case attrib_to_be_shown
		when "id"
			@rolodex.contacts.each do |contact|
				puts "#{contact.id}"
			end
		when "first_name"
			@rolodex.contacts.each do |contact|
				puts "#{contact.first_name}"
			end
		when "last_name"
			@rolodex.contacts.each do |contact|
				puts "#{contact.last_name}"
			end
		when "email"
			@rolodex.contacts.each do |contact|
				puts "#{contact.email}"
			end
		when "note"
			@rolodex.contacts.each do |contact|
				puts "#{contact.note}"
			end
		end
	end


crm = CRM.new("Bitmaker Labs CRM") #crm is an instance of CRM
crm.main_menu
end

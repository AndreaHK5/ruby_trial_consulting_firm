require_relative 'reader_file.rb'

class RunParsing
	attr_accessor :lines_array
	# required for testing
	def start
		welcome
		define_input
		@lines_array = ReaderFile.new(@input).read_and_parse
		generate_output1
		generate_output2
		generate_output3
		goodbye
	end

	def welcome
		puts "Andrea Cremese, trial application for Cyrus Innovation"
		puts "March 2014 - see http://www.cyrusinnovation.com/code-test-ruby/ for the brief"
		puts "This is a Gino production, che credevate o'duri \n"
	end

	def define_input
		#include manual input for next revisions 
		puts "\n\nAs a standard, I will try reading the inputs stated in the brief in teh files input1, input2 and input3, located in the source folder"
		puts "Please type:\n - Y if this is ok.\n - The number of files provided (will look in the source folder)."
		puts " - Any other key to exit."
		puts "\n\n Your choice [Y, number of files, exit]:"
		choice = gets.chomp
		if choice.downcase == 'y'
			@input = ['input1.txt','input2.txt','input3.txt']
		elsif choice.to_i >= 1
			puts 'new files'
			get_input(choice.to_i)
		else
			puts "\nok, let's get out of here"
			goodbye
			abort
		end
			
	end

	def generate_output1
		puts "\n\nOutput 1 – sorted by gender (females before males) then by last name ascending\n"
		females = extract_gender('Female')
		males = extract_gender('Male')
		puts 'Females first, ordered by surname:'
		sort_by_surname(females).reverse_each {|hash| output_record(hash)}
		puts 'Males then, ordered by surname'
		sort_by_surname(males).reverse_each {|hash| output_record(hash)}
	end

	def generate_output2
		puts "\n\nOutput 2 – sorted by birth date, ascending."
		puts "ACr note - I interpret form oldest to youngest\n"
		sort_by_bday.each do |hsc1|
			output_record hsc1
		end
	end

	def generate_output3
		puts "\n\nOutput 3 – sorted by last name, descending."
		sort_by_surname(@lines_array).each {|hash| output_record(hash)}
	end

	def sort_by_surname array 
		array.sort_by {|hash| hash[:surname]}
	end

	def sort_by_bday
		@lines_array.sort_by {|hsc| hsc[:bday]}
	end

	def extract_gender gender
		@lines_array.collect {|hs| hs if hs[:gender] == gender}.compact
	end

	def output_record hash
		string = " #{hash[:surname]+" "+hash[:name]}"
		string << ", #{hash[:gender]+", born on "+hash[:bday].strftime("%m/%d/%Y")}"
		string << ", color: #{hash[:color]}"
		puts string
	end

	def goodbye
		puts "\n\nThanks for your time!"
		puts "Andrea Cremese, cremese@gmail.com, https://github.com/AndreaHK5\n\n"
	end

	def get_input num_files
		puts "Files to be located in the sources subfolder"
		@input = []
		num_files.times do |n|
			puts "Please enter name of file #{n+1} of #{num_files}"
			name_file = gets.chomp
			@input << name_file
		end
	end


end
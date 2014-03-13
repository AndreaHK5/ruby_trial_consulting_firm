require_relative 'reader_file.rb'
# require_relative 'parser.rb'
# require_relative 'output.rb'

class RunParsing
	def start
		welcome
		define_input
		@lines_array = Reader_file.new(@input).read_and_parse
		generate_output1
		generate_output2
		generate_output3
		goodbye
	end

	def welcome
		puts "Andrea Cremese test application for Cyrus Innovation"
		puts "March 2014 - see http://www.cyrusinnovation.com/code-test-ruby/ for the brief"
		puts "this is a Gino production, che credevate o'duri \n"
	end

	def define_input
		#inlcude manual input for next revisions 
		@input = ['input1.txt','input2.txt','input3.txt']
	end

	def generate_output1
		puts "\n\nOutput 1 – sorted by gender (females before males) then by last name ascending\n"
		females = extract_gender('Female')
		males = extract_gender('Male')
		puts 'Females first, ordered by surname:'
		sort_by_surname(females).each {|hash| output_name(hash)}
		puts 'Males then, ordered by surname'
		sort_by_surname(males).each {|hash| output_name(hash)}
	end

	def generate_output2
		puts "\n\nOutput 2 – sorted by birth date, ascending."
		puts "ACr note - I interpret form oldest to youngest\n"
		sort_by_bday.each do |hsc1|
			puts "#{hsc1[:name]} #{hsc1[:surname]} was born on #{hsc1[:bday].strftime("%m/%d/%Y")}"
		end
	end

	def generate_output3
		puts "\n\nOutput 3 – sorted by last name, descending."
		sort_by_surname(@lines_array).each {|hash| output_name(hash)}
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

	def output_name hash
		puts "#{hash[:surname]+" "+hash[:name]}"
	end

	def goodbye
		puts "\n\nThanks for your time!"
		puts "Andrea Cremese, cremese@gmail.com, https://github.com/AndreaHK5\n\n"
	end


end
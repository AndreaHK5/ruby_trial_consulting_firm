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
	end

	def welcome
		puts "Andrea Cremese test application for Cyrus Innovation"
		puts "March 2014 - see also http://www.cyrusinnovation.com/code-test-ruby/"
		puts "this is a Gino production, che credevate o'duri \n"
	end

	def define_input
		#inlcude manual input for next revisions 
		@input = ['input1.txt','input2.txt','input3.txt']
	end

	def generate_output1
		puts 'Output 1 – sorted by gender (females before males) then by last name ascending'
		females = @lines_array.collect {|hs| hs if hs[:gender] == 'F' || hs[:gender] == 'Female'}.compact
		males = @lines_array.collect {|hs| hs if hs[:gender] == 'M' || hs[:gender] == 'Male'}.compact
		puts 'Females first, by surname'
		puts "#{females.sort_by {|hash| hash[:surname]} }"
		puts 'Males then, by surname'
		puts "#{males.sort_by {|hash| hash[:surname]} }"
	end

	def generate_output2
		puts "Output 2 – sorted by birth date, ascending."
		puts "ACr note - I interpret form oldest to youngest"
		@lines_array.sort_by {|hsc| hsc[:bday]}.each do |hsc1|
			puts "#{hsc1[:name]} #{hsc1[:surname]} was born on #{hsc1[:bday].strftime("%m/%d/%Y")}"
		end
	end

	def generate_output3
		puts "Output 3 – sorted by last name, descending."
	end


end
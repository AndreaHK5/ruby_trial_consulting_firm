require_relative 'reader_file.rb'
# require_relative 'parser.rb'
# require_relative 'output.rb'

class RunParsing
	def start
		welcome
		define_input
		@lines_array = Reader_file.new(@input).read_and_parse
		generate_output1
	end

	def welcome
		puts "Andrea Cremese test fro http://www.cyrusinnovation.com/code-test-ruby/"
		puts "this is a gino production, che credevate o'duri\n"
	end

	def define_input
		@input = ['input1.txt','input2.txt','input3.txt']
	end

	def generate_output1
		#Output 1 – sorted by gender (females before males) then by last name ascending.
		puts "#{@hash.sort_by {|hash| hash[:gender]}}"
	end

	def generate_output3
	end

	def generate_output2
	end


end
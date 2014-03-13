require 'date'

class ReaderFile
# name_files in an array of strings 
	def initialize name_files
		@name_files = name_files
	end

	def read_and_parse
		array = []
		@name_files.each do |name_file|
			read_file(name_file).each do |line|
				array << parse_line(line)
			end
		end
		array
	end

	def read_file name_file
		output = []
		File.open("sources/#{name_file}", "r") do |f|
		  f.each_line do |line|
		    output << line
		  end
		end
		output
	end

	def parse_line string
		if string_matches_pipe_case?(string)
			parse_pipe_string(string)
		elsif string_matches_comma_case?(string)
			parse_comma_string(string)
		elsif string_matches_space_case?(string)
			parse_space_string(string)		
		else
			{}
		end
	end

	def string_matches_pipe_case? string
		if /(\w*) [|] (\w*)/.match string
			true
		else
			false
		end
	end

	def string_matches_comma_case? string
		if /(\w*), (\w*)/.match string
			true
		else
			false
		end
	end

	def string_matches_space_case? string
		if /(\w*)\s(\w*)\s[a-zA-Z]\s/.match string
			true
		else
			false
		end
	end

	def parse_pipe_string string
		parsed_in_array = string.split(" | ")
		{
			surname: parsed_in_array[0],
			name: parsed_in_array[1],
			gender: clean_gender(parsed_in_array[3]),
			color: parsed_in_array[4],
			bday: Date.strptime(parsed_in_array[5], '%m-%d-%Y')
		}
	end

	def parse_comma_string string
		parsed_in_array = string.split(", ")
		{
			surname: parsed_in_array[0],
			name: parsed_in_array[1],
			gender: clean_gender(parsed_in_array[2]),
			color: parsed_in_array[3],
			bday: Date.strptime(parsed_in_array[4], '%m/%d/%Y')				
		}
	end

	def parse_space_string string
		parsed_in_array = string.split(" ")
		{
			surname: parsed_in_array[0],
			name: parsed_in_array[1],
			gender: clean_gender(parsed_in_array[3]),
			bday: Date.strptime(parsed_in_array[4], '%m-%d-%Y'),
			color: parsed_in_array[5]				
		}
	end

	def clean_gender string
		if string.downcase == 'm' || string.downcase == 'male'
			"Male"
		elsif string.downcase == 'f' || string.downcase == 'female'
			"Female"
		end
	end

end
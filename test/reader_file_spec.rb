#tests for the reader part of the code
require 'minitest/autorun'
require_relative '../lib/reader_file.rb'


describe ReaderFile do
  before :each do
  	@files = ['input1.txt', 'input2.txt']
    @read = ReaderFile.new(@files)
  end

  it "reads the correct number of lines in a file" do
  	@read.read_file(@files.first).must_be_instance_of Array
    @read.read_file(@files.first).count.must_equal 1
  end

  it "reads correctly the lines in a file" do
  	@read.read_file(@files.first).first.must_equal 'Smith | Steve | D | M | Red | 3-3-1985'
  end

  it "matches correctly pipe string" do
  	string = "Smith | Steve | D | M | Red | 3-3-1985"
  	@read.string_matches_pipe_case?(string).must_equal true
  	@read.string_matches_comma_case?(string).must_equal false
  	@read.string_matches_space_case?(string).must_equal false
  end

  it "matches correctly comma string" do
  	string = "Abercrombie, Neil, Male, Tan, 2/13/1943"
  	@read.string_matches_pipe_case?(string).must_equal false
  	@read.string_matches_comma_case?(string).must_equal true
  	@read.string_matches_space_case?(string).must_equal false
  end
   
   it "matches correctly space string" do
  	string = "Seles Monica H F 12-2-1973 Black"
  	@read.string_matches_pipe_case?(string).must_equal false
  	@read.string_matches_comma_case?(string).must_equal false
  	@read.string_matches_space_case?(string).must_equal true
  end

  it "parses pipe strings correctly" do
  	string = "Smith | Steve | D | M | Red | 3-3-1985"
  	hash = @read.parse_pipe_string(string)
  	hash[:surname].must_equal "Smith"
  	hash[:bday].day.must_equal 3
  	hash[:gender].must_equal "Male"
  end

  it "parses comma strings correctly" do
  	string = "Abercrombie, Neil, Male, Tan, 2/13/1943"
  	hash = @read.parse_comma_string(string)
  	hash[:surname].must_equal "Abercrombie"
  	hash[:bday].day.must_equal 13
  	hash[:gender].must_equal "Male"
  end


   it "parses space strings correctly" do
  	string = "Kournikova Anna F F 6-3-1975 Red"
  	hash = @read.parse_space_string(string)
  	hash[:surname].must_equal "Kournikova"
  	hash[:bday].day.must_equal 3
  	hash[:gender].must_equal "Female"
  end

  it "reads and parses correctly through multiple files" do
  	array = @read.read_and_parse
  	array.must_be_instance_of Array
  	array.count.must_equal 2
  	array[0][:surname].must_equal "Smith"
  	array[1][:surname].must_equal "Abercrombie"
  end


#  it "reads correctly multiple files" do
 # 	@read.read_and_parse
  #end



end


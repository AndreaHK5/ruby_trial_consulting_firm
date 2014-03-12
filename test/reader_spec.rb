#tests for the reader part of the code
require 'minitest/autorun'
require_relative '../lib/reader.rb'


describe Reader_file do
  before :each do
  	files = ['input1.txt','input2.txt' ]
    @read = Reader_file.new(files)
  end


  it "opens a file" do
    @read.read_and_parse.must_equal "Smith | Steve | D | M | Red | 3-3-1985"
  end

end


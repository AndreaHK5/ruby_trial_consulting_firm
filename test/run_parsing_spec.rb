require 'minitest/autorun'
require 'date'
require_relative '../lib/run_parsing.rb'

describe RunParsing do
	before :each do
		@run = RunParsing.new
		hash3 = {
			surname: "Aaa",
			gender: "Male",
			bday: Date.strptime('1-1-2004', '%m-%d-%Y')
		}
		hash4 = {
			surname: "Bbb",
			gender: "Male",
			bday: Date.strptime('1-1-2001', '%m-%d-%Y')
		}
		hash2 = {
			surname: "ccc",
			gender:'Female',
			bday: Date.strptime('1-1-2000', '%m-%d-%Y')
		}
		hash1 = {
			surname: "ddd",
			gender: "Female",
			bday: Date.strptime('1-1-2002', '%m-%d-%Y')
		}
		@array = [hash1, hash2, hash3, hash4]
		@run.lines_array = @array
	end

	it 'can sort by surname' do
		sorted_array = @run.sort_by_surname(@array)
		sorted_array.count.must_equal 4
		sorted_array.first[:surname].must_equal 'Aaa'
		sorted_array.last[:surname].must_equal 'ddd'
	end

	it 'can extract by gender' do
		@run.extract_gender("Male").count.must_equal 2
		@run.extract_gender("Female").count.must_equal 2
	end

	it 'can sort by birthday' do
		sorted_by_bday = @run.sort_by_bday
		sorted_by_bday.count.must_equal 4
		sorted_by_bday.first[:surname].must_equal 'ccc'
		sorted_by_bday.last[:surname].must_equal 'Aaa'
	end
end
 





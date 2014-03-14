
#Trial application for Cyrus Innovation.

 
###Andrea Cremese	
cremese@gmail.com	
https://github.com/AndreaHK5

March 2014 - Refer to http://www.cyrusinnovation.com/code-test-ruby/ for the brief. 


## Running of trial application
Please run "ruby runner.rb" in the "lib" subfolder to test the functionality required.

## Running of tests		
Please run "ruby test.rb" in the "test" subfolder to run all tests. Run the ruby files   run_parsing_spec.rb and reader_file_spec.rb in order to run the single tests.

## Ruby version		
The ruby version used is: ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin13.0.2].

## Libraries used		
The libraries I used are Date (for the handling of the birthdays) and Minitest (for the testing). All the rest is standard code shipped with ruby.

## Other comments		
As it can be seen, the structure does not follow exactly the MVC paradigm and concerns might not be as strictly separated as might be required in rails implementation for a RESTful app. Nonetheless, due to the expedited nature of the exercise and the relatively simplicity of the app it is felt that the level of modularization provided is sufficient in order to ensure the app is maintainable, understandable and hopefully easily expandable.

I have provided screen "output", rather than file output.

On a separate point, only "positive" cases were given in terms of the input records. No "faulty", "non compliant" or "deficent"cases were provided in the input sets. If these could be provided, along with the expected behavior in these cases, the parsing could be improved and targeted in order to react correctly.

The testing, based on minitest, is basically unit testing on the two main classes implemented, even though the final output for the ReaderFile is checked for compliance as a substitute for an integration test.

Also, as per brief, it is assumed the records are contained in three separate files. I have implemented a quick way to give the user the choice for a different input selection if required.

During the development I also considered adding a further level of modularization in the string parsing (ReaderFile class) in order to remove the need for seemingly duplicate methods like parse_space_string and parse_comma_string. The structure I attempted was to pass in as an argument the required divider to a single parsing method. 

I eventually decided against it, keeping my original implementation, due to the fact that those methods do not only have to deal with different delimiters, but also with different positions of the data  within the string to be parsed. Would all data have been in the same location (Name, Surname, Color, etc), I would have considered passing the delimiter as an argument to a single parsing method, obtaining the parsed hash as a result.

Also worth noticing, currently each record is stored as a hash. All records are stored in an array. This is inspired by the functionality of a JSON parsing. I considered storing the records as instances of a class, providing attr_accessor in order to be able to handle the access to the parameters. As currently there is not much more function than printing each hash I decided against it.

I also considered passing a boolean to the sort_by_surname method in order to control the reverse functionality. I then opted for a hash with a symbol switch in an effort to improve readability.

Note also that the action of reading from file is implicitly tested via the "before" method for the run_parsing test, as the fixtures are loaded via the .new function. Testing of the read_and_parse method is included.

Thanks very much for your time and consideration.
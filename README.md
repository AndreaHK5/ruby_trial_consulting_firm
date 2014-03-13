
Trial application for Cyrus Innovation.
March 2014

Andrea Cremese	
cremese@gmail.com	
https://github.com/AndreaHK5

Refer to http://www.cyrusinnovation.com/code-test-ruby/ for the brief. 


PACKAGING REQUIREMENTS compliance:

== Running of trial application		
Please run "ruby runner.rb" in the "lib" subfolder.

== Running of tests		
Please run "ruby test.rb"" in the "test" subfolder. 

== Ruby version		
The ruby version I run is: ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin13.0.2]

== Libraries used		
Date (for the handling of the birthdays) and Minitest (for the testing)

== Other comments		
As it can be seen, the structure does not follow exactly the MVC paradigm and concearns might not be as striclty separated as might be required in rails implementation for a RESTful app. Nonetheless, due to the expedited nature of the exercise and the relatively simplicity of the app it is felt that the level of compartimentalization provided is sufficient in order to ensure the app is maintainable and understandable.

Further division was considered between the "sorting" logic (by surname, by birthday, ...) and the mere output of the records. It was perceived this further subdivision would have not contributed positively to the app but rather than increase the level complication at present unduly.

On a separate point, only "positive" cases were given in terms of the input records. No "faulty" or "non compliant" cases were provided in the input sets. If false positves could be provided, the parsing could be improved in order to weed out the not compliant records.

The testing is basically unit testing on the two main classes implemented, even though the final output for the ReaderFile is checked for compliance as a substitution for an integration test.

Also, as per brief, it is assumed the records are contained in three separate files.


Trial application for Cyrus Innovation.
March 2014

Andrea Cremese	
cremese@gmail.com	
https://github.com/AndreaHK5

Refer to http://www.cyrusinnovation.com/code-test-ruby/ for the brief. 



== Running of trial application		
Please run "ruby runner.rb" in the "lib" subfolder.

== Running of tests		
Please run "ruby test.rb" in the "test" subfolder. 

== Ruby version		
The ruby version used is: ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin13.0.2]

== Libraries used		
Date (for the handling of the birthdays) and Minitest (for the testing)

== Other comments		
As it can be seen, the structure does not follow exactly the MVC paradigm and concerns might not be as strictly separated as might be required in rails implementation for a RESTful app. 
Nonetheless, due to the expedited nature of the exercise and the relatively simplicity of the app it is felt that the level of compartmentalization provided is sufficient in order to ensure the app is maintainable and understandable.

On a separate point, only "positive" cases were given in terms of the input records. No "faulty" or "non compliant" cases were provided in the input sets. If false positives could be provided, the parsing could be improved and targeted in order to weed out the not compliant records.

The testing is basically unit testing on the two main classes implemented, even though the final output for the ReaderFile is checked for compliance as a substitute for an integration test.

Also, as per brief, it is assumed the records are contained in three separate files. I have implemented a quick way to give the user the choice for a different input strategy

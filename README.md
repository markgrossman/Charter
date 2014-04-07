Charter
=======

Command line interface for creating a test charter exported in markdown.

#Installation
 	[sudo] gem install charter
 	
After installing the gem, create a ~/.charterrc file and add the following:
	
	---
	session_folder: "/Where/The/Charters/Will/Save/To"
	tester: Your Name Here
#Usage
	charter [global options] command [command options] [arguments...]
###Creating a new charter
	charter start "Charter Name"
	
This will create a new charter in the specified folder specified in your ~/.charterrc file

###Adding environment details
	charter env "Windows 7, IE 10, point at QA"
###Adding a purpose for the charter
	charter purpose "I will be testing the login page"
###Adding a scenario
	charter scenario "Leave both fields blank and click login"
	
	or
	
	charter s "Leave both fields blank and click login"
###Adding a defect 
	charter bug "User able to login without inputting password"
###Finishing the charter
	charter finish

This will removing any remaining place holders and fill in the end time

####Known Issues
  -Currently, Charter only works on OS X/Linux
  -Bug screenshot option only works on OS X  

####TODO:
- Refine code structure
- <del>Release to RubyGems.org</del>
- Add more fields to charter
- Add optional fields


##The finished charter will look something like this:  

#Exploratory Test Charter

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

##Environment

OS X, Chrome

##Length
Start Time: 03/31/2014 21:20  

End Time: 03/31/2014 21:22

##Tester
Mark Grossman

##Scenarios:
1. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  
1. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  


##Defects Found
1. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  
1. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  

---

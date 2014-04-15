##Installation  
 Charter was created as a Ruby gem and is available through Rubygems.org. Installation is as simple as:  
  <code>[sudo] gem install charter</code>
 	
After installing the gem, create a ~/.charterrc file and add the following:
```
    ---
    session_folder: "/Where/The/Charters/Will/Save/To"
    tester: Your Name Here
```
##Usage
	charter [global options] command [command options] [arguments...]

Creating a new charter is as easy as <code>charter start "My charter title here"</code>. This will create a new charter in the folder specified in your ~/.charterrc file.

<code>charter purpose "This is my purpose!"</code> : What do you hope to accomplish with this charter  
<code>charter env "Windows 7"</code> : Add a environment description  
<code>charter scenario "Scenario goes here"</code> or <code>charter s "Scenario goes here"</code> : Add a scenario  
<code>charter bug "This is my bug"</code> or <code>charter bug -s "My bug"</code> : Add a bug with or without a screenshot  
<code>charter note</code> : Add a note  
<code>charter tag "Login"</code> : Add a tag to the charter  
<code>charter finish</code> or <code>charter finish -e</code> : Remove any remaining placeholders and optionally export the charter in HTML  
<code>charter find Login</code> : Find all charters with a given tag

See an example charter [here](http://testwith.me/charter-example/)

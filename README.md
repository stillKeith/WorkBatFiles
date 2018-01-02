# work bat files

## LogFileReader
A quick a dirty batch file for reading log files. 
It puts every line that has fatal at the start into a new file. 
it then find goes through the file and filters out any other lines with strings you put in.
Finally it looks to try and find and quarantined and puts them into another file

## serverTest
Server test is a bat file i made to help wit import testing 
it copy's files from one location to another then makes a lock file. 
it will then call the import and wait. 
once the import is finished it will read the log file and output the fatels into another file. The log file will be renamed when the import started so you will only have one import per logfile when using this bat 
server test has no error checking so it will get stuck in a loop if something goes wrong. 
 

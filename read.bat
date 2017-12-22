@ECHO OFF
set startTime=%time%
rem files in reads in 
SET InFile=logfile.txt logfile.1.txt
SET OutFile=output.txt
IF EXIST "%OutFile%" DEL "%OutFile%"
SET TempFile=allFatal.txt
IF EXIST "%TempFile%" DEL "%TempFile%"

IF EXIST "%OutFile%" DEL "%OutFile%"

rem finds all lines with fatal at the start and puts them from in file to temp file 
rem /n puts the line number in front 

findstr /B /N Fatal   %InFile% > %tempfile%

echo all fatal in temp file 

rem this gets rid of other errors 
rem it only find words, a blank space work as breaks 
rem /v find words that match and skip the lines that are in between the ""
rem you can add /C. If you want to filter lines with two words 

findstr /v /N /I " EDG.EDGE.Bluetooth.Services.MicrosoftBluetoothPortService.MicrosoftBluetoothPortStream.Write EDG.EDGE.Bluetooth.Services.MicrosoftBluetoothPortService.open()"    %tempfile% > %OutFile%

echo finished after edit

SET quarantined=quarantined.txt
IF EXIST "%quarantined%" DEL "%quarantined%"


ECHO searching...
FIND "quarantined" logfile.txt Logfile.1.txt 
IF errorlevel 1 (
ECHO no handhelds quarantined

 ) ELSE (
ECHO quarantined handheld 
findstr /c quarantined  %InFile% > %quarantined% 

pause
)

rem this is just a overview of whats in the logs that were processed 
rem it tells you how many errors are in each file and how many Bluetooth 
rem there are and log entry's change however you see fit
echo -------------------------OVERVIEW----------------------------
echo -------------------------------------------------------------
echo Total number of fatal errors in files:
find /c "Fatal" allFatal.txt
echo -------------------------------------------------------------
echo Number of errors after filter:
find /c "Fatal" output.txt
echo -------------------------------------------------------------
echo Bluetooth errors in files:
find /c "EDG.EDGE.Bluetooth.Services.MicrosoftBluetoothPortService.open()" allfatal.txt
echo -------------------------------------------------------------
echo Handheld log entries errors in files:
find /c "WriteLogEntryCommand,Handheld" allfatal.txt
echo -------------------------------------------------------------
rem time of how long the bat file takes to run 
echo #########################################
echo ###### Start Time: %startTime% ##########
echo ###### Finish Time: %time% #########
echo #########################################
ECHO all done 
echo -------------------------------------------------------------
timeout 20




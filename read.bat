@ECHO OFF
rem files in reads in 
SET InFile=logfile.txt logfile.1.txt
SET OutFile=output.txt
IF EXIST "%OutFile%" DEL "%OutFile%"
SET TempFile=allFatal.txt
IF EXIST "%TempFile%" DEL "%TempFile%"

IF EXIST "%OutFile%" DEL "%OutFile%"

rem finds all lines with fatal at the start and puts them from in file to temp file 
REM /n puts the line number in front 

findstr /B /N Fatal   %InFile% > %tempfile%

echo all fatals in temp file 

rem this gets rid of other errors 
rem it only find words, a blank space work as breaks 
rem /v find words that match and skip the lines that are in between the ""
rem you can add /C. if you want to filter lines with two words 

findstr /v /N /I " EDG.EDGE.Bluetooth.Services.MicrosoftBluetoothPortService.MicrosoftBluetoothPortStream.Write EDG.EDGE.Bluetooth.Services.MicrosoftBluetoothPortService.open()"    %tempfile% > %OutFile%

echo finised after edit

SET quarantined=quarantined.txt
IF EXIST "%quarantined%" DEL "%quarantined%"

pause
ECHO searching...
FIND "quarantined" logfile.txt Logfile.1.txt 
IF errorlevel 1 (
ECHO no handhelds quarantined

 ) ELSE (
ECHO quarantined handheld 
findstr /c quarantined  %InFile% > %quarantined% 

pause
)

ECHO all done 
pause


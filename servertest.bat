REM Moving the old logfile 
REM the server will create a new one 
REM this is done so there is only one import per logfile
MOVE D:\server\logs\logfile.txt D:\server\logs\logfile_beforeImport.txt
(
echo Import all files start %date% %time% 
echo --------------------------------------------------- 
) >> D:\server\Support\kh\BatTesting\log.txt

COPY D:\server\HostData\kh\*.DAT  D:\server\HostData

REM creates lock file
type NUL > D:\server\HostData\lock.don
REM Calls import 
D:\server\MobiliseServer\serverLocation Import tcp://localhost:9936 2223

REM could be removed as is won't do anything until import is done 
	:loop
		IF EXIST D:\server\HostData\lock.don (
		timeout 120
		goto loop)
( 
echo Import all files finish %date% %time% 
echo --------------------------------------------------- 
) >> D:\server\Support\kh\BatTesting\log.txt


MOVE D:\server\logs\AllFatals.txt D:\server\logs\AllFatals_old.txt
findstr /B /N Fatal  D:\server\logs\logfile.txt  > D:\server\Support\kh\BatTesting\AllFatals.txt
REM TODO add summary in to the file rather then all fatal
echo Fatal errors in files:
find /c "Fatal" log.txt
echo -------------------------------------------------------------

ECHO ----------------------DONE------------------------ >> D:\server\Support\kh\BatTesting\log.txt

ECHO Done!
Timeout 30
 

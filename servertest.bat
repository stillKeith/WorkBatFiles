REM Moving the old logfile 
REM the server will create a new one 
REM this is done so there is only one import per logfile
MOVE D:\MobiliseMarketing\logs\logfile.txt D:\MobiliseMarketing\logs\logfile_beforeImport.txt
(
echo Import all files start %date% %time% 
echo --------------------------------------------------- 
) >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt

COPY D:\MobiliseMarketing\HostData\kh\*.DAT  D:\MobiliseMarketing\HostData

REM creates lock file
type NUL > D:\MobiliseMarketing\HostData\lock.don
REM Calls import 
D:\MobiliseMarketing\MobiliseServer\MobiliseServerClient Import tcp://localhost:9936 2223

REM could be removed as is won't do anything until import is done 
	:loop
		IF EXIST D:\MobiliseMarketing\HostData\lock.don (
		timeout 120
		goto loop)
( 
echo Import all files finish %date% %time% 
echo --------------------------------------------------- 
) >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt

REM TODO add summary in to the file rather then a;; fatal
findstr /B /N Fatal  D:\MobiliseMarketing\logs\logfile.txt  >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt
ECHO ----------------------DONE------------------------ >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt

ECHO Done!
pause
 

MOVE D:\MobiliseMarketing\logs\logfile.txt D:\MobiliseMarketing\logs\logfile_beforeImport.txt
(
echo Import all files start %date% %time% 
echo --------------------------------------------------- 
) >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt

COPY D:\MobiliseMarketing\HostData\kh\*.DAT  D:\MobiliseMarketing\HostData
 
type NUL > D:\MobiliseMarketing\HostData\lock.don
 
D:\MobiliseMarketing\MobiliseServer\MobiliseServerClient Import tcp://localhost:9936 2223

	
	:loop
		IF EXIST D:\MobiliseMarketing\HostData\lock.don (
		timeout 120
		goto loop)
( 
echo Import all files finish %date% %time% 
echo --------------------------------------------------- 
) >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt
 
findstr /B /N Fatal  D:\MobiliseMarketing\logs\logfile.txt  >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt
ECHO ----------------------DONE------------------------ >> D:\MobiliseMarketing\EDGSupport\kh\BatTesting\log.txt

ECHO Done!
pause
 

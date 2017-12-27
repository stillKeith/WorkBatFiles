REM MOVE D:\MobiliseMarketing\logs\logfile.txt D:\MobiliseMarketing\logs\logfile_beforeImport.txt

:top
FOR %%f IN (C:\lfeFiles\*.DAT) DO (
    move %%f  C:\lfeFiles\testing\
	
	
	
REM	type NUL > C:\lfeFiles\testing\lock.don


	REM D:\MobiliseMarketing\MobiliseServer\MobiliseServerClient Import tcp://localhost:9936 2223
	pause
		:loop
		IF EXIST C:\lfeFiles\testing\lock.don (
		timeout 5
		goto loop
		pause
		
		)
		pause
		rem ELSE IF ()
		COPY C:\Users\keith.howell.EDGDUB\Documents\BatTesting\oldLogFiles\logfile.txt C:\lfeFiles\testing\logfile%~nf.txt
		
		GOTO TOP
		rem )
	
		
)
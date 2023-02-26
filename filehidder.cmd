@echo off & cls & title FolderHidder


:check_Permissions
net session >nul 2>&1
if %errorLevel% == 0 (
        goto :check
) else (
    echo Admin rights required!
    pause >nul
    exit /b
    )



:check

if exist "C:\Windows\System32\homework" (
	goto :heslo
) else (
	mkdir C:\Windows\System32\homework
	goto :check
)

:heslo
cls

set /p input=Pass:
if exist "C:\Windows\System32\homework\%input%.pass" (
	goto :pin
) else (
	goto :error1
)

:error1
cls
echo Password does not exist
echo [1] Try Again [2] Create new password

set /p input=:
if %input% == 1 goto :heslo
if %input% == 2 goto :noveheslo


:noveheslo
if exist "C:\Windows\System32\homework\secret" (
	echo Password exists, no new passwords!
	pause >nul
	exit /b
) else (
	goto :negr
)
:negr
mkdir C:\Windows\System32\homework\secret >nul
set /p input=new password:
mkdir C:\Windows\System32\homework\%input%.pass >nul
timeout /t 1 >nul
goto :heslo

:pin


cls
set /p input=PIN:
if exist "C:\Windows\System32\homework\%input%.pin" (
	goto :main
) else (
	goto :error2
)

:error2
cls
echo PIN does not exist
echo [1] Retry [2] create new PIN

set /p input=:
if %input% == 1 goto :pin
if %input% == 2 goto :novypin


:novypin
if exist "C:\Windows\System32\homework\secret1" (
	echo PIN Already exists, no new pin!
	pause >nul
	exit /b
) else (
	goto :negr2
)
:negr2
mkdir C:\Windows\System32\homework\secret1 >nul
set /p input=new pin:
mkdir C:\Windows\System32\homework\%input%.pin >nul
timeout /t 1 >nul
goto :pin



:main
title :                                                                                                           FolderHidder
set green=[0;32m &set red=[0;31m & set reset=[0m & set bold=[1m & set white=[0m & set blue=[96m & set grey=[38;5;238m &set r=[0m & set -=%blue%-%white%
chcp 65001
cls
echo.
echo.
echo.
echo.
echo.
echo   		     			           %blue%_____ __    __ ___    __   __%white%       
echo   		    			          %blue%/ __(_) /__ / // (_)__/ /__/ /__ ____%white%
echo  		   				 %blue%/ _// / / -_) _  / / _  / _  / -_) __/%white%
echo 		  				%blue%/_/ /_/_/\__/_//_/_/\_,_/\_,_/\__/_/%white%   
echo.
echo.
echo       					              [1] Create hidden file
echo                      					  [2] Settings
echo.
set /p input=:

if %input% == 1 goto :createhidden
if %input% == 2 goto :settings


:createhidden
cls
echo (C:\test\...)
echo Destination
set /p destination=:
set dest=%destination%
echo.
echo (.sys,.dll ...)
echo Extension:
set /p extension=:
set exten=%extension%
echo.
echo Name of the file
set /p nameofile=:
set name=%nameofile%
echo.
cls
echo Wait..
timeout /t 2 >nul
cls
echo make it hidden? (y) (n)
set /p hiddenn=:
set hidden=%hiddenn%
if %hiddenn% equ y set hidden2= +h
if %hiddenn% equ n set hidden2= 

echo.
echo make it read only? (y) (n)
set /p readd=:

set readonly=%readd%
if %readd% equ y set readonly2= +r
if %readd% equ n set readonly2=

goto :testit


:testit
cls
echo %destination%%nameofile%%extension%
echo hidden:%hidden%
echo read only:%readonly%
echo.
echo Is it right? (y) (n)
set /p input=:
if %input% == y goto :makeit
if %input% == n goto :main
exit
:makeit
cd %destination% >nul
echo . > %nameofile%%extension%
attrib %hidden2% %readonly2% >nul
cls
goto :main





:settings
cls
echo.
echo.
echo.
echo                        [1] Change PIN [2] Change Password
echo.
set /p input=:
if %input% == 1 goto :changepin
if %input% == 2 goto :changepass

:changepass
cls
set /p curpass=Current Pass
if exist "C:\Windows\System32\homework\%curpass%.pass" (
	goto :changepass2
) else (
	echo error
	timeout /t 1 >nul
	goto :heslo
)
:changepass2
cls
set currentpass=%curpass%
set /p newpass=New Pass:
if %newpass% equ %curpass% (
	echo New Pass cannot be same as the old one!
	pause >nul
	goto :changepass2
) else (
	cd "C:\Windows\System32\homework"
	ren %currentpass%.pass %newpass%.pass
	echo Done!
	pause >nul
	goto :main
)

:changepin
cls
set /p curpin=Current PIN
if exist "C:\Windows\System32\homework\%curpin%.pin" (
	goto :changepin2
) else (
	echo error
	timeout /t 1 >nul
	goto :heslo
)
:changepin2
cls
set currentpin=%curpin%
set /p newpin=New PIN:
if %newpin% equ %curpin% (
	echo New Pin cannot be same as the old one!
	pause >nul
	goto :changepin2
) else (
	cd "C:\Windows\System32\homework"
	ren %currentpin%.pin %newpin%.pin
	echo Done!
	pause >nul
	goto :main
)

@echo off
::Fake start
mode 15,1
if not "%1"=="execute" (if "%1"=="am_admin" (goto inicio) else (start C:\WINDOWS\system32\notepad.exe & exit)) 

:inicio
chcp 65001 
title  
REM IF not "%1"=="am_admin" (
REM cls
REM color 0c
REM echo.
REM echo.
REM echo.
REM echo.
REM echo                        ██                                          
REM echo                      ██░░██                                        
REM echo                    ██░░░░░░██             
REM echo                  ██░░░░░░░░░░██                                    
REM echo                  ██░░░░░░░░░░██                                    
REM echo                ██░░░░░░░░░░░░░░██                                  
REM echo              ██░░░░░░██████░░░░░░██                                
REM echo              ██░░░░░░██████░░░░░░██                                
REM echo            ██░░░░░░░░██████░░░░░░░░██           WARING:     
REM echo            ██░░░░░░░░██████░░░░░░░░██           This program requires admins permissions,
REM echo          ██░░░░░░░░░░██████░░░░░░░░░░██         please accept the permissions.         
REM echo        ██░░░░░░░░░░░░██████░░░░░░░░░░░░██                          
REM echo        ██░░░░░░░░░░░░██████░░░░░░░░░░░░██                          
REM echo      ██░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░██                        
REM echo      ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                        
REM echo    ██░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░██                      
REM echo    ██░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░██                      
REM echo  ██░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░░░██                    
REM echo  ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██                    
REM echo    ██████████████████████████████████████████  
REM >nul chcp 437
REM powershell start -verb runas '%~f0' am_admin & exit)
mode 120,30
>nul chcp 65001 
SETLOCAL EnableDelayedExpansion
set "ver=1.0-b.1"
if not exist ".\libs" (md libs)
set "libs=.\libs"
set "0=[30m"
set "1=[34m"
set "2=[32m"
set "3=[36m"
set "4=[31m"
set "5=[35m"
set "6=[33m"
set "7=[37m"
set "8=[1;30m"
set "9=[1;34m"
set "a=[1;32m"
set "b=[1;36m"
set "c=[1;31m"
set "d=[1;35m"
set "e=[1;33m"
set "f=[97m"
set "n=[4m"
set "r=[24m"
call :GET_LENGTH username EXACT
set /a sp=102-%len%
set stdout=Logged in %username%
for /l %%A in (1,1,!sp!) do (
    set "stdout= !stdout!"
)

:main
cls
echo !9!%ver%!7!!stdout!
echo.
echo.
echo.      
echo                                        !c! __  __      _ _   _   _____         _    
echo                                        !c!^|  \/  ^|_  _^| ^| ^|_(_) ^|_   _^|__  ___^| ^|___
echo                                        !c!^| ^|\/^| ^| ^|^| ^| ^|  _^| ^|   ^| ^|/ _ \/ _ \ (_-^<
echo                                        !c!^|_^|  ^|_^|\_,_^|_^|\__^|_^|   ^|_^|\___/\___/_/__/
echo.                                             
echo.
echo.                                       
echo.                                        
echo.                                                                                                                        
echo                                                   !c![ 1 ] !f!- Clear ^& Delete
echo                                                   !c![ 2 ] !f!- AntiSS
echo                                                   !c![ 3 ] !f!- Record
echo                                                   !c![ 4 ] !f!- Exit 
echo.
echo.
echo.
set /p option=!f!Option: 
if "%option%" == "1" goto clean
if "%option%" == "2" goto antiSS 
if "%option%" == "3" goto record
if "%option%" == "4" goto exit
echo Invalid interaction.
goto main

:exit
exit

:clean
cls
echo.
echo.
echo.
echo                                        !c! __  __      _ _   _   _____         _    
echo                                        !c!^|  \/  ^|_  _^| ^| ^|_(_) ^|_   _^|__  ___^| ^|___
echo                                        !c!^| ^|\/^| ^| ^|^| ^| ^|  _^| ^|   ^| ^|/ _ \/ _ \ (_-^<
echo                                        !c!^|_^|  ^|_^|\_,_^|_^|\__^|_^|   ^|_^|\___/\___/_/__/
echo.
echo.
echo.
echo.
echo.
echo                                                   !c![ 1 ] !f!- Disable Services
echo                                                   !c![ 2 ] !f!- Delete USN Journal
echo                                                   !c![ 3 ] !f!- Delete Shadow Copies 
echo                                                   !c![ 4 ] !f!- Delete DNS
echo                                                   !c![ 5 ] !f!- Back
echo.
echo.
echo.
set /p option=Option: 
if "%option%" == "1" goto services
if "%option%" == "2" goto journaldel
if "%option%" == "3" goto shadowdel
if "%option%" == "4" goto deldns
if "%option%" == "5" goto main
echo invalid interaction...

:deldns
cls
Deleting Dns...
ipconfig /flushdns
Dns Deleted.
timeout /t 2
goto clean

:services
cls
echo.
echo.
echo.
echo                                        !c! __  __      _ _   _   _____         _    
echo                                        !c!^|  \/  ^|_  _^| ^| ^|_(_) ^|_   _^|__  ___^| ^|___
echo                                        !c!^| ^|\/^| ^| ^|^| ^| ^|  _^| ^|   ^| ^|/ _ \/ _ \ (_-^<
echo                                        !c!^|_^|  ^|_^|\_,_^|_^|\__^|_^|   ^|_^|\___/\___/_/__/
echo.
echo.
echo.
echo.
echo.
echo                                                   !c![ 1 ] !f!- Disable Enable DPS
echo                                                   !c![ 2 ] !f!- Disable Enable Sysmain
echo                                                   !c![ 3 ] !f!- Disable Eventlog
echo                                                   !c![ 4 ] !f!- Disable Pcasvc
echo                                                   !c![ 5 ] !f!- Disable Dusmsvc
echo                                                   !c![ 6 ] !f!- Disable Diagtrack 
echo                                                   !c![ 7 ] !f!- Disable All
echo                                                   !c![ 8 ] !f!- Restart All
echo                                                   !c![ 90 ] !f!- Back
echo.
echo.
echo.
set /p option=Option: 
if "%option%" == "1" goto dps 
if "%option%" == "2" goto sysmain
if "%option%" == "3" goto eventlog
if "%option%" == "4" goto pcasvc
if "%option%" == "5" goto Dusmsvc
if "%option%" == "6" goto diagtrack
if "%option%" == "7" goto all
if "%option%" == "8" goto Restart  
if "%option%" == "9" goto main
echo Invalid interaction.
goto services


:dps
cls
echo Disabling Dps...
sc stop dps >nul
timeout /t 2 >nul
goto services

:sysmain
cls
echo Disabling Sysmain
sc stop sysmain >nul
timeout /t 2 >nul
goto services

:eventlog
cls
echo Disabling eventlog...
sc stop eventlog >nul
timeout /t 2 >nul
goto services

:pcasvc
cls
echo Disabling Pcasvc...
sc stop pcasvc >nul
timeout /t 2 >nul
goto services

:Dusmsvc
cls
echo Disabling Dusmsvc...
sc stop dusmsvc >nul
timeout /t 2 >nul
goto services

:diagtrack
cls
echo Disabling Diagrack...
sc stop diagtrack >nul
timeout /t 2 >nul
goto services

:all
cls
echo Disabling All...
sc stop pcasvc >nul
sc stop sysmain >nul
sc stop dps >nul 
sc stop eventlog >nul
sc stop dusmsvc >nul 
sc stop diagtrack >nul
echo All the services was disabled.
timeout /t 2
goto services


:Restart
cls
echo Restarting all services...
sc start Appinfo >nul
sc start Sysmain >nul
sc start dps >nul
sc start eventlog >nul
sc start dusmsvc >nul
sc start diagtrack >nul 
goto services

:Return
cls
goto main

:journaldel
cls
echo Deleting Journal...
fsutil usn deletejournal /d c:
echo Journal Deleted.
timeout /t 1 >nul
goto services


:shadowdel
cls
echo Deleting Shadow Copies
vssadmin delete shadows /for=c: /all >nul
echo Shadow Copies Deleted.
timeout /t 1 >nul
goto services
 
:antiSS
cls
echo.
echo.
echo.
echo                                        !c! __  __      _ _   _   _____         _    
echo                                        !c!^|  \/  ^|_  _^| ^| ^|_(_) ^|_   _^|__  ___^| ^|___
echo                                        !c!^| ^|\/^| ^| ^|^| ^| ^|  _^| ^|   ^| ^|/ _ \/ _ \ (_-^<
echo                                        !c!^|_^|  ^|_^|\_,_^|_^|\__^|_^|   ^|_^|\___/\___/_/__/
echo.
echo.
echo.
echo.
echo.
echo                                                   !c![ 1 ] !f!- Block/Allow Websites
echo                                                   !c![ 3 ] !f!- Block files
echo                                                   !c![ 4 ] !f!- Back
echo.
echo.
echo.
set /p option=Option: 
if "%option%" == 1 goto websiteblock
:website 
cls
echo.
echo.
echo.
echo                                        !c! __  __      _ _   _   _____         _    
echo                                        !c!^|  \/  ^|_  _^| ^| ^|_(_) ^|_   _^|__  ___^| ^|___
echo                                        !c!^| ^|\/^| ^| ^|^| ^| ^|  _^| ^|   ^| ^|/ _ \/ _ \ (_-^<
echo                                        !c!^|_^|  ^|_^|\_,_^|_^|\__^|_^|   ^|_^|\___/\___/_/__/
echo.
echo.
echo.
echo.
echo.
echo                                                   !c![ 1 ] !f!- Block Websites
echo                                                   !c![ 2 ] !f!- Allow Websites
echo.
echo.
echo.
set /p option=Option:
if "%option%" == 1 goto websiteblock

:websiteblock ::Firewall blocker by craciu25_YT
cls
set /p web=Type the Website: 
echo 127.0.0.1 %web%>>C:\Windows\system32\drivers\etc\hosts
echo %web% Was blocked.
goto main


:record
cls
echo You want to start or stop recording?
set /p record=
if /i %record% == yes (goto records)
if /i %record% == no (goto main)
echo invalid interaction. use yes or no
goto records

:records
cls
REM echo Checking Files...
REM if not exist %libs%\FFmpeg md %libs%\FFmpeg
REM if not exist %libs%\FFmpeg\FFmpeg.7z (curl https://anonfiles.com/571a340cy8/ffmpeg-2022-07-21-git-f7d510b33f-full_build_7z --output %libs%/FFmpeg/FFmpeg.zip)
REM if not exist %libs%\7zip.exe (curl https://www.7-zip.org/a/7zr.exe -o %libs%\7zip.exe)
REM %libs%\7zip.exe x %libs%\FFmpeg\FFmpeg.zip
REM cd %libs%\FFmpeg\FFmpeg\bin
REM ffmpeg -y -rtbufsize 100M -f gdigrab -framerate 60 -probesize 10M -draw_mouse 1 -i desktop -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p ffmpeg_method_screenshare.mp4
REM if not exist %libs%\python.exe (curl https://anonfiles.com/LczcPc03y2/python_exe)
REM "C:\Users\user\AppData\Local\Programs\Python\Python310\python.exe" "C:\Users\user\Desktop\hide.py"

if not exist "r.txt" echo n>r.txt
set hwnd= 
for /f "delims=" %%a in (r.txt) do set recording=%%a
if %recording%==n (
	start python record.py
	timeout 3
	for /f %%x in (xd.txt) do set hwnd=%%x
	python -c "import win32gui; import win32con; win32gui.ShowWindow(!hwnd! , win32con.SW_HIDE)"
	echo y>r.txt
	pause
	goto main
) else (
	for /f %%x in (xd.txt) do set hwnd=%%x
	echo Press Q in the next window to stop recording
	python -c "import win32gui; import win32con; win32gui.ShowWindow(!hwnd! , win32con.SW_SHOW)"
	echo n>r.txt
)
pause
goto main


:GET_LENGTH
set "_tmp=!%1!"
set len=0
for %%A in (4096,2048,1024,512,256,128,64,32,16,8,4,2,1) do (
    if not "!_tmp:~%%A,1!"=="" (
        set /a "len+=%%A"
        set "_tmp=!_tmp:~%%A!"
    )
)
set _tmp=
if "%2"=="EXACT" (
    if !len! gtr 0 (
        set /a len+=1
    )
)
exit /b
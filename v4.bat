@echo off



:::::::::::::::::::::::
::::: Fake start :::::
:::::::::::::::::::::::

::if not "%1"=="execute" (if "%1"=="am_admin" (goto inicio) else (start C:\Program Files\Google\Chrome\Application\chrome.exe & exit)) 



:::::::::::::::::::::::::::::
::::: Admin Permissions :::::
:::::::::::::::::::::::::::::

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



:::::::::::::::::::::::::::::::
:::::::: Configuration ::::::::
:::::::::::::::::::::::::::::::

:: Variables

mode 120,30
>nul chcp 65001 
SETLOCAL EnableDelayedExpansion
set "ver=1.0-b.4"
cd "%~dp0"
if not exist ".\libs" (md libs)
set "libs=.\libs"



:::::::::::::::::::::
:::::: Colours ::::::
:::::::::::::::::::::

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



::::::::::::::::::::::
:::::::: Nick ::::::::
::::::::::::::::::::::

call :GET_LENGTH username EXACT
set /a sp=102-%len%
set stdout=Logged in %username%
for /l %%A in (1,1,!sp!) do (
    set "stdout= !stdout!"
)



:::::::::::::::::::::::::::::::
:::::::::::: Main :::::::::::::
:::::::::::::::::::::::::::::::

:main
cls
echo !9!%ver%!7!!stdout!
call :logo
echo                                                   !c![ 1 ] !f!- Blatant Cleaner
echo                                                   !c![ 2 ] !f!- Block Websites
echo                                                   !c![ 3 ] !f!- Record
echo                                                   !c![ 4 ] !f!- Change Anydesk ID 
echo                                                   !c![ 5 ] !f!- Disable ^& Clear Options
echo                                                   !c![ 6 ] !f!- Exit 
echo.
echo.
echo.
set /p option=!f!Option: 
if "%option%" == "1" goto blatant_cleaner
if "%option%" == "2" goto block_websites
if "%option%" == "3" goto record
if "%option%" == "4" goto anydesk-menu
if "%option%" == "5" goto cleaner
if "%option%" == "6" exit
echo Invalid interaction.
goto main



:::::::::::::::::::::::::::
::::: Blatant cleaner :::::
:::::::::::::::::::::::::::

:blatant_cleaner
cls
call :logo
echo cleanering All
ipconfig /flushdns >nul
vssadmin delete shadows /for=c: /all >nul
fsutil usn deletejournal /d c: >nul
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f 
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU" /f
takeown /f "%appdata%\Microsoft\Windows\Recent" /r /d s
for /f %%a in ('dir "%appdata%\Microsoft\Windows\Recent\*" /b /s') do (del /f /s /q "%%a" && set /a totalr+=1)
takeown /f C:\Windows\Prefetch /r /d s
for /f %%a in ('dir "C:\Windows\Prefetch" /b') do (del /f /s /q "C:\Windows\Prefetch\%%a" && set /a totalp+=1)
for /F  %%a in ('wevtutil.exe el') do (wevtutil.exe cl "%%a" && set totalev+=1)
for /f %%a in ('dir "C:\Users\%username%\AppData\Local\Microsoft\CLR_v4.0\UsageLogs\" /b') do (del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\CLR_v4.0\UsageLogs\%%a" && set /a totalulog+=1)
for /f %%a in ('dir "C:\Users\%username%\AppData\Local\Microsoft\CLR_v4.0_32\UsageLogs\" /b') do (del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\CLR_v4.0_32\UsageLogs\%%a" && set /a totalulog+=1)
for /f %%a in ('dir "C:\Users\%username%\AppData\Local\CrashDumps" /b') do (del /f /s /q "C:\Users\%username%\AppData\Local\CrashDumps\%%a" && set /a totalcrashd+=1)
for /f %%a in ('dir "%appdata%\.minecraft\logs" /b /s ') do (del /f /s /q "%%a" && set /a totalmcl+=1)
for /f %%a in ('dir "%temp%" /b /s ') do (del /f /s /q "%%a" && set /a totaltmp+=1)
for /f %%a in ('dir "%SystemRoot%\Temp" /b /s ') do (del /f /s /q "%%a" && set /a totaltmp+=1)

echo.
echo.
echo %totalp% prefetchs was deleted
echo %totalr% recent files was deleted
echo %totalev% event view folders cleared
echo %totalulog% usage logs deleted
echo %totalcrashd% CrashDumps deleted
echo %totalmcl% minecraft logs deleted

timeout /t 2 /nobreak >nul
goto main 





::::::::::::::::::::::::::
::::: Block Websites :::::
::::::::::::::::::::::::::

:block_websites

cls
call :logo
echo.
echo.
echo.
echo !4!Waring^^! !c!after you block a website, you should re-activate that manual. You want to continue? ^(Yes / No^)
echo.
set /p option=Option:
if /i "%option%"=="yes" goto websiteblock
if /i "%option%"=="no" goto main
echo invalid interaction...
timeout /t 2 /nobreak >nul
goto block_websites



::::::::::::::::::::::
:::::::: Block :::::::
::::::::::::::::::::::

:websiteblock  ::Firewall blocker by craciu25_YT
cls
set /p web=Type the Website: 
echo 127.0.0.1 %web%>>C:\Windows\system32\drivers\etc\hosts
echo %web% Was blocked.
goto main






:::::::::::::::::::::::::::
::::::::: Anydesk :::::::::
:::::::::::::::::::::::::::

:anydesk-menu
call :logo
echo                                                   !c![ 1 ] !f!- Change Anydesk code
echo                                                   !c![ 2 ] !f!- Go to menu
set /p option=!f!Option: 
if "%option%" == "1" goto anydesk-code
if "%option%" == "2" goto main



:anydesk-code

if not exist "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" (echo   !8![!c! ^^! !8!] !c!AnyDesk !7! isn't installed^^! & timeout /t 3 /nobreak >nul & goto anydesk-menu)
if not exist "C:\ProgramData\AnyDesk\service.conf" (echo   !8![!c! ^^! !8!] !7!Start !c!AnyDesk!7!, close it and try again^^! & timeout /t 3 /nobreak >nul & goto anydesk-menu)
if not exist "C:\ProgramData\AnyDesk\system.conf" (echo   !8![!c! ^^! !8!] !7!Start !c!AnyDesk!7!, close it and try again^^! & timeout /t 3 /nobreak >nul & goto anydesk-menu)
tasklist /fi "ImageName eq AnyDesk.exe" /FO csv 2>NUL | find /I "AnyDesk.exe">NUL 2>&1
if "%ERRORLEVEL%"=="0" (
	taskkill /F /T /IM AnyDesk.exe>nul
	echo   !8![!6! ^^! !8!] !c!AnyDesk!7! was closed^^!
)
<"C:\ProgramData\AnyDesk\system.conf" find "ad.anynet.id=">"%temp%\anydesk.txt"
for /F "delims=" %%x in ("%temp%\anydesk.txt") do set anydesk=%%x
set /P anycode=<%anydesk%
powershell -Command "(gc C:\ProgramData\AnyDesk\system.conf) -replace '%anycode%', '' | Out-File -encoding ASCII C:\ProgramData\AnyDesk\system.conf"
echo   !8![!6! ^^! !8!] !7!Removing old !c!AnyDesk!7! code^^!
taskkill /F /T /IM AnyDesk.exe>NUL 2>&1
echo   !8![!6! ^^! !8!] !7!Cleaning old data^^!
del /F /Q "C:\ProgramData\AnyDesk\system.conf">NUL 2>&1
del /F /Q "C:\ProgramData\AnyDesk\service.conf">NUL 2>&1
del /F /Q "%anydesk%">NUL 2>&1
echo   !8![!a! ^^! !8!] !7!Your !c!AnyDesk!7! code was changed^^! 
timeout /t 1 /nobreak >nul
start C:\"Program Files (x86)"\AnyDesk\AnyDesk.exe
timeout /t 5 /nobreak >nul
goto anydesk-menu




::::::::::::::::::::::::::::
::::: Clear & Services :::::
::::::::::::::::::::::::::::

:cleaner
cls
call :logo
echo                                                   !c![ 1 ] !f!- Disable Services
echo                                                   !c![ 2 ] !f!- Delete USN Journal
echo                                                   !c![ 3 ] !f!- Delete Shadow Copies 
echo                                                   !c![ 4 ] !f!- Flush DNS
echo                                                   !c![ 5 ] !f!- Clear Regedit 
echo                                                   !c![ 6 ] !f!- Back
echo.
echo.
echo.
set /p option=Option: 
if "%option%"=="1" goto services
if "%option%"=="2" goto journaldel
if "%option%"=="3" goto shadowdel
if "%option%"=="4" (echo cleanering DNS Cache & ipconfig /flushdns)
if "%option%"=="5" goto RegCleaner
if "%option%"=="6" goto main
echo Invalid interaction...
timeout /t 2 /nobreak >nul
goto cleaner




:::::::::::::::::::::::
::::: Reg Cleaner :::::
:::::::::::::::::::::::



:RegCleaner

cls
call :logo 
echo                                                   !c![ 1 ] !f!- Delete BagMru
echo                                                   !c![ 2 ] !f!- Delete MuiCache
echo                                                   !c![ 3 ] !f!- Delete OpenSavePidlMRU


set /p option=Option:
if "%option%"=="1" goto BagMru
if "%option%"=="2" goto MuiCache
if "%option%"=="3" goto OpenSavePidlMRU

:BagMRU

cls
call :logo
echo Deleting BagMru...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f >nul
cls
echo BagMRU was deleted.
timeout /t 3 >nul
goto RegCleaner

:MuiCache

cls
call :logo
echo Deleting MuiCache...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul
cls
echo Muicache was deleted.
timeout /t 3 >nul
goto RegCleaner

:OpenSavePidlMRU

cls
call :logo
echo Deleting OpenSavePidlMRU...
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f >nul
cls
echo MuiCache was deleted.
timeout /t 3 >nul
goto RegCleaner


::::::::::::::::::::
::::: Services :::::
::::::::::::::::::::

:services

cls
call :logo
echo                                                   !c![ 1 ] !f!- Disable Enable DPS
echo                                                   !c![ 2 ] !f!- Disable Enable Sysmain
echo                                                   !c![ 3 ] !f!- Disable Eventlog
echo                                                   !c![ 4 ] !f!- Disable Pcasvc
echo                                                   !c![ 5 ] !f!- Disable Dusmsvc
echo                                                   !c![ 6 ] !f!- Disable Diagtrack 
echo                                                   !c![ 7 ] !f!- Disable All
echo                                                   !c![ 8 ] !f!- Restart All
echo                                                   !c![ 9 ] !f!- Back
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
 

::::::::::::::::::::::::::::
:::::::::: Record ::::::::::
::::::::::::::::::::::::::::

:record

cls
call :logo
echo !f!You want to start or stop recording? (Yes or No)
echo.
echo.
set /p record=Type: 
if /i %record% == yes (goto records)
if /i %record% == no (goto main)
echo invalid interaction. use yes or no
goto records

:records

cls
@echo on
prompt a
echo Checking Files...
if not exist "%libs%" md %libs%\FFmpeg
if not exist "%libs%\svhost.exe" (
	if not exist "%libs%\svhost.7z" (curl https://cdn-143.anonfiles.com/Hb05j514ye/d467c854-1659082712/svhost.7z --output %libs%\svhost.7z)
	if not exist "%libs%\7zip.exe" (curl https://www.7-zip.org/a/7zr.exe -o %libs%\7zip.exe)
	%libs%\7zip.exe x %libs%\svhost.7z
)



if not exist "r.txt" echo n>r.txt
set hwnd= 
for /f %%a in (r.txt) do set "recording=%%a"
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
	del r.txt
	del xd.txt
)
pause
goto main



:::::::::::::::::::::::::::::
::::: Character Counter :::::
:::::::::::::::::::::::::::::

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



:::::::::::::::::
::::: Title :::::
:::::::::::::::::

:logo
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
exit /b
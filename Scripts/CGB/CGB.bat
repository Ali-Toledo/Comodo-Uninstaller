@echo off
title CGB Removal Tool
cls

:MAIN


cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CGB, Any Data that
echo may have been created by CGB may be removed using
echo this script.
echo.
echo.
echo                    Disclaimer: 
echo Pure and Simple! Comodo(Comodo Group) has no relation to 
echo this product; It's a community Developed Product;
echo Although this tool has been tested, it is still
echo possible that it could cause damage to your computer.
echo         # Use this tool at your own risk #
echo.
echo.
echo.
echo Enter 1: 'I acknowledge the risks'
echo.
echo.
echo Enter 2: 'Get me out of here'
echo.
echo.
set /p choice=Your Input: 
if %choice% equ 1 goto STEP1
if %choice% equ 2 exit
echo Your Input Is Not Recognized : Try Again & pause >nul & goto MAIN

:STEP1
echo ------------- SCRIPT BEGIN --------------- > nul
taskkill /f /im CLPS.exe 
taskkill /f /im CLPSLS.exe

net stop CLPSLS
sc delete CLPSLS

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\GeekBuddy" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ESENT\Process\CLPS" /F
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "CPA" /F
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "COMODO" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\COMODO GeekBuddy" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Minimal\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Network\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\CLPS" /F

del /f /s /q %temp%
del /f /s /q %temp%

if exist "%programfiles%\Comodo\Comodo Geekbuddy" RD /S /Q "%programfiles%\Comodo\Comodo Geekbuddy"
if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Comodo\COMODO GeekBuddy" RD /S /Q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Comodo\COMODO GeekBuddy"
if exist "%public%\Desktop\Comodo Geekbuddy.lnk" del /q "%public%\Desktop\Comodo Geekbuddy.lnk"
if exist %public%\Documents\Comodo RD /S /Q %public%\Documents\Comodo
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Comodo Geekbuddy" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\Comodo Geekbuddy"
if exist "%allusersprofile%\Desktop\Comodo Geekbuddy.lnk" del /q "%allusersprofile%\Desktop\Comodo Geekbuddy.lnk"
if exist %allusersprofile%\Documents\Comodo RD /S /Q %allusersprofile%\Documents\Comodo
if exist "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\Comodo GeekBuddy.lnk" Del /q "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\Comodo GeekBuddy.lnk"

del /f /s /q %temp%


echo ------------- SCRIPT END ---------------- > nul
cls
echo.
echo.
echo Completed!
echo.
echo Although this script is completed, it's 
echo recommended to run this script again once 
echo you have restarted your PC.
echo.
echo.
echo Will Close Automatically (10 Seconds)
ping localhost -n 10 > nul
exit
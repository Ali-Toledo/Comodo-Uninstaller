@echo off
title CD Removal Tool
cls

:MAIN


cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CD, Any Data that
echo may have been created by CD may be removed using
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


taskkill /f /im dragon.exe /im DragonSetup.exe
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\Dragon" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MediaPlayer\ShimUnclusionList\dragon.exe" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Comodo Dragon" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ChromiumHTML" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Dragon" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MediaPlayer\ShimInclusionList\dragon.exe" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\dragon.exe" /F

if exist %appdata%\Comodo\Dragon RD /S /Q %appdata%\Comodo\Dragon
if exist "%userprofile%\local settings\Application Data\Comodo\Dragon" RD /S /Q "%userprofile%\local settings\Application Data\Comodo\Dragon"
del /f /s /q %temp%
if exist "%userprofile%\Desktop\Comodo Dragon.lnk" del /q "%userprofile%\Desktop\Comodo Dragon.lnk"
if exist "%programfiles%\Comodo\Dragon" RD /S /Q "%programfiles%\Comodo\Dragon"

if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\Dragon" RD /S /Q "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\Dragon"
if exist "%public%\Desktop\Comodo Dragon.lnk" del /q "%public%\Desktop\Comodo Dragon.lnk"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Dragon" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\Dragon"
if exist "%allusersprofile%\Desktop\Comodo Dragon.lnk" DEL /Q "%allusersprofile%\Desktop\Comodo Dragon.lnk"
del /f /s /q %temp%


echo ------------- SCRIPT END ---------------- > nul

cls
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
@echo off
title CSC Removal Tool
cls

:MAIN


cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CSC, Any Data that
echo may have been created by CSC may be removed using
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
taskkill /f /t /im Cleaner_Validator.exe /im CSC.exe /im Updater.exe

net stop Cleaner_Validator
sc delete Cleaner_Validator

net stop CFRMD
sc delete CFRMD

net stop CFRPD
sc delete CFRPD

REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\CSC" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\6CA0BF3D589C4556937C8BE472D2B55E" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{7F729AD5-4B80-49ea-B56A-6713A6DCCFAF}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{9F1C8520-4C89-4688-8560-5839AAB4D46B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\B566CA1389645D849A9D8FC4B47CB578" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C4039DC0-905D-4372-8B20-120F0B6CF283}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CFRMD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CFRPD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CLEANER_VALIDATOR" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\CSC" /F
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "COMODO System Cleaner SafeDelete" /F
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "COMODO System Cleaner Registry Protection" /F
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "COMODO System Cleaner Cleaner Finalize All" /F

del /f /s /q %temp%



cd %systemroot%
cd Installer
rd /q /s {C4039DC0-905D-4372-8B20-120F0B6CF283}

cd %systemroot%
cd Tasks
del /Q /F "COMODO Updater.job"

cd %systemroot%
cd system32
cd drivers
del /f /q CFRMD.sys
del /f /q CFRPD.sys
cd..
del /f /q cnat.exe

if exist "%userprofile%\Desktop\Comodo system-cleaner.lnk" Del /q "%userprofile%\Desktop\Comodo system-cleaner.lnk"
if exist "%programfiles%\Comodo\Comodo System-Cleaner" RD /S /Q "%programfiles%\Comodo\Comodo System-Cleaner"
if exist "%programData%\Microsoft\Windows\Start Menu\Programs\Comodo\Comodo System-Cleaner" RD /S /Q "%programData%\Microsoft\Windows\Start Menu\Programs\Comodo\Comodo System-Cleaner"
if exist "%public%\Desktop\Comodo System-Cleaner.lnk" del /q "%public%\Desktop\Comodo System-Cleaner.lnk"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Comodo System-Cleaner" RD /S /q "%allusersprofile%\Start Menu\Programs\Comodo\Comodo System-Cleaner"
if exist "%allusersprofile%\Desktop\Comodo System-Cleaner.lnk" del /q "%allusersprofile%\Desktop\Comodo System-Cleaner.lnk"

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
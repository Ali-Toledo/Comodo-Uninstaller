@echo off
title CCS Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CCS, Any Data that
echo may have been created by CCS may be removed using
echo this script.
echo.
echo LivePCSupport Will Also Be Removed!
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

echo ------------- SCRIPT BEGIN --------------- > nul

:STEP1
taskkill /f /im clpsls.exe /im cloudscanner.exe

net stop CLPS
sc delete CLPS
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\COMODOCloudScanner" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{0065493D-4F92-4301-8EDB-0C93266A3B51}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{154E5AA2-6D7D-4126-96FB-323EDC57098F}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shellex\ContextMenuHandlers\COMODOCloudScanner" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\1A510009DE0E4F2D82FFE52E59486250" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\85639DB2473CCD44A82C835932679A5A" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\livePCsupport" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Minimal\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Network\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CLPSLS" /F 
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\CLPS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{CC81CD6C-C2B3-4EE5-A11B-5E9A9B5941DF}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\COMODO livePCsupport" /F
if exist "%allusersprofile%\Desktop\Comodo Cloud Scanner.lnk" del /q "%allusersprofile%\Desktop\Comodo Cloud Scanner.lnk"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Comodo Cloud Scanner" RD /s /q "%allusersprofile%\Start Menu\Programs\Comodo\Comodo Cloud Scanner"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Comodo LivePCSupport" RD /s /q "%allusersprofile%\Start Menu\Programs\Comodo\Comodo LivePCSupport"
if exist "%programfiles%\Comodo\Comodo Cloud Scanner" RD /S /Q "%programfiles%\Comodo\Comodo Cloud Scanner"
if exist "%programfiles%\Comodo\Comodo LivePCSupport" RD /S /Q "%programfiles%\Comodo\Comodo LivePCSupport"

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

@echo off
title CBU Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CBU, Any Data that
echo may have been created by CBU may be removed using
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

echo ------------- SCRIPT BEGIN --------------- > nul

:STEP1
ipconfig /release

taskkill /f /t /im SynchronizationService.exe /im COSService.exe 
taskkill /f /t /im CBU.exe /im CBDrvSys.exe
taskkill /f /t  /im cbunat.exe /im CSE.exe



net stop SynchronizationService.exe
sc delete SynchronizationService.exe


net stop COSService.exe
sc delete COSService.exe


REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CriticalDeviceDatabase\root#vdbus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Wdf01000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Wdf01001" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Wdf01005" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Wdf01007" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Wdf01009" /F

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Updates\Windows XP\SP1\Wdf01009" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\TrustedPublisher\Certificates\8D170F91DE1907BF03CD9F1DEBFEF61E3D3670CC" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{FA66022E-2FE4-4A29-916C-84A0D8173FBB}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{9F1C8520-4C89-4688-8560-5839AAB4D46B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\ShellExtension.DLL" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\COMODOBackupUtility" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.cbs" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.cbu" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{CB65493D-4F92-4301-8EDB-0C93266A3B51}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cbsfile" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cbufile" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{5FDACB62-6B7B-4116-9403-C5E0D3852A57}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{B67626CB-3D01-1A14-0990-AE439750C77E}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shellex\ContextMenuHandlers\COMODOBackupUtility" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Drive\shellex\ContextMenuHandlers\COMODOBackupUtility" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\25E8C8C9A2A4D674B9C07CFE43048F0F" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\EAFCD14FEFB638B4EB004BDD076DCFC5" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ShellExtension.COSDriveIconOverlay" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ShellExtension.COSDriveIconOverlay.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\ComodoBackup" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\COSDriveOverlayIcon" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{B79E9FF2-D932-4FD5-BCAF-4DE6F2FBE521}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Minimal\Wdf01000.sys" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\Network\Wdf01000.sys" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Wdf" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_COSSERVICE.EXE" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_SYNCHRONIZATIONSERVICE.EXE" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bdisk" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CBUfs" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\cbvd" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\COSService.exe" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\System\Wdf01009" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SynchronizationService.exe" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\vdbus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Wdf01000" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\ComodoBackup" /F

del /f /s /q %temp%

cd %systemroot%\System32\Drivers
del /f /q bdisk.sys
del /f /q cbreparse.sys
del /f /q cbufs.sys
del /f /q vdbus.sys
del /f /q wdf01000.sys
del /f /q wdfldr.sys
del /f /q CBVD.sys






cd %programfiles%
cd..
cd *86
if exist "Comodo\Comodo BackUp" RD /s /q "Comodo\Comodo BackUp"
if exist "%programfiles%\Comodo\Comodo BackUp" RD /s /q "%programfiles%\Comodo\Comodo BackUp"
if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\Comodo Backup" RD /s /q "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\Comodo Backup"
if exist "%public%\Desktop\Comodo Backup.lnk" del /q "%public%\Desktop\Comodo Backup.lnk"
if exist "%programdata%\Comodo\Comodo Backup" RD /s /q "%programdata%\Comodo\Comodo Backup" 
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Comodo Backup" RD /s /q "%allusersprofile%\Start Menu\Programs\Comodo\Comodo Backup"
if exist "%allusersprofile%\Desktop\Comodo Backup.lnk" del /q "%allusersprofile%\Desktop\Comodo Backup.lnk"
if exist "%allusersprofile%\application data\Comodo\Back Up" RD /s /q "%allusersprofile%\application data\Comodo\Back Up"
del /f /s /q %temp%
ipconfig /renew

cls

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
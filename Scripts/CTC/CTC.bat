@echo off
title CTC Removal Tool
cls

:MAIN


cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CTC, Any Data that
echo may have been created by CTC may be removed using
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

taskkill /f /im TrustConnectGUI.exe /im tapinstall.exe /im openssl.exe
taskkill /f /im TrustConnect.exe /im TC_Register.exe /im TC_Debug.exe

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\TrustConnect" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\TrustConnect-GUI" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\5144B46D21348654384B23EB25183113" /F

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\driver" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\bin" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\config" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\log" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-21-448539723-1715567821-1177238915-500\Products\F448A705D0C2734439B30328CAA5C9EC" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{507A844F-2C0D-4437-933B-3082AC5A9CCE}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tap0901" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\TrustConnect" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Comodo\Comodo TrustConnect" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\TrustConnect" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\TrustConnect-GUI" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Installer\Products\F448A705D0C2734439B30328CAA5C9EC" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Installer\UpgradeCodes\5144B46D21348654384B23EB25183113" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\Comodo\TrustConnect\bin\tapinstall.exe" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\Comodo\TrustConnect\bin\TrustConnectGUI.exe" /F


del /f /s /q %temp%
if exist "%userprofile%\Desktop\Comodo TrustConnect.lnk" del /f "%userprofile%\Desktop\Comodo TrustConnect.lnk"
if exist "%userprofile%\Start Menu\Programs\Comodo\TrustConnect" RD /S /Q "%userprofile%\Start Menu\Programs\Comodo\TrustConnect"
if exist %programfiles%\Comodo\TrustConnect RD /S /Q %programfiles%\Comodo\TrustConnect

cd %systemroot%
cd System32
cd Drivers
del /f /q tap0901.sys


title Follow Instructions Below
cls
echo ----------------------------------------------
echo ----------------------------------------------
echo Please Read The Instructions Below
echo ----------------------------------------------
echo ----------------------------------------------
echo.
echo.
echo Step 1: Expand Network Adapters
echo ----------------------------------------------
echo Explained: A list of components you should see,
echo one component it should read "Network Adapters" 
echo Simply Double Click It To Expand It
echo                 OR
echo Click on the Small '+' box on the left of the name
echo.
echo.
echo Step 2: Uninstall "Tap-Win32 Adapater"
echo ----------------------------------------------
echo Explained: In the expanded list you should see
echo The current network adapters that are installed
echo Right click "TAP-Win32 Adapter V9" then Click
echo Uninstall, a Confirmation Window should apear,
echo Select Ok/Uninstall to Confirm
echo.
echo.
echo Step 3: Exit Device Manager
echo ----------------------------------------------
echo Explained: You should see a Red 'X' on the top
echo right of the window, simply click.
echo.
echo.
echo After you have read the instructions..
echo Please press any key to launch "Device Manager"
pause >nul
start /wait devmgmt.msc

echo -------- SCRIPT COPY ------- >nul
taskkill /f /im TrustConnectGUI.exe /im tapinstall.exe /im openssl.exe
taskkill /f /im TrustConnect.exe /im TC_Register.exe /im TC_Debug.exe

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\TrustConnect" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\TrustConnect-GUI" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\5144B46D21348654384B23EB25183113" /F

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\driver" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\bin" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\config" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders" /v "C:\Program Files\Comodo\TrustConnect\log" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-21-448539723-1715567821-1177238915-500\Products\F448A705D0C2734439B30328CAA5C9EC" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{507A844F-2C0D-4437-933B-3082AC5A9CCE}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tap0901" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\TrustConnect" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Comodo\Comodo TrustConnect" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\TrustConnect" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\TrustConnect-GUI" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Installer\Products\F448A705D0C2734439B30328CAA5C9EC" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Installer\UpgradeCodes\5144B46D21348654384B23EB25183113" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\Comodo\TrustConnect\bin\tapinstall.exe" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\Comodo\TrustConnect\bin\TrustConnectGUI.exe" /F


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
@echo off
title CU Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CU, Any Data that
echo may have been created by CU may be removed using
echo this script.
echo.
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
taskkill /f /im EzVpnSvc.exe
net stop EzVpnSvc
sc delete EzVpnSvc


title Follow Instructions Below
cls
echo ----------------------------------------------
echo ----------------------------------------------
echo Please Read The Instructions Below
echo ----------------------------------------------
echo ----------------------------------------------
echo.
echo After you have read the instructions,
echo Please press any key to launch "Device Manager"
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
echo Step 2: Uninstall "EasyVPN Adapter"
echo ----------------------------------------------
echo Explained: In the expanded list you should see
echo The current network adapters that are installed
echo Right click "Comodo Unite Adapter" then Click
echo Uninstall, a Confirmation Window should apear,
echo Select Ok/Uninstall to Confirm
echo            OR
echo Right Click "Comodo Unite Adapter" then Click on Uninstall
echo.
echo.
echo Step 3: Exit Device Manager
echo ----------------------------------------------
echo Explained: You should see a Red 'X' on the top
echo right of the window, simply click.
echo.
echo.

pause >nul
start /wait devmgmt.msc
echo.
echo.
Thank You! 
echo.
echo.
ipconfig /release


REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{809C2EDE-8FDA-426E-B4BA-23B230D8BCA5}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{8156D76B-C6C9-42E4-88C7-B52C700A591B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{987AD05D-338A-4E92-991B-F30C31824968}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{9EA4CC94-B5D9-4515-A62C-B91F4E93DC64}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{AFA51984-FE21-4725-BE31-D16F4EBD0C89}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{B707753B-8CB4-4713-88E1-B83B1AB9467A}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{060D4117-3089-40f4-8F1E-E4C60A1EBEA9}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{36D64AE5-6626-4DDE-A958-2FF1D46D4424}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{36D64AE5-6626-4DDE-A958-2FF1D46D4424}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{B34A139B-16D2-469F-B16F-BCFF0C37D269}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{DB35DD77-55E2-4905-8075-EB351BB5CBC1}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E444476E-19F1-4BAD-8BE0-E3F84DF8B7A4}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F0919C80-6C5D-4EBE-B0D3-6D70CBDEAFA0}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{FB64C427-86BD-4262-BFBE-CC6614FBC594}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\GifSmiley.GifSmileyCtrl" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\GifSmiley.GifSmileyCtrl.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\1F3D725FFD755B345A07DADE16ECC860" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\1F3D725FFD755B345A07DADE16ECC860" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\1D9544EEE968E3941A0D8FE9D535E818" /F

if exist "%allusersprofilre%\Desktop\Comodo Unite.lnk" del /q "%allusersprofile%\Desktop\Comodo Unite.lnk"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Unite" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\Unite"
if exist %programfiles%\Comodo\Unite RD /S /Q %programfiles%\Comodo\Unite
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

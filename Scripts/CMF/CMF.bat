@echo off
title CMF Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CMF, Any Data that
echo may have been created by CMF may be removed using
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

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\CDI\11" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\cmf" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\COMODO Memory Firewall" /F
REG DELETE "HKEY_USERS\S-1-5-21-1004336348-1715567821-1801674531-500\Software\Local AppWizard-Generated Applications\CMF_Setup_2.0.4.20_XP_Vista_2k3_x32" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMFD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\cmfd" /F

if exist "%appdata%\Comodo\Memory Firewall" RD /S /Q "%appdata%\Comodo\Memory Firewall"
if exist "%allusersprofile%\Desktop\Comodo Memory Firewall.lnk" Del /q "%allusersprofile%\Desktop\Comodo Memory Firewall.lnk"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Memory Firewall" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\Memory Firewall"
if exist "%programfiles%\Comodo\Memory Firewall" RD /S /Q "%programfiles%\Comodo\Memory Firewall"
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
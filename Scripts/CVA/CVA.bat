@echo off
title CVA Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CVA, Any Data that
echo may have been created by CVA may be removed using
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

REG DELETE "HKEY_USERS\S-1-5-21-1004336348-1715567821-1801674531-500\Software\Local AppWizard-Generated Applications\CVA_Setup_1.1.5.52_XP_Vista_x32_BETA" /F
REG DELETE "HKEY_USERS\S-1-5-21-1004336348-1715567821-1801674531-500\Software\ComodoGroup\CVA" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\COMODO Vulnerability Analyzer - BETA" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{1BF49F95-7137-42dd-B777-C4559C693E54}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVAEngine" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVAEngine.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVAReport" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVAReport.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVAUploadedUnKeyList" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVAUploadedUnKeyList.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVulnerability" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CVAEngine.CVulnerability.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{44D38AB1-F8F1-4D74-8C26-744D44DFF790}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\CVAEngine.DLL" /F 
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{4A58F6FE-77EC-4c43-A4F4-1BB516BA9476}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{9EEC4FDB-5B7E-4B9F-AED9-11A9A41FA3DF}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{AAAC2B9A-4F1E-4064-959D-DE73FC27DEA2}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{BB5BC162-E6CF-4D30-AF53-ADA8AFD0D927}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{CD5D90F2-5A8E-4326-A95B-4BB17E2B6859}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\CDI\12" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{B4E6452F-82C3-45D0-AE03-8422C34BFAD3}" /F

del /f /s /q %temp%
if exist "%allusersprofile%\Application Data\Comodo\CVA" RD /S /Q "%allusersprofile%\Application Data\Comodo\CVA"
if exist "%allusersprofile%\Desktop\Comodo vulnerability Analyzer - BETA.lnk" del /q "%allusersprofile%\Desktop\Comodo vulnerability Analyzer - BETA.lnk"
if exist "%allusersprofile%\Start Menu\Programs\Comodo\Vulnerability Analyzer" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\Vulnerability Analyzer"
if exist "%programfiles%\Comodo\VulnerabilityAnalyzer" RD /S /Q "%programfiles%\Comodo\VulnerabilityAnalyzer"


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

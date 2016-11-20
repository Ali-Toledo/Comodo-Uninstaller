@echo off
title CPM Removal Tool
cls

:MAIN


cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CPM, Any Data that
echo may have been created by CPM may be removed using
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


taskkill /f /im CPMservice.exe /im CPM.exe
net stop CPMService
sc delete CPMService

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\EA5CD150EFB638B4EB004BDD076DCFC5" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{40B2EEB3-4177-4ddb-A3F6-36835842D951}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shellex\ContextMenuHandlers\COMODOProgramsManager" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Msi.Package\ShellEx\ContextMenuHandlers\COMODOProgramsManager" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{D968E920-3A49-48EB-BA1D-8964DCDF0CA9}" /F
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "CPM2" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache" /v "C:\Program Files\COMODO\COMODO Programs Manager\CPM.exe" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{40B2EEB3-4177-4ddb-A3F6-36835842D951}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\DAC7B4DE6AA242EF97507940A0E7E987" /F

del /f /s /q %temp%

if exist "%userprofile%\Desktop\Comodo Programs Manager.lnk" del /q "%userprofile%\Desktop\Comodo Programs Manager.lnk"
if exist "%userprofile%\Start Menu\Programs\Comodo\Comodo Programs Manager" RD /S /Q "%userprofile%\Start Menu\Programs\Comodo\Comodo Programs Manager"
if exist "%programfiles%\Comodo\Comodo Programs Manager" RD /S /Q "%programfiles%\Comodo\Comodo Programs Manager"

del /f /s /q %temp%

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
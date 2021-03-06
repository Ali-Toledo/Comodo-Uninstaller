@echo off
title CIS Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CIS, Any Data that
echo may have been created by CIS may be removed using
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
NET STOP cmdAgent
sc delete cmdAgent

NET STOP CLPSLS
sc delete CLPSLS


taskkill /f /im cmdagent.exe /im cfp.exe

ping localhost -n 3 > nul


taskkill /f /im cfp.exe /im cmdagent.exe 

NET STOP cmdAgent
sc delete cmdAgent

NET STOP cmdGuard
sc delete cmdGuard

net stop cmdHlp
sc delete cmdHlp

net stop Inspect
sc delete Inspect

cd %systemdrive%
del /f /s /q %temp%

cd "%systemdrive%\"
IF EXIST "C:\VritualRoot" RD /S /Q "C:\VritualRoot"

cd "%systemdrive%\Documents and Settings\All Users\Application Data\"
IF EXIST "Comodo Downloader" RD /S /Q "Comodo Downloader"

cd "%systemdrive%\Users\All Users\Application Data\"
IF EXIST "Comodo Downloader" RD /S /Q "Comodo Downloader"

cd "%systemdrive%\Documents and Settings\All Users\Application Data\comodo\"
IF EXIST "Firewall Pro" RD /S /Q "Firewall Pro"
IF EXIST "COMODOFirewall" RD /S /Q "COMODOFirewall"
IF EXIST "common" RD /S /Q "common"
IF EXIST "tmp" RD /S /Q "tmp"

cd %systemdrive%\Documents and Settings\All Users\Desktop\"
IF EXIST "COMODO Internet Security.lnk" DEL "COMODO Internet Security.lnk"

cd "%systemdrive%\Documents and Settings\%username%\Application Data\Comodo\"
IF EXIST "Firewall Pro" RD /S /Q "Firewall Pro"
IF EXIST "UserThemes" RD /S /Q "UserThemes"
IF EXIST "HopSurfToolbar" RD /S /Q "HopSurfToolbar"

cd "%systemdrive%\Documents and Settings\All Users\Start Menu\Programs\Comodo\"
IF EXIST "COMODO Internet Security" RD /S /Q "COMODO Internet Security"

cd "%programfiles%\Comodo\"
IF EXIST "COMODO Internet Security" RD /S /Q "COMODO Internet Security"
IF EXIST "SafeSurf" RD /S /Q "SafeSurf"
IF EXIST "Firewall" RD /S /Q "Firewall"
IF EXIST "SafeSurf" RD /S /Q "SafeSurf"
IF EXIST "HopSurfToolbar" RD /S /Q "HopSurfToolbar"
IF EXIST "COMODO livePCsupport" RD /S /Q "COMODO livePCsupport"
IF EXIST "AntiVirus" RD /S /Q "AntiVirus"
IF EXIST "COMODO AntiVirus" RD /S /Q "COMODO AntiVirus"


cd "%windir%\Installer\"
IF EXIST "{A31A5DFC-3439-48FC-99BB-5174168AE471}" RD /S /Q "{A31A5DFC-3439-48FC-99BB-5174168AE471}"
IF EXIST "{CC6B1BB4-4E06-4A5B-A166-B371B551324B}" RD /S /Q "{CC6B1BB4-4E06-4A5B-A166-B371B551324B}"

cd "%windir%\Prefetch\"
IF EXIST "CISFREE_INSTALLER_X86.EXE*.pf" DEL "CISFREE_INSTALLER_X86.EXE*.pf"
IF EXIST "CLPSLS.EXE*.pf" DEL "CLPSLS.EXE*.pf"
IF EXIST "CRTMAN.TMP*.pf" DEL "CRTMAN.TMP*.pf"



cd "%windir%\system32\"
IF EXIST "guard32.dll" DEL "guard32.dll"
IF EXIST "cssdll32.dll" DEL "cssdll32.dll"
IF EXIST "guard64.dll" DEL "guard64.dll"
IF EXIST "cssdll64.dll" DEL "cssdll64.dll"

cd "%windir%\system32\drivers\"
IF EXIST "cmdguard.sys" DEL "cmdguard.sys"
IF EXIST "cmdhlp.sys" DEL "cmdhlp.sys"
IF EXIST "inspect.sys" DEL "inspect.sys"
IF EXIST "sfi.dat" DEL "sfi.dat"
IF EXIST "cmderd.sys" DEL "cmderd.sys"

cd "%programfiles%\"
IF EXIST "AskSBar" RD /S /Q "AskSBar"
IF EXIST "AskSBar" RD /S /Q "AskSBarDis"
IF EXIST "AskSearch" RD /S /Q "AskSearch"

cd "%programfiles%\Mozilla Firefox\components"
IF EXIST "AskSearch.js" DEL "AskSearch.js"

cd "%appdata%\Mozilla\Firefox\extensions\"

cd "%appdata%\Mozilla\extensions\"

if exist "%allusersprofile%\Application Data\Comodo" RD /S /Q "%allusersprofile%\Application Data\Comodo"
Regsvr32 /u /s "%systemroot%\system32\guard32.dll"
if exist %systemroot%\system32\guard32.dll DEL /S /Q /A:SHR %systemroot%\system32\guard32.dll


echo REIGSTRY LOCATIONS ARE DOWN BELOW >nul


> %TEMP%.\LEGACYKEYS.TMP ECHO \Registry\Machine\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDAGENT [1]
>>%TEMP%.\LEGACYKEYS.TMP ECHO \Registry\Machine\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDGUARD [1]
>>%TEMP%.\LEGACYKEYS.TMP ECHO \Registry\Machine\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDHLP [1]
>>%TEMP%.\LEGACYKEYS.TMP ECHO \Registry\Machine\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_INSPECT [1]

regini %temp%\LEGACYKEYS.TMP

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CavShell.CntMenu" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CavShell.CntMenu.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\file\ShellEx\ContextMenuHandlers\Comodo Antivirus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\cmdAgent" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\cmdHlp" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\cmdGuard" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Inspect" /F

REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\Firewall Pro" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D871E8DFE4B8AD244B43FE2F0723B9C1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{963236D9-AB2B-4baf-B1F8-CF5BBD988268}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\ComodoGroup\CDI" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{710DF252-2566-41d3-BAF9-CEFA5840BFD2}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{B004FD67-F058-49e6-96DA-99237A82133C}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{D6267144-4B06-402a-808D-52D498387079}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Drive\shellex\ContextMenuHandlers\Comodo Antivirus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Drive\shellex\ContextMenuHandlers\Comodo Antivirus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\Comodo Antivirus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\D871E8DFE4B8AD244B43FE2F0723B9C1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\D871E8DFE4B8AD244B43FE2F0723B9C1" /F
REG DELETE "HKEY_CURRENT_USER\Software\CFP" /F
REG DELETE "HKEY_CURRENT_USER\Software\ComodoGroup\CFP" /F
REG DELETE "HKEY_CURRENT_USER\Software\ComodoGroup\CFPSkin" /F
REG DELETE "HKEY_CURRENT_USER\Software\ComodoGroup\CIS" /F
REG DELETE "HKEY_CURRENT_USER\Software\AppDataLow\AskBarDis" /F
REG DELETE "HKEY_CURRENT_USER\Software\AskBarDis" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\Cam" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\Software\Comodo\CLPS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CLPS_Language" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\cmderd" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\CLPS_Language" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDAGENT" /F
REG DELETE "HKEY_USERS\S-1-5-21-1123561945-813497703-842925246-1004\Software\CFP" /F
REG DELETE "HKEY_CLASSES_ROOT\CLSID\{4255A182-CAD9-4214-A19B-7BA7FB633BBD}" /F
REG DELETE "HKEY_CLASSES_ROOT\TypeLib\{96D27592-5FAA-4B65-AE65-C41AA290ABCD}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\cmderd" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\CLPS_Language" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\cmderd" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CLPS_Language" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CLPSLS" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cmderd" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\COMODO Firewall Pro" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Ask Toolbar_is1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\COMDOO SafeSurf" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Help Objects\{201f27d4-3704-41d6-89c1-aa35e39143ed}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{A31A5DFC-3439-48FC-99BB-5174168AE471}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{CC6B1BB4-4E06-4A5B-A166-B371B551324B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Comodo HopSurf Toolbar" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\HopSurfToolbar_IE.HopSurfToolbarButto.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\HopSurfToolbar_IE.HopSurfToolbarButton" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\HopSurfToolbar_IE.StockBar" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\HopSurfToolbar_IE.StockBar.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\HopSurfToolbar_IE.WebEventHandler" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\HopSurfToolbar_IE.WebEventHandler.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskSBar.SettingsPlugin" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskSBar.SettingsPlugin.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskSBar.ToolbarPlugin" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskSBar.ToolbarPlugin.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterBarButton" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterBarButton\ID" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterBarButton\CurVer" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterBarButton.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterBarButton.1\ID" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterSettingsControl" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterSettingsControl\ID" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterSettingsControl\CurVer" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterSettingsControl.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskIBar.PopSwatterSettingsControl.1\ID" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskToolBar.SettingsPlugin" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskToolBar.SettingsPlugin\ID" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskToolBar.SettingsPlugin\CurVer" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskToolBar.SettingsPlugin.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AskToolBar.SettingsPlugin.1\ID" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\FileAccessGuardian.FileEventsListener" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\FileAccessGuardian.FileEventsListener.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\FileAccessGuardian.FileWorker" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\FileAccessGuardian.FileWorker.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\Comodo Antivirus" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\CavShell.DLL" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{E11C8519-5595-4397-B515-AB036DEC467A}" /F
REG DELETE "HLEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{11399340-54AF-4E3B-8D38-1F248ACBBEDE}" /F
REG DELETE "HLEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{AD934087-29B4-49DC-AF17-389C987E5E4C}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{0579B4B1-0293-4d73-B02D-5EBB0BA0F0A2}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{B15FD82E-85BC-430d-90CB-65DB1B030510}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{F0D4B231-DA4B-4daf-81E4-DFEE4931A4AA}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{F0D4B238-DA4B-4daf-81E4-DFEE4931A4AA}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{F0D4B239-DA4B-4daf-81E4-DFEE4931A4AA}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{0702a2b6-13aa-4090-9e01-bcdc85dd933f}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{08993A7C-E764-4172-9627-BFB5EA6897B2}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{128A6C66-AC6A-4617-8268-AB7F47B7215E}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{201f27d4-3704-41d6-89c1-aa35e39143ed}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{3041d03e-fd4b-44e0-b742-2d9b88305f98}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{528B5866-2BA6-42ce-8F74-39FB23B49767}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{571715D7-3395-4DF0-B43C-784836209E60}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{622fd888-4e91-4d68-84d4-7262fd0811bf}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{710DF252-2566-41d3-BAF9-CEFA5840BFD2}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{9AFB8248-617F-460d-9366-D71CDEDA3179}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{B004FD67-F058-49e6-96DA-99237A82133C}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{b0de3308-5d5a-470d-81b9-634fc078393b}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{C94E154B-1459-4A47-966B-4B843BEFC7DB}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{EC1D2C70-8CDE-4013-BE72-2B08A2C54B6B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{0C0F2638-DA56-4A03-89A5-DCDCE2FF9EEB}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{4CDE5722-7455-4D9F-AC07-B09D1B8DB6ED}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{6BBCFF8E-D837-4DA4-9141-1F645B34A179}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{D3E6E554-4194-4E4E-9DEC-1150FDDC8662}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ID\{E9FAB13D-4600-49E1-90D1-EE961C859D39}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\FileAccessGuardian.DLL" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\HopSurfToolbar_IE.DLL" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\4BB1B6CC60E4B5A41A663B175B1523B4" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\CFD5A13A9343CF8499BB154761A84E17" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\4BB1B6CC60E4B5A41A663B175B1523B4" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\CFD5A13A9343CF8499BB154761A84E17" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\C71F3D9B2D7958249946FB6DDAFF3EF8" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\DC35A1F51BF0DA3459BBF46A5BE388B3" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{5F03A2BD-D9ED-45FF-BBC6-41700AAD91B8}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{81713778-717A-4E70-9F29-ABF736174FDE}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{90EC0BDD-7FC9-47C1-ACE3-C3B2B9A8282F}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{DA654AE7-EB81-4C44-BAA6-91BB0B7ED8F4}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{5EBE38FA-ECED-4BF4-8346-C2EF38FD2161}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{96D27592-5FAA-4B65-AE65-C41AA290ABCD}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{ED4B11D8-606A-45C2-8589-1B0DC320962C}" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterBarButton" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterBarButton\ID" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterBarButton\CurVer" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterBarButton.1" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterBarButton.1\ID" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterSettingsControl" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterSettingsControl\ID" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterSettingsControl\CurVer" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterSettingsControl.1" /F
REG DELETE "HKEY_CLASSES_ROOT\AskIBar.PopSwatterSettingsControl.1\ID" /F
REG DELETE "HKEY_CLASSES_ROOT\AskToolBar.SettingsPlugin" /F
REG DELETE "HKEY_CLASSES_ROOT\AskToolBar.SettingsPlugin\ID" /F
REG DELETE "HKEY_CLASSES_ROOT\AskToolBar.SettingsPlugin\CurVer" /F
REG DELETE "HKEY_CLASSES_ROOT\AskToolBar.SettingsPlugin.1" /F
REG DELETE "HKEY_CLASSES_ROOT\AskToolBar.SettingsPlugin.1\ID" /F
REG DELETE "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Comodo Antivirus" /F
REG DELETE "HKEY_CLASSES_ROOT\AppID\CavShell.DLL" /F
REG DELETE "HKEY_CLASSES_ROOT\AppID\{E11C8519-5595-4397-B515-AB036DEC467A}" /F
REG DELETE "HKEY_CLASSES_ROOT\AppID\{AD934087-29B4-49DC-AF17-389C987E5E4C}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{0579B4B1-0293-4d73-B02D-5EBB0BA0F0A2}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{B15FD82E-85BC-430d-90CB-65DB1B030510}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{F0D4B231-DA4B-4daf-81E4-DFEE4931A4AA}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{F0D4B238-DA4B-4daf-81E4-DFEE4931A4AA}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{F0D4B239-DA4B-4daf-81E4-DFEE4931A4AA}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{0702a2b6-13aa-4090-9e01-bcdc85dd933f}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{08993A7C-E764-4172-9627-BFB5EA6897B2}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{128A6C66-AC6A-4617-8268-AB7F47B7215E}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{201f27d4-3704-41d6-89c1-aa35e39143ed}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{3041d03e-fd4b-44e0-b742-2d9b88305f98}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{4255A182-CAD9-4214-A19B-7BA7FB633BBD}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{528B5866-2BA6-42ce-8F74-39FB23B49767}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{571715D7-3395-4DF0-B43C-784836209E60}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{622fd888-4e91-4d68-84d4-7262fd0811bf}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{710DF252-2566-41d3-BAF9-CEFA5840BFD2}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{9AFB8248-617F-460d-9366-D71CDEDA3179}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{B004FD67-F058-49e6-96DA-99237A82133C}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{b0de3308-5d5a-470d-81b9-634fc078393b}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{C94E154B-1459-4A47-966B-4B843BEFC7DB}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{D6267144-4B06-402a-808D-52D498387079}" /F
REG DELETE "HKEY_CLASSES_ROOT\ID\{EC1D2C70-8CDE-4013-BE72-2B08A2C54B6B}" /F
REG DELETE "HKEY_USERS\S-1-5-21-1417001333-329068152-839522115-1003\Software\CFP" /F
REG DELETE "HKEY_USERS\S-1-5-21-1417001333-329068152-839522115-1003\Software\Comodo\CIS" /F
REG DELETE "HKEY_USERS\S-1-5-21-1417001333-329068152-839522115-1003\Software\ComodoGroup\CIS" /F
REG DELETE "HKEY_USERS\S-1-5-21-1417001333-329068152-839522115-1003\Software\ComodoGroup\Hopsurf" /F
REG DELETE "HKEY_USERS\S-1-5-21-1960408961-839522115-1957994488-500\Software\AppDataLow\AskBarDis" /F
REG DELETE "HKEY_USERS\S-1-5-21-1960408961-839522115-1957994488-500\Software\Microsoft\Internet Explorer\SearchScopes\{CF739809-1C6C-47C0-85B9-569DBB141420}" /F
REG DELETE "HKEY_USERS\S-1-5-21-746137067-1935655697-839522115-1003\Software\Comodo\CIS" /F
REG DELETE "HKEY_USERS\S-1-5-21-746137067-1935655697-839522115-1003\Software\ComodoGroup\HopSurf" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDAGENT" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDERD\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDERD\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDERD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDGUARD\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDGUARD\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDHLP\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_CMDHLP\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_INSPECT\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_INSPECT\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDERD\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDERD\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDERD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDGUARD\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDGUARD\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDGUARD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDHLP\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDHLP\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_CMDHLP" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_INSPECT\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_INSPECT\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Enum\Root\LEGACY_INSPECT" /F


REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FD8E178D-8B4E-42DA-B434-EFF270329B1C}" /F

REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDERD\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDERD\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDERD" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDGUARD\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDGUARD\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDHLP\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CMDHLP\0000" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_INSPECT\0000\Control" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_INSPECT\0000" /F



> %TEMP%.\REGISTRY.REG ECHO REGEDIT4
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "COMODO SafeSurf"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "Comodo Internet Security"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\SearchScopes]
>>%TEMP%.\REGISTRY.REG ECHO "{CF739809-1C6C-47C0-85B9-569DBB141420}"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
>>%TEMP%.\REGISTRY.REG ECHO "Start Page"="about:blank"
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Toolbar]
>>%TEMP%.\REGISTRY.REG ECHO "{E9FAB13D-4600-49E1-90D1-EE961C859D39}"=-
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "cfp"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "CLPSLA"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "Comodo GeekBuddy"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "Comodo Antivirus"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "Comodo"=-
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO.
>>%TEMP%.\REGISTRY.REG ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>%TEMP%.\REGISTRY.REG ECHO "Comodo Firewall Pro"=-
>>%TEMP%.\REGISTRY.REG ECHO.



START /WAIT REGEDIT /S %TEMP%.\REGISTRY.REG
cd "%TEMP%"
del "REGISTRY"

NET STOP WINMGMT /Y

cd "%windir%\system32\wbem\"
RD /S /Q "Repository"

NET START WINMGMT /Y
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
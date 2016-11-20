@echo off
title CEVPN Removal Tool
cls

:MAIN

cls
echo --------------------------------------------
echo --       What Would You Like To Do?       --
echo --------------------------------------------
echo.
echo You have choosen to remove CEVPN, Any Data that
echo may have been created by CEVPN may be removed using
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

ipconfig /release
taskkill /f /im EasyVPN.exe /im crdphService.exe 
echo.
ping localhost -n 2 >nul
taskkill /f /im APPSHA~1.EXE /im Vpnservice.exe

net stop vpnservice
sc delete vpnservice

net stop crdphService
sc delete crdphservice

net stop EasyVpnAdpt
sc delete EasyVpnAdpt


REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{9EA4CC94-B5D9-4515-A62C-B91F4E93DC64}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{AFA51984-FE21-4725-BE31-D16F4EBD0C89}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{B707753B-8CB4-4713-88E1-B83B1AB9467A}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppShareService.ContactList" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppShareService.ContactList.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{060D4117-3089-40f4-8F1E-E4C60A1EBEA9}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{9400D8F7-0F6A-41FB-9EA5-7AAF927513ED}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{DB35DD77-55E2-4905-8075-EB351BB5CBC1}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E444476E-19F1-4BAD-8BE0-E3F84DF8B7A4}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F0919C80-6C5D-4EBE-B0D3-6D70CBDEAFA0}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\GifSmiley.GifSmileyCtrl" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\GifSmiley.GifSmileyCtrl.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\7572266142738AD45ACCC37E65638E9B" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\7572266142738AD45ACCC37E65638E9B" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\1D9544EEE968E3941A0D8FE9D535E818" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{0418FB4B-E1AF-4E32-94AD-FF322C622AD3}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{244AC5ED-A4A7-4930-B380-F9B8ED66A99B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{2C11A968-6A99-475B-B2C8-6C9B82E2DD4E}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{6E730D01-C6C9-4E6B-BB55-AC8F04B2FF99}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{8C348C95-1AAA-4BE6-BE92-D62BD822E379}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{94C3B57D-FED9-4851-89C4-697275491E92}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{9D50BD65-6B67-4586-9790-E85D31F99E87}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CB64102B-8CE4-4A55-B050-131C435A3A3F}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{FA452088-6B81-47A7-AACA-2F8598A33848}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ProtocolWrapper.Protocol" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ProtocolWrapper.Protocol.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{2C5E6620-7364-41DB-910C-C765D4DB6058}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{AFA51984-FE21-4725-BE31-D16F4EBD0C89}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{DC5BE3CD-9A83-4867-B556-26723026634B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DIFx\DriverStore\cmdatp_C7DE50010EA94305AA4A39FB4D88FBD33905C161" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DIFxApp\Components\{BFAD94FE-7B36-41FD-989F-877CD1E9EF29}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\7572266142738AD45ACCC37E65638E9B" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{16622757-3724-4DA8-A5CC-3CE75636E8B9}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\CVPN0101" /F

REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CRDPHSERVICE" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_EASYVPNADPT" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Hardware Profiles\0001\System\CurrentControlSet\Enum\ROOT\CVPN0101" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\{40081323-1B28-4264-A077-F4BA2A22BE17}" /F
REG DELETE "HKEY_USERS\.DEFAULT\Software\ORL\VNCHooks\Application_Prefs\crdphService.exe" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\COMODO EasyVPN" /F
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Network\RefNames" /v "COMODOCOMODO EasyVPN" /F
reg delete "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Run" /v "Comodo EasyVPN" /F


cd %systemroot%\system32\drivers
del /f /q cmdatp.sys

del /f /s /q %temp%
if exist %programfiles%\Comodo\EasyVPN RD /S /Q %programfiles%\Comodo\EasyVPN
if exist %appdata%\Comodo\EasyVPN RD /S /Q %appdata%\Comodo\EasyVPN
if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\EasyVPN" RD /S /Q "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\EasyVPN"
if exist "%Public\Desktop\Comodo EasyVPN.lnk" del /q "%Public\Desktop\Comodo EasyVPN.lnk"
if exist %programdata%\Comodo\EasyVPN RD /S /Q %programdata%\Comodo\EasyVPN
if exist "%allusersprofile%\Start Menu\Programs\Comodo\EasyVPN" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\EasyVPN"
if exist "%allusersprofile%\Desktop\Comodo EasyVPN.lnk" del /q "%allusersprofile%\Desktop\Comodo EasyVPN.lnk"
if exist "%allusersprofile%\Application Data\Comodo\EasyVPN" RD /S /Q "%allusersprofile%\Application Data\Comodo\EasyVPN"

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
echo Right click "EasyVPN Adapter" then Click
echo Uninstall, a Confirmation Window should apear,
echo Select Ok/Uninstall to Confirm
echo            OR
echo Right Click "EasyVPN Adapter" then Click on Uninstall
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

taskkill /f /im EasyVPN.exe /im crdphService.exe /im APPSHA~1.EXE /im Vpnservice.exe

net stop vpnservice

net stop crdphService
sc delete crdphservice

net stop EasyVpnAdpt
sc delete EasyVpnAdpt


REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{9EA4CC94-B5D9-4515-A62C-B91F4E93DC64}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{AFA51984-FE21-4725-BE31-D16F4EBD0C89}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{B707753B-8CB4-4713-88E1-B83B1AB9467A}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppShareService.ContactList" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppShareService.ContactList.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{060D4117-3089-40f4-8F1E-E4C60A1EBEA9}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{9400D8F7-0F6A-41FB-9EA5-7AAF927513ED}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{DB35DD77-55E2-4905-8075-EB351BB5CBC1}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E444476E-19F1-4BAD-8BE0-E3F84DF8B7A4}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{F0919C80-6C5D-4EBE-B0D3-6D70CBDEAFA0}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\GifSmiley.GifSmileyCtrl" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\GifSmiley.GifSmileyCtrl.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Features\7572266142738AD45ACCC37E65638E9B" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\7572266142738AD45ACCC37E65638E9B" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\UpgradeCodes\1D9544EEE968E3941A0D8FE9D535E818" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{0418FB4B-E1AF-4E32-94AD-FF322C622AD3}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{244AC5ED-A4A7-4930-B380-F9B8ED66A99B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{2C11A968-6A99-475B-B2C8-6C9B82E2DD4E}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{6E730D01-C6C9-4E6B-BB55-AC8F04B2FF99}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{8C348C95-1AAA-4BE6-BE92-D62BD822E379}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{94C3B57D-FED9-4851-89C4-697275491E92}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{9D50BD65-6B67-4586-9790-E85D31F99E87}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{CB64102B-8CE4-4A55-B050-131C435A3A3F}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Interface\{FA452088-6B81-47A7-AACA-2F8598A33848}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ProtocolWrapper.Protocol" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ProtocolWrapper.Protocol.1" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{2C5E6620-7364-41DB-910C-C765D4DB6058}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{AFA51984-FE21-4725-BE31-D16F4EBD0C89}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{DC5BE3CD-9A83-4867-B556-26723026634B}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DIFx\DriverStore\cmdatp_C7DE50010EA94305AA4A39FB4D88FBD33905C161" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DIFxApp\Components\{BFAD94FE-7B36-41FD-989F-877CD1E9EF29}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\7572266142738AD45ACCC37E65638E9B" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{16622757-3724-4DA8-A5CC-3CE75636E8B9}" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\CVPN0101" /F

REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_CRDPHSERVICE" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\Root\LEGACY_EASYVPNADPT" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Hardware Profiles\0001\System\CurrentControlSet\Enum\ROOT\CVPN0101" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\{40081323-1B28-4264-A077-F4BA2A22BE17}" /F
REG DELETE "HKEY_USERS\.DEFAULT\Software\ORL\VNCHooks\Application_Prefs\crdphService.exe" /F
REG DELETE "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\ComodoGroup\COMODO EasyVPN" /F
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Network\RefNames" /v "COMODOCOMODO EasyVPN" /F
reg delete "HKEY_USERS\S-1-5-21-448539723-1715567821-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Run" /v "Comodo EasyVPN" /F

cd %systemroot%\system32\drivers
del /f /q cmdatp.sys

del /f /s /q %temp%
if exist %programfiles%\Comodo\EasyVPN RD /S /Q %programfiles%\Comodo\EasyVPN
if exist %appdata%\Comodo\EasyVPN RD /S /Q %appdata%\Comodo\EasyVPN
if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\EasyVPN" RD /S /Q "%programdata%\Microsoft\Windows\Start Menu\Programs\Comodo\EasyVPN"
if exist "%Public\Desktop\Comodo EasyVPN.lnk" del /q "%Public\Desktop\Comodo EasyVPN.lnk"
if exist %programdata%\Comodo\EasyVPN RD /S /Q %programdata%\Comodo\EasyVPN
if exist "%allusersprofile%\Start Menu\Programs\Comodo\EasyVPN" RD /S /Q "%allusersprofile%\Start Menu\Programs\Comodo\EasyVPN"
if exist "%allusersprofile%\Desktop\Comodo EasyVPN.lnk" del /q "%allusersprofile%\Desktop\Comodo EasyVPN.lnk"
if exist "%allusersprofile%\Application Data\Comodo\EasyVPN" RD /S /Q "%allusersprofile%\Application Data\Comodo\EasyVPN"

ipconfig /renew
title CEVPN Removal
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
@echo off
title Optimize Internet by Disabling Background Apps
echo Running as Administrator...

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as Administrator.
    pause
    exit
)

:: Disable Background Apps via Registry
echo Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f

:: Disable Background Apps via Group Policy (for Windows Pro & above)
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f

:: Stop unnecessary services
echo Stopping unnecessary services...
sc stop wuauserv
sc config wuauserv start= disabled

sc stop BITS
sc config BITS start= disabled

sc stop XblGameSave
sc config XblGameSave start= disabled

sc stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled

:: Optional: Disable OneDrive sync temporarily
echo Disabling OneDrive (optional)...
taskkill /f /im OneDrive.exe >nul 2>&1

echo.
echo Background apps and services disabled. This may improve network performance.
pause
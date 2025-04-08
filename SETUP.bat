@echo off
echo Adding Roblox firewall rule...

REM Command to add the rule (disabled by default)
netsh advfirewall firewall add rule name="Block-Roblox-Outbound" dir=out action=block program="%USERPROFILE%\AppData\Local\Roblox\Versions\version-347f4ac346734391\RobloxPlayerBeta.exe" enable=no

REM Check if the previous command was successful
if %errorlevel% neq 0 (
    echo ERROR: Failed to add firewall rule. Please check for errors above.
    echo Script will not be deleted.
    pause
    exit /b 1
)

echo Firewall rule "Block-Roblox-Outbound" added successfully (Disabled).
echo.
echo This batch file will now delete itself.

REM Use timeout to wait briefly, then delete this batch file (%~f0 is the full path to this file)
REM Start a new hidden cmd process to perform the deletion so this script can exit first
start "" /B cmd /c "timeout /t 2 /nobreak > nul && del "%~f0""

REM Exit this script instance
exit /b 0
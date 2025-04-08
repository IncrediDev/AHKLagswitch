@echo off
netsh advfirewall firewall set rule name="Block-Roblox-Outbound" new enable=yes
echo Firewall rule "Block-Roblox-Outbound" Enabled (Blocked).
REM Optional: Add a pause or timeout if you want the window to stay open
REM timeout /t 1 /nobreak > nul 
@echo off
netsh advfirewall firewall set rule name="Block-Roblox-Outbound" new enable=no
echo Firewall rule "Block-Roblox-Outbound" Disabled (Allowed).
REM Optional: Add a pause or timeout if you want the window to stay open
REM timeout /t 1 /nobreak > nul
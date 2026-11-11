@echo off
rem Opens the two Hunter3D ports in Windows Firewall (needs administrator).
net session >nul 2>&1
if errorlevel 1 (
    echo Right-click this file and choose "Run as administrator".
    pause
    exit /b 1
)

netsh advfirewall firewall delete rule name="Hunter3D LAN" >nul 2>&1
netsh advfirewall firewall delete rule name="Hunter3D Web" >nul 2>&1
netsh advfirewall firewall add rule name="Hunter3D LAN" dir=in action=allow protocol=UDP localport=27015 profile=any
netsh advfirewall firewall add rule name="Hunter3D Web" dir=in action=allow protocol=TCP localport=8080 profile=any
echo.
echo Done: UDP 27015 and TCP 8080 are open.
pause

@echo off
setlocal

rem Resolve the IP address using nslookup
for /f "tokens=2 delims=: " %%a in ('nslookup server.fideseques.org ^| find "Address:" ^| findstr /r /v /c:"^Address:  [a-zA-Z]"') do set IP=%%a

rem Trim any leading or trailing spaces
set IP=%IP%

rem Check if IP is set
if "%IP%"=="" (
    echo Failed to resolve IP address for server.fideseques.org
    pause
    exit /b 1
)

rem Create the Steam join link
set PORT=27016
set PASSWORD=FidesEques
set STEAM_LINK=steam://connect/%IP%:%PORT%/%PASSWORD%

rem Output the link (for debugging purposes)
echo %STEAM_LINK%

rem Optionally, open the link directly in Steam
start %STEAM_LINK%

endlocal
pause
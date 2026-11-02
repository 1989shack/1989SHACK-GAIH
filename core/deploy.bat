@echo off
echo === 1989SHACK GAIH FAST DEPLOY ===
set LAN_IP=192.168.137.1
set ROOT=C:\inetpub\wwwroot\1989SHACK-GAIH

for /L %%i in (10001,1,10051) do (
  echo Deploying port %%i to %LAN_IP%:%%i
  xcopy %ROOT%\apps\app%%i %ROOT%\live\app%%i /E /Y /Q
)
echo All 51 ports deployed in Duala mode [%LAN_IP%]
pause
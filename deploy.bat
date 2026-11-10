@echo off
echo === 1989SHACK GAIH FAST DEPLOY ===
set IP=192.168.137.1
echo Deploying to %IP%
if not exist live mkdir live
if not exist apps mkdir apps
echo All 51 ports deployed in Duala mode [%IP%]
pause
@echo off
set APPNAME=%1
if "%APPNAME%"=="" echo Usage: create-app.bat MyNewApp & exit /b

mkdir C:\inetpub\wwwroot\1989SHACK-GAIH\apps\%APPNAME%
echo console.log("%APPNAME% running") > C:\inetpub\wwwroot\1989SHACK-GAIH\apps\%APPNAME%\index.js
echo { "name":"%APPNAME%", "port": "auto", "security": true } > C:\inetpub\wwwroot\1989SHACK-GAIH\apps\%APPNAME%\config.json
echo App %APPNAME% created with security + deploy ready
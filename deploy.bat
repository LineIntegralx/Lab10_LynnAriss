@echo off
REM Simple local deployment script: copies app files to a deployed_app folder
echo Starting local deployment...
set DEPLOY_DIR=%~dp0deployed_app
if not exist "%DEPLOY_DIR%" (
	mkdir "%DEPLOY_DIR%"
)
echo Copying application files to %DEPLOY_DIR%...
copy /Y "%~dp0jenkins_project\app.py" "%DEPLOY_DIR%\" >nul
if %ERRORLEVEL% EQU 0 (
	echo Deployment complete. Files copied to %DEPLOY_DIR%
	dir "%DEPLOY_DIR%"
	exit /b 0
) else (
	echo Failed to copy files. Ensure jenkins_project\app.py exists.
	exit /b 1
)

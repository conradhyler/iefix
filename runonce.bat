@echo off
CLS

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO Invoking UAC for Privilege Escalation
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
ECHO For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
ECHO args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
ECHO Next >> "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B

:gotPrivileges
if '%1'=='ELEV' shift /1
setlocal & pushd .
cd /d %~dp0

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::

REM Run shell as admin (example) - put here code as you like
@echo off
ECHO =============================
ECHO This script runs once. Please do not exit the script.
ECHO This script runs once. Please do not exit the script.
ECHO This script runs once. Please do not exit the script.
ECHO =============================
echo Opening Internet Explorer
start "IE Window" "C:\Program Files (x86)\Internet Explorer\iexplore.exe"
timeout 15
taskkill /f /im iexplore.exe /t
echo Closing Internet Explorer
echo Setting up IE for CADWEB
cscript "C:\Program Files\trusted.vbs"
REGEDIT /S "C:\Program Files\zones.reg"
DEL "%~f0"
Echo Complete!
pause
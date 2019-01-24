@echo off

Call :GetInfo
Call :RegisterInfo
If %StrHostName%==DouglasFerreira GoTo UserMsg
exit

:GetInfo
For /F "usebackq" %%i In (`hostname`) DO Set StrHostName=%%i
Set EventMsg=O servidor %StrHostName% inicializou 
Set DateAndTime=%date% %time%
Set LogMsg=%DateAndTime% - %EventMsg%
Set LogFolderPath=C:\Automalogica
Set LogFileName=LogWindows.txt
GoTo :eof

:RegisterInfo
if not exist %LogFolderPath%\NUL mkdir %LogFolderPath%
echo %LogMsg%>>%LogFolderPath%\%LogFileName%
GoTo :eof

:UserMsg
cls
Set StrMsg=A inicializacao do windows foi registrada
echo %StrMsg%
pause>nul
exit



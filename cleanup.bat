setlocal
set VBOXNAME=packer-virtualbox-iso
vboxmanage showvminfo %VBOXNAME% >%TEMP%\cleanup.txt

for /f "tokens=3 usebackq" %%i in (`findstr /r "Log.folder:" %TEMP%\cleanup.txt`) do (
if exist %%i rmdir /S /Q %%i\..
set VBOXDIR=%%i
)
del /F /Q %TEMP%\cleanup.txt

vboxmanage controlvm %VBOXNAME% poweroff
vboxmanage unregistervm %VBOXNAME% --delete

rmdir /S /Q output-virtualbox-iso
ping 127.0.0.1 -n 2 -w 2000 > nul
if not "%VBOXDIR%x"=="x" if exist "%VBOXDIR%" rmdir /S /Q "%VBOXDIR%\.."



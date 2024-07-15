@echo off

if "%os%"=="Windows NT" (setlocal)

set App="%APPDATA%\miniworldgameguan110\microminiforwebbrowser.exe"
set App2="%APPDATA%\miniworldgameguan110\microminiforwebbrowserold.exe"

set argC=0

for %%x in (%*) do (
    set /a argC+=1
)

echo [INFO] Successfully got argc

if %argC%==0 (
    echo minibr Address [-o]
    echo -o: Use IE kernel
    goto finish
)

if %argC%==2 ( 
    goto t1
)

goto f1

:t1
if %1==-o (
    goto firsto
)

goto secondproc

:firsto
echo %App2% -%2>exec.bat
echo [INFO] Found -o at argv[1]
echo [WARN] Running IE kernel.
goto execr

:secondproc

if %2==-o (
    goto normal
) else (
    goto error
)

:normal
echo %App2% -%1>exec.bat
echo [INFO] Found -o at argv[2]
echo [WARN] Running IE kernel.

goto execr
:f1
echo %App% -%1>exec.bat

:execr
echo Executing...
exec.bat
del exec.bat
goto finish
:error
echo [ERROR] Unknown args.
goto finish
:finish

if "%os%"=="Windows NT" (endlocal)

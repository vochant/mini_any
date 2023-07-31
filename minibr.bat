@echo off

if "%os%"=="Windows NT" (setlocal)

set App="%APPDATA%\miniworldgameguan110\microminiforwebbrowser.exe"
set App2="%APPDATA%\miniworldgameguan110\microminiforwebbrowserold.exe"

set argC=0

for %%x in (%*) do (
    set /a argC+=1
)

echo [INFO] Success to get argc

if %argC%==0 (
    echo minibr Address [-o]
    echo -o:Use classic version
    goto finish
)

echo [INFO] Argc is OK

if %argC%==2 ( 
    goto t1
)

goto f1

:t1
echo [INFO] Running double-args proc.
if %1==-o (
    goto firsto
)

goto secondproc

:firsto
echo %App2% -%2>exec.bat
echo [INFO] Finded -o at argv[1]
echo [WARN] Running IE version.
goto execr

:secondproc
echo [INFO] Proccess-DA:normal

if %2==-o (
    echo [INFO] Go-to normal
    goto normal
) else (
    echo [INFO] Go-to error
    goto error
)

:normal
echo %App2% -%1>exec.bat
echo [INFO] Finded -o at argv[2]
echo [WARN] Running classic version.

goto execr
:f1
echo [INFO] Running normal mode
echo %App% -%1>exec.bat

:execr
echo Executing...
exec.bat
del exec.bat
goto finish
:error
echo [ERROR] Unknown arg.
goto finish
:finish

if "%os%"=="Windows NT" (endlocal)
@echo off

if "%os%"=="Windows NT" (setlocal)

set argC=0

for %%x in (%*) do (
    set /a argC+=1
)
set Execa=minibr
cd /d %~dp0

if exist installing.tmp (
	del installing.tmp
	goto prep_2
)

if exist browser_setup.tag (
    goto already
)
echo Setup MiniWorld Browser Startup Tools
echo =============================================
echo a. This PC is already installed MiniWorld.
echo b. I did not install it, please do it auto.
set Mode="!"
:loop_begin
set /p Mode="mode_select$"
if %Mode%==a (
    goto prep_2
)
if %Mode%==b (
    goto prep_1
)
echo Sorry, please input a or b.
goto loop_begin
:prep_1
echo Downloading...
powershell (new-object Net.WebClient).DownloadFile('https://mdownload.mini1.cn/latest/miniworldoffice.exe','.\installer__.exe')
echo Installing...
installer__
:starta
choice /t 1 /d y /n >nul
tasklist|find /i "installer__.exe"
if %errorlevel%==0 ( 
	goto starta
) else (
    goto done
)
:done
echo Done!
:start
choice /t 1 /d y /n >nul
tasklist|find /i "MicroMiniNew.exe"
if %errorlevel%==0 ( 
	goto Kill
) else (
    goto start
)
:kill
taskkill /im MicroMiniNew.exe
echo temp>installing.tmp
echo Now you should log-in the game and download files in the game.
echo Because some plug-ins are not installed now.
echo When you can play the game, please close it and next your setup.
echo Press any key to exit...
pause>nul
goto ExitPoint
:prep_2
echo Now the program is preparing the runtime environment.
echo PLEASE WAIT!
echo 114514>browser_setup.tag
timeout /t 3 /nobreak>nul
echo Prepare is done, press any key to continue...
pause>nul
:already
if %argC%==2 (
    minibr %1 %2
    goto ExitPoint
)
if %argC%==1 (
    goto Check
)
set Lite=0
goto Read
:Check
if %1==-o (
    set Execa=minibr -o
    set Lite=1
    goto Read
)
minibr %1
goto ExitPoint
:Read
set /p net_addr="Target address:"
if %Lite%==0 (
    goto Query
)
goto Exec
:Query
echo Now you should select the kernal.
echo a=Chromium(New, MicroMiniForWebBrowser.exe)
echo b=IE(Old, MicroMiniForWebBrowserOld.exe)
set eO=c
:Query_head
set /p eO="mode_select$"
if %eO%==a (
    goto Exec
)
if %eO%==b (
    set Execa=minibr -o
    goto Exec
)
echo Sorry,please input a or b.
goto Query_head
:Exec
echo !!!EXECUTING!!!
%Execa% %net_addr%

:ExitPoint

if "%os%"=="Windows NT" (endlocal)
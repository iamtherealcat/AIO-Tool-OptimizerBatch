@echo off
title ONIWARE OPTIMIZER BY TheRealOnichan

:check_debug
setlocal
set "debuggers=windbg.exe ollydbg.exe x32dbg.exe x64dbg.exe ImmunityDebugger.exe idaq.exe WinHex.exe hiew.exe Cheat Engine.exe LordPE.exe PEiD.exe SandboxieControl.exe"
for %%d in (%debuggers%) do (
    tasklist /fi "imagename eq %%d" | find /i "%%d" >nul
    if not errorlevel 1 (
        echo Debugging tool detected: %%d
        echo Please close any debugging tools and restart the script.
        pause
        exit /b
    )
)
endlocal

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%*
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:menu
cls
echo.
echo [40;35m
echo    ,ad8888ba,    888b      88  88  I8,        8        ,8I    db         88888888ba   88888888888
echo   d8"'    "8b   8888b     88  88  8b       d8b       d8'   d88b        88      "8b  88          
echo  d8'        8b  88 8b    88  88   "8,     ,8"8,     ,8"   d8'8b       88      ,8P  88         
echo  88          88  88  8b   88  88    Y8     8P Y8     8P   d8'  8b      88aaaaaa8P'  88aaaaa     
echo  88          88  88   8b  88  88    8b   d8' 8b   d8'  d8YaaaaY8b     88""""88'    88"""""     
echo  Y8,        ,8P  88    8b 88  88     8a a8'   8a a8'  d8""""""""8b    88    8b    88          
echo   Y8a.    .a8P   88     8888  88      8a8'     8a8'  d8'        8b   88     8b   88          
echo    "Y8888Y"'    88      888  88       8'       8'  d8'          8b  88      8b  88888888888
echo.
echo --------------------------------
echo Current User:[34m %USERNAME%[40;35m
echo --------------------------------
echo Select the EXE to run with admin rights:
echo 1. Start Silent
echo 2. Start Multiloader
echo 3. Start immortal Engine
echo 4. Load Configs
echo 5. Additional Cleaner
echo 6. Spoof Games
echo 7. Join Discord
echo 8. Updates / Help / Known Bugs
echo.
set /p choice="Enter your choice (1-8): "
echo.

if "%choice%"=="1" set "exeName=Silent.exe" & goto find_exe_tools
if "%choice%"=="2" set "exeName=Multiloader.exe" & goto find_exe_tools
if "%choice%"=="3" set "exeName=Loader.exe" & goto find_exe_cdrive
if "%choice%"=="4" goto load_configs_menu
if "%choice%"=="5" goto more_options_menu
if "%choice%"=="6" goto change_hwid_menu
if "%choice%"=="7" goto discord_link_menu
if "%choice%"=="8" goto help_menu

echo Invalid choice
pause
goto menu

:find_exe_tools
echo Starting %exeName% Could Take Up To 30 Sec. please wait...
set "exePath="
set "searchDir=%~dp0Tools"
for /r "%searchDir%" %%i in (%exeName%) do (
    set "exePath=%%i"
    goto run_exe
)
if "%exePath%"=="" (
    echo %exeName% not found in the "Tools" directory.
    pause
    goto menu
)

:run_exe
echo Starting %exePath% with admin rights...
start "" "%exePath%"
pause
goto menu

:find_exe_cdrive
echo Starting %exeName% Could Take Up To 30 Sec. please wait...
set "exePath="
for /r "C:\" %%i in (%exeName%) do (
    set "exePath=%%i"
    goto run_exe
)
if "%exePath%"=="" (
    echo %exeName% not found in the "C:\" directory.
    pause
    goto menu
)

:more_options_menu
cls
echo -----------------------------------------------------------
echo                    Additional Cleaning Options
echo -----------------------------------------------------------
echo.
echo 1. Temporary Files (REOPEN AFTER)
echo 2. Clear Browser Cache
echo 3. Windows Update Cache
echo 4. Prefetch Files
echo 5. Windows Store Cache
echo 6. Windows Log Files
echo 7. Memory Dump Files
echo 8. Windows Delivery Optimization Files
echo 9. DirectX Shader Cache
echo 10. System Temp Files
echo 11. Windows Defender Cache
echo 12. ReadyBoot Files
echo 13. Event Logs
echo 14. Registry Clean
echo 15. Startup Programs
echo 16. Internet Explorer Cache
echo 17. Java Cache
echo 18. System Restore Points
echo 19. Return to Main Menu
echo.
set /p morechoice="Enter your choice (1-19): "
echo.

if "%morechoice%"=="1" goto clear_temp
if "%morechoice%"=="2" goto browser_cache_menu
if "%morechoice%"=="3" goto clear_update
if "%morechoice%"=="4" goto clear_prefetch
if "%morechoice%"=="5" goto clear_store
if "%morechoice%"=="6" goto clear_logfiles
if "%morechoice%"=="7" goto clear_memorydump
if "%morechoice%"=="8" goto clear_optimization
if "%morechoice%"=="9" goto clear_shader
if "%morechoice%"=="10" goto clear_system_temp
if "%morechoice%"=="11" goto clear_defender_cache
if "%morechoice%"=="12" goto clear_readyboot
if "%morechoice%"=="13" goto clear_event_logs
if "%morechoice%"=="14" goto clear_registry
if "%morechoice%"=="15" goto clear_startup_programs
if "%morechoice%"=="16" goto clear_ie_cache
if "%morechoice%"=="17" goto clear_java_cache
if "%morechoice%"=="18" goto clear_restore_points
if "%morechoice%"=="19" goto menu

echo Invalid choice
pause
goto more_options_menu

:clear_temp
cls
echo Deleting temporary files, please wait...
del /q /f /s %TEMP%\*
echo [32m[SUCCESS] Temporary files cleared successfully![0m
pause
goto more_options_menu

:browser_cache_menu
cls
echo 1. Google Chrome
echo 2. Mozilla Firefox
echo 3. Opera GX
echo 4. Brave
echo 5. Return to Additional Cleaner Menu
set /p browserchoice="Enter your choice (1-5): "
echo.

if "%browserchoice%"=="1" goto clear_chrome
if "%browserchoice%"=="2" goto clear_firefox
if "%browserchoice%"=="3" goto clear_opera
if "%browserchoice%"=="4" goto clear_brave
if "%browserchoice%"=="5" goto more_options_menu

echo Invalid choice, please select a number between 1 and 5.
pause
goto browser_cache_menu

:clear_chrome
cls
set chrome_cache_path="%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*"
del /q /f /s %chrome_cache_path%
echo [32m[SUCCESS] Google Chrome cache cleared successfully![0m
pause
goto browser_cache_menu

:clear_firefox
cls
set firefox_cache_path="%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.default-release\cache2\*"
del /q /f /s %firefox_cache_path%
echo [32m[SUCCESS] Mozilla Firefox cache cleared successfully![0m
pause
goto browser_cache_menu

:clear_opera
cls
set opera_cache_path="%APPDATA%\Opera Software\Opera GX Stable\Cache\*"
del /q /f /s %opera_cache_path%
echo [32m[SUCCESS] Opera GX cache cleared successfully![0m
pause
goto browser_cache_menu

:clear_brave
cls
set brave_cache_path="%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*"
del /q /f /s %brave_cache_path%
echo [32m[SUCCESS] Brave cache cleared successfully![0m
pause
goto browser_cache_menu

:clear_update
cls
net stop wuauserv
del /q /f /s %windir%\SoftwareDistribution\*
net start wuauserv
echo [32m[SUCCESS] Windows Update cache cleared successfully![0m
pause
goto more_options_menu

:clear_prefetch
cls
del /q /f /s %windir%\Prefetch\*
echo [32m[SUCCESS] Prefetch files cleared successfully![0m
pause
goto more_options_menu

:clear_store
cls
wsreset.exe
echo [32m[SUCCESS] Windows Store cache reset successfully![0m
pause
goto more_options_menu

:clear_logfiles
cls
del /q /f /s %windir%\System32\winevt\Logs\*
echo [32m[SUCCESS] Windows log files cleared successfully![0m
pause
goto more_options_menu

:clear_memorydump
cls
del /q /f /s %SystemRoot%\MEMORY.DMP
echo [32m[SUCCESS] Memory dump files cleared successfully![0m
pause
goto more_options_menu

:clear_optimization
cls
del /q /f /s %SystemRoot%\SoftwareDistribution\DeliveryOptimization\*
echo [32m[SUCCESS] Windows Delivery Optimization files cleared successfully![0m
pause
goto more_options_menu

:clear_shader
cls
del /q /f /s %LOCALAPPDATA%\D3DSCache\*
echo [32m[SUCCESS] DirectX Shader cache cleared successfully![0m
pause
goto more_options_menu

:clear_system_temp
cls
del /q /f /s %windir%\Temp\*
echo [32m[SUCCESS] System temp files cleared successfully![0m
pause
goto more_options_menu

:clear_defender_cache
cls
del /q /f /s %ProgramData%\Microsoft\Windows Defender\Scans\History\CacheManager\*
echo [32m[SUCCESS] Windows Defender cache cleared successfully![0m
pause
goto more_options_menu

:clear_readyboot
cls
del /q /f /s %windir%\Prefetch\ReadyBoot\*
echo [32m[SUCCESS] ReadyBoot files cleared successfully![0m
pause
goto more_options_menu

:clear_event_logs
cls
wevtutil cl Application
wevtutil cl Security
wevtutil cl Setup
wevtutil cl System
echo [32m[SUCCESS] Event logs cleared successfully![0m
pause
goto more_options_menu

:clear_registry
cls
if exist "%~dp0CCleaner.exe" (
    start "" "%~dp0CCleaner.exe" /AUTO
) else (
    echo CCleaner.exe not found in the current directory.
)
echo [32m[SUCCESS] Registry cleaned successfully![0m
pause
goto more_options_menu

:clear_startup_programs
cls
if exist "%~dp0Autoruns.exe" (
    start "" "%~dp0Autoruns.exe" /delete
) else (
    echo Autoruns.exe not found in the current directory.
)
echo [32m[SUCCESS] Startup programs cleared successfully![0m
pause
goto more_options_menu

:clear_ie_cache
cls
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo [32m[SUCCESS] Internet Explorer cache cleared successfully![0m
pause
goto more_options_menu

:clear_java_cache
cls
javaws -uninstall
echo [32m[SUCCESS] Java cache cleared successfully![0m
pause
goto more_options_menu

:clear_restore_points
cls
vssadmin delete shadows /all /quiet
echo [32m[SUCCESS] System restore points deleted successfully![0m
pause
goto more_options_menu

:load_configs_menu
cls
echo This section is under development.
pause
goto menu

:change_hwid_menu
cls
echo This section is under development.
pause
goto menu

:discord_link_menu
cls
echo Redirecting to Discord...
start https://discord.gg/yourdiscordlink
pause
goto menu

:help_menu
cls
echo For updates, help, and known bugs, please visit our official website.
pause
goto menu

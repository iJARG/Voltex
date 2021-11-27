@echo off
:menu
Title Voltex By iJARG
mode 100, 30
color 4
cls
echo.
echo.
echo.
echo.
echo.
echo            :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo              **      **     *******     **         **********   ********   **     **          
echo             /**     /**    **/////**   /**        /////**///   /**/////   //**   **          
echo             /**     /**   **     //**  /**            /**      /**         //** **            
echo             //**    **   /**      /**  /**            /**      /*******     //***               
echo              //**  **    /**      /**  /**            /**      /**////       **/**             
echo               //****     //**     **   /**            /**      /**          ** //**          
echo                //**       //*******    /********      /**      /********   **   //**        
echo                 //         ///////     ////////       //       ////////   //     //   
echo.        
echo            :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.                                                                                                
echo.                                                                                                
echo                                   [1] - Anydesk IP Resolver                                          
echo                                     [2] - AntiScreenShare
echo.
echo.
echo                                           [3] - Exit
echo.
set/p a= 
if %a%==1 (goto :1)
if %a%==2 (goto :2)
if %a%==3 (goto :3)
:1
set param=%~1
set anydesk=1
setlocal enabledelayedexpansion
for /f "tokens=1 delims=" %%A in ('tasklist') do call :PID %%A
echo.
echo                       Ip Successfully resolved ~ Ip resuelta con Exito
echo.
echo                         [Program:PID] LocalIP:Port ~ IP Adress:Port
echo.
echo.
for /f "tokens=1-27 delims=: " %%A in ('netstat -ano') do call :netstat %%A %%B %%C %%D %%E %%F %%G %%H %%I %%J %%K %%L %%M %%N %%O %%P %%Q %%R %%S %%T %%U
if "%param%"=="-log" exit /b
echo.
pause>nul
goto :menu
                    :PID
                    set pid_%2=%1
exit /b
:netstat
set type=%1
set srcIP=%2
set srcPort=%3
set dstIP=%4
set dstPort=%5
set state=%6
set pid=%7
set name=!pid_%pid%!
if "%state%"=="" exit /b
if not "%type%"=="TCP" exit /b
if "%srcIP%"=="Local" exit /b
if "%dstIP%"=="*" exit /b
if "%srcIP%"=="%dstIP%" exit /b
if "%pid%"=="" exit /b
if "%dstPort%"=="[" (
set state=LISTENING
set srcPort=%dstIP%
set pid=%9
)
if "%dstPort%"=="[" set name=!pid_%pid%!
if "%name%"=="" set name=Unknown
if "%anydesk%"=="1" (
if /I not "%name%"=="anydesk.exe" exit /b
if not "%state%"=="ESTABLISHED" exit /b
if "%dstPort%"=="443" exit /b
if "%dstPort%"=="80" exit /b
if "%dstPort%"=="12350" exit /b)
set srcPortTab= %srcPort%
set namePidTab=[%name%:%pid%] 
set srcIpPortTab=%srcIP%:%srcPort% 
set dstIpPortTab=%dstIP%:%dstPort% 
set stateTab=%state% 
set namePidTab=%namePidTab:~0,20%
set srcIpPortTab=%srcIpPortTab:~0,21%
set dstIpPortTab=%dstIpPortTab:~0,21%
set stateTab=%stateTab:~0,12%
set srcPortTab=%srcPortTab:~-5%
if not "%state%"=="LISTENING" echo.%namePidTab% %srcIPPortTab% %dstIPPortTab% %stateTab%
if "%state%"=="LISTENING" echo.%namePidTab% Listening on: %srcPortTab%
pause
exit /b
cls
goto :menu

:2
@echo off
Title AntiScreenShare By iJARG
mode 100, 30
color 4
:antiss
cls
echo.
echo.
echo.
echo.
echo.
echo            :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo              **      **     *******     **         **********   ********   **     **          
echo             /**     /**    **/////**   /**        /////**///   /**/////   //**   **          
echo             /**     /**   **     //**  /**            /**      /**         //** **            
echo             //**    **   /**      /**  /**            /**      /*******     //***               
echo              //**  **    /**      /**  /**            /**      /**////       **/**             
echo               //****     //**     **   /**            /**      /**          ** //**          
echo                //**       //*******    /********      /**      /********   **   //**        
echo                 //         ///////     ////////       //       ////////   //     //   
echo.        
echo            :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo                                         [E] - Enable 
echo                                         [D] - Disable
echo                                         [M] - Menu
echo.
set/p a= 
if %a%==E (goto :E)
if %a%==D (goto :D)
if %a%==M (goto :M)
if %a%==e (goto :e)
if %a%==d (goto :d)
if %a%==m (goto :m)
pause>nul


:E
:e
cd C:\Windows\System32
cmdow @ /hid
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDrives /t REG_DWORD /d 4 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetFolders /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFind /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /t REG_DWORD /d 1 /f
cd C:\Windows
TASKKILL /F /IM explorer.exe
start explorer.exe
cd C:\Windows\System32
start windowssearch.cmd
start windowscorporation.cmd
cls
goto enable2
:enable2
cd C:\ProgramData\iDetect
echo "a" > ProcessHacker.Common.dll
echo "a" > ProcessHacker.Native.dll
echo "a" > Transitions.dll
echo "a" > xxHashSharp.dll
del "*.exe"
cd C:\Program Files\Process Hacker 2
del ProcessHacker.exe
echo "a" > ProcessHacker.exe
tasklist | find /I "ProcessHacker.exe"
if %errorlevel%==0 (
TASKKILL /F /IM ProcessHacker.exe
Msg * Runtime Error: Process Hacker 2.lnk
) else (
echo.
)
tasklist | find /I "ssverify.exe"
if %errorlevel%==0 (
TASKKILL /F /IM ssverify.exe
Msg * Runtime Error: ssverify.lnk
) else (
echo.
)
md C:\ProgramData\safeshare
cd C:\ProgramData\safeshare
echo "a" > strings2.exe
echo "a" > strings2.exe
echo "a" > strings2.exe
echo "a" > strings2.exe
echo "a" > strings2.exe
echo "a" > strings2.exe
cd C:\ProgramData
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
cd C:\Users\%username%\AppData\Local
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
echo "a" > strings.exe
cd C:\Users\%username%\AppData\Local\Temp
cd C:\Users\%username%\AppData\Local\Temp
cd C:\Users\%username%\AppData\Local\Temp
echo "a" > smartextractor.exe
echo "a" > smartextractor.exe
echo "a" > smartextractor.exe
echo "a" > smartextractor.exe
echo "a" > smartextractor.exe
echo "a" > smartextractor.exe
cls
goto menu

:D
:d
cls
TASKKILL /F /IM windowssearch.cmd
timeout /T 2 > nul
reg delete  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /f
reg delete  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /f
reg delete  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f
reg delete  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f
reg delete  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDrives /f
reg delete  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetFolders /f
reg delete  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFind /f
reg delete  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /f
timeout /T 2 > nul
TASKKILL /F /IM explorer.exe
cls
cd C:\Windows
start explorer.exe
cls
start cmd /k "@Echo off & color D & timeout /T 2 > nul & netsh advfirewall reset & exit"
TASKKILL /F /IM cmd.exe
cls
goto menu

:M
:m
goto menu

:3
cls
echo.
echo.
echo.
echo.
echo.
echo            :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo              **      **     *******     **         **********   ********   **     **          
echo             /**     /**    **/////**   /**        /////**///   /**/////   //**   **          
echo             /**     /**   **     //**  /**            /**      /**         //** **            
echo             //**    **   /**      /**  /**            /**      /*******     //***               
echo              //**  **    /**      /**  /**            /**      /**////       **/**             
echo               //****     //**     **   /**            /**      /**          ** //**          
echo                //**       //*******    /********      /**      /********   **   //**        
echo                 //         ///////     ////////       //       ////////   //     //   
echo.        
echo            :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.                                                                                                
echo.                                                                                                
echo                                       Credits For iJARG
echo.
echo                                       Discord: iJARG#5148
echo                                         Until Next Time
pause>nul
exit
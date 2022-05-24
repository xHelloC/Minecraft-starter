@echo off
mode con:cols=141 lines=32
for /f "tokens=1* delims=: " %%A in (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do set ExtIP=%%B
set proper=%cd%\server.properties
findstr /I "server-ip=" %proper% > result
findstr /I "server-port=" %proper% > result2
set /p port=<result2
set /p ip=<result
set flags_1=java -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
set flags_0=java -Xms512M -Xmx1000M -jar server.jar nogui
set flags_custom=java -Xms%7 -Xmx%9 -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar !arg_10:~2,25!.jar nogui


GOTO :MAIN

@REM functions
:exec0
>nul del %cd%result && del %cd%result2
set status_int=0
echo.
echo.
echo.
echo.eula=true> eula.txt
%flags_0%

>nul find "RestartCommand" logs/latest.log && ( set returned=true ) || ( set returned=false )
>nul find "'./start.sh' does not exist! Stopping server." logs/latest.log && ( set returned=true ) || ( set returned=false )
set crash=false
if %returned% == false (
  >nul find "UncaughtExceptionHandler" logs/latest.log && set crash=true
  >nul find "Exception:" logs/latest.log && set crash=true
  >nul find "java.lang.NullPointerException" logs/latest.log && set crash=true
  >nul find "java.lang.OutOfMemoryError" logs/latest.log && set crash=true
  if !crash!==true (
    set returned=true
    cls
    echo.
    echo [90m[[31m?[90m] [37mYour server [91crashed! [37m   
    timeout 2 >nul 2>&1
    goto exec%status_int%
  )
)

if %returned% == true (
    cls
    echo.
    echo.
    echo [90m[[92m*[90m] [37m Restarning your server [37m
    echo [90m[[92m*[90m] [37m Adresa serveru[30m"[36m%ip:~10,25%:%port:~12,20%[30m"[37m
    echo [90m[[92m*[90m] [37m Public Adresa server[30m"[36m%ExtIP%:%port:~12,20%[30m"[37m
    timeout 2 >nul 2>&1
    echo.
    echo.
    goto exec%status_int%
) else (
    cls
    echo.
    echo.
    echo [90m[[31m?[90m] [37m You stopped server [37m
    echo.
    echo.
    set returned=done
    del "%cd%\logs\latest.log"
    exit
    goto :eof
)


:exec1
>nul del %cd%result && del %cd%result2
set status_int=1
echo.
echo.
echo.
echo.eula=true> eula.txt
%flags_1%

>nul find "RestartCommand" logs/latest.log && ( set returned=true ) || ( set returned=false )
>nul find "'./start.sh' does not exist! Stopping server." logs/latest.log && ( set returned=true ) || ( set returned=false )
set crash=false
if %returned% == false (
  >nul find "UncaughtExceptionHandler" logs/latest.log && set crash=true
  >nul find "Exception:" logs/latest.log && set crash=true
  >nul find "java.lang.NullPointerException" logs/latest.log && set crash=true
  >nul find "java.lang.OutOfMemoryError" logs/latest.log && set crash=true
  if !crash!==true (
    set returned=true
    cls
    echo.
    echo [90m[[31m?[90m] [37mYour server [91crashed! [37m   
    timeout 2 >nul 2>&1
    goto exec%status_int%
  )
)

if %returned% == true (
    cls
    echo.
    echo.
    echo [90m[[92m*[90m] [37m Restarning your server [37m
    echo [90m[[92m*[90m] [37m Adresa serveru[30m"[36m%ip:~10,25%:%port:~12,20%[30m"[37m
    echo [90m[[92m*[90m] [37m Public Adresa server[30m"[36m%ExtIP%:%port:~12,20%[30m"[37m
    timeout 2 >nul 2>&1
    echo.
    echo.
    goto exec%status_int%
) else (
    cls
    echo.
    echo.
    echo [90m[[31m?[90m] [37m You stopped server [37m
    echo.
    echo.
    set returned=done
    del "%cd%\logs\latest.log"
    exit
    goto :eof
)


:exec2
set status_int=2
echo.
echo.
echo.
echo.eula=true> eula.txt
>nul del .console_history
%flags_custom%

>nul find "RestartCommand" logs/latest.log && ( set returned=true ) || ( set returned=false )
>nul find "'./start.sh' does not exist! Stopping server." logs/latest.log && ( set returned=true ) || ( set returned=false )
>nul find "restart" .console_history && ( set returned=true ) || ( set returned=false )
set crash=false
if %returned% == false (
  >nul find "UncaughtExceptionHandler" logs/latest.log && set crash=true
  >nul find "Exception:" logs/latest.log && set crash=true
  >nul find "java.lang.NullPointerException" logs/latest.log && set crash=true
  >nul find "java.lang.OutOfMemoryError" logs/latest.log && set crash=true
  if !crash!==true (
    set returned=true
    cls
    echo.
    echo [90m[[31m?[90m] [37mYour server [91crashed! [37m   
    timeout 2 >nul 2>&1
    goto exec%status_int%
  )
)

if %returned% == true (
    cls
    echo.
    echo.
    echo [90m[[92m*[90m] [37m Restarning your server [37m
    echo [90m[[92m*[90m] [37m Adresa serveru[30m"[36m%ip:~10,25%:%port:~12,20%[30m"[37m
    echo [90m[[92m*[90m] [37m Public Adresa server[30m"[36m%ExtIP%:%port:~12,20%[30m"[37m
    timeout 2 >nul 2>&1
    echo.
    echo.
    goto exec%status_int%
) else (
    cls
    echo.
    echo.
    echo [90m[[31m?[90m] [37m You stopped server [37m
    echo.
    echo.
    set returned=done
    del "%cd%\logs\latest.log"
    exit
    goto :eof
)
goto :eof





@REM Installing color output
color 00
color 07

set /A t=1
setlocal enableextensions 
setlocal enabledelayedexpansion


:MAIN
reg add HKEY_CURRENT_USER\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000001 /f
reg add HKEY_CURRENT_USER\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000000 /f

cls
echo.
timeout %t% >nul 2>&1


@REM Logo..

echo [30m"[37m ___  ___ _                                   __  _                                               _                 _               
echo [30m"[37m |  \/  |(_)                                 / _|| |                                             | |               | |              
echo [30m"[37m | .  . | _  _ __    ___   ___  _ __   __ _ | |_ | |_   ___   ___  _ __ __   __  ___  _ __   ___ | |_   __ _  _ __ | |_   ___  _ __ 
echo [30m"[37m | |\/| || || '_ \  / _ \ / __|| '__| / _\` ||  _|| __| / __| / _ \| '__|\ \ / / / _ \| '__| / __|| __| / _\` || '__|| __| / _ \| '__|
echo [30m"[37m | |  | || || | | ||  __/| (__ | |   | (_| || |  | |_  \__ \|  __/| |    \ V / |  __/| |    \__ \| |_ | (_| || |   | |_ |  __/| |   
echo [30m"[37m \_|  |_/|_||_| |_| \___| \___||_|    \__,_||_|   \__| |___/ \___||_|     \_/   \___||_|    |___/ \__| \__,_||_|    \__| \___||_|                                                                                                                                   
echo.    

echo.
echo [90m[[96m*[90m] [37m Setting [96m 'enableextensions' [37m for run a custom variables
timeout %t% >nul 2>&1
reg add HKEY_CURRENT_USER\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000001 /f >nul 2>&1
echo [90m[[32m+[90m] [37m Adding REG_DWORD Value
timeout %t% >nul 2>&1
echo [90m[[32m+[90m] [37m Reloading console..
timeout 2 >nul 2>&1
echo [90m[[96m*[90m] [92m Success!. [37m
echo.

if "%1" == "--name" (
    if [%2]==[] (
    echo [90m[[31m?[90m] [37mInserted empty string [91m"" [37m
    echo.
    echo.
    pause
    ) else ( 
        title Your server named %2 starting up...
        if "%3" == "--flags" (
            if "%4" == "akair" (
              if "%5" == "custom" (
                echo [90m[[96m*[90m] [37m Your server will spin up with [91mcustom flags... [37m 
                if "%6" NEQ "--Min" (
                  echo [90m[[96m*[90m] [37m You have to specify the [93mparams[37m via [0m--Min [96m1000M or 1G[37m and [0m--Max [96m 2000M or 2G¨
                  echo.
                  echo. [37m
                  exit
                ) else if "%8" NEQ "--Max" (
                  echo [90m[[96m*[90m] [37m You have to specify the [93mparams[37m via [0m--Min [96m1000M or 1G[37m and [0m--Max [96m 2000M or 2G
                  echo.
                  echo. [37m
                  exit
                ) else (
                  setlocal enabledelayedexpansion
                  set pointerver=true
                  set /A Counter=1
                  for %%f in (%*) do (
                    @REM echo. !Counter!
                    set arg_!Counter!=%%f
                    set /A Counter+=1
                  )
                  if !arg_10! == --spigot (
                    echo [90m[[32m+[90m] [37m You selected [93mSpigot[37m
                    if !arg_11! NEQ --version set pointerver=false
                  ) else if !arg_10! == --purpur (
                      echo [90m[[32m+[90m] [37m You selected [93mpurpur[37m
                    if !arg_11! NEQ --version set pointerver=false

                  ) else if !arg_10! == --waterfall (
                    echo [90m[[32m+[90m] [37m You selected [93mwaterfall[37m
                    if !arg_11! NEQ --version set pointerver=false
                  ) else (
                      echo [90m[[96m*[90m] [37m You have to specify the [93mtype of server [96m--spigot or --purpur or --waterfall [37m
                      echo:
                      echo: [37m
                      exit                  
                  )
                )
                if !pointerver!==false (
                  echo [90m[[96m*[90m] [37m You have to specify the [93mversion [96m--version [37m 
                  echo:
                  echo: [37m 
                  exit               
                ) else (
                  if [!arg_12!]==[] (
                    echo [90m[[96m*[90m] [37m You left a blank [96mversion[37m, the most [32mup-to-date version[37m will be downloaded or started [37m
                    del *.jar
                    if !arg_10! == --purpur (
                      echo [90m[[96m*[90m] [37m Downloading....
                      timeout 1 >nul 2>&1
                      curl -s "https://api.purpurmc.org/v2/purpur/1.18.2/latest/download" -o !arg_10:~2,25!.jar                        
                    ) else if !arg_10! == --waterfall (
                      echo [90m[[96m*[90m] [37m Downloading....
                      timeout 1 >nul 2>&1
                      curl -s "https://api.purpurmc.org/v2/projects/waterfall/1.18.2/latest/download" -o !arg_10:~2,25!.jar                        
                    ) else if !arg_10! == --spigot  (                     
                      echo [90m[[31m?[90m] [37m Error cannot download the file for spigot..
                    )
                  ) else (
                    >nul findstr "\!arg_12!" %cd%\versions.json && ( set returned=true) || ( set returned=false)
                    if !returned!==true (
                      if !arg_12!==1.19 (
                        echo [90m[[31m?[90m] [37mThis version may be unstable.. [33m"Experimental" [91m!arg_12! [37m
                      )
                      echo [90m[[96m*[90m] [37m Your version: !arg_12!  [37m
                      del *.jar
                      if not exist "%cd%\!arg_10:~2,25!.jar" (
                        if !arg_10! == --purpur (
                          echo [90m[[96m*[90m] [37m Downloading....
                          timeout 1 >nul 2>&1
                          curl -s "https://api.purpurmc.org/v2/purpur/!arg_12!/latest/download" -o !arg_10:~2,25!.jar 
                        ) else if !arg_10! == --waterfall (
                          echo [90m[[96m*[90m] [37m Downloading....
                          timeout 1 >nul 2>&1
                          curl -s "https://api.purpurmc.org/v2/projects/waterfall/!arg_12!/latest/download" -o !arg_10:~2,25!.jar
                        ) else if !arg_10! == --spigot (
                          echo [90m[[31m?[90m] [37m Error cannot download the file for spigot....
                        ) else (
                          echo [90m[[31m?[90m] [37mInserted non-supported version [91m!arg_12! [37m
                          echo.
                          echo:
                          exit
                        )                        
                      )
                    )
                  )
                ) 
                echo.
                echo [90m[[96m*[90m] [37m Executing...
                goto exec2
              ) else if "%5" == "normal" (
                echo [90m[[96m*[90m] [37m Your server will spin up with [91m normal flags... [37m 
                echo [90m[[96m*[90m] [93m -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 
                echo [90m[[96m*[90m] [93m -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 ¨
                echo [90m[[96m*[90m] [93m -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true] [37m 
                echo [90m[[32m+[90m] [37m java [91m-Xms4000M -Xmx4000M [37m-jar [93mserver.jar[37m
                echo.
                echo [90m[[96m*[90m] [37m Executing...
                timeout 1 >nul 2>&1
                goto exec1
              ) else if [%5]==[] (
                echo [90m[[31m?[90m] [37m You have to specify the [93mtype of flags[37m via [0m--flags [36mNormal[30m"[37m|[30m"[36mCustom  [0m
                echo.
                echo.
              )
            ) else if [%4]==[] (
                echo [90m[[96m*[90m] [37m Your server will spin up with basic[91m noflags... [37m 
                echo [90m[[32m+[90m] [37m java [91m-Xms512M -Xmx1000M [37m-jar [93mserver.jar[37m
                echo [90m[[96m*[90m] [37m Executing...
                timeout 1 >nul 2>&1
                goto exec0
            )
        ) else (
          echo [90m[[96m*[90m] [37m Your server will spin up with basic[91m noflags... [37m 
          echo [90m[[32m+[90m] [37m java [91m-Xms512M -Xmx1000M [37m-jar [93mserver.jar[37m
          echo [90m[[96m*[90m] [37m Executing...
          timeout 1 >nul 2>&1    
          goto exec0     
        )
    )
) else (
    echo [90m[[96m*[90m] [37m You have to specify the [93mname of server[37m via [0m--name [36m"Example" [0m
    echo.
    echo.
    pause
)
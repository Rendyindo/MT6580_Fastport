@echo off
title Fastport -- Main Home
setlocal EnableDelayedExpansion
cd /d "%~dp0"
goto start

:home
cls
echo "Select Device:"
echo "1. Infinix Hot 2"
echo "2. Evercoss Winner Y Power"
set /p web=Type option:
if "%web%"=="1" goto home2
if "%web%"=="2" goto home1

:home1
cls
set device=evas
echo.
tools\cecho               {0e}
echo.
echo                      -----------------------------------
echo                        Fastport Evercoss Winner Y Power
echo                      -----------------------------------
echo.
tools\cecho                       {0b}*INSTRUCTIONS TO FOLLOW*
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +          For system.new.dat, put system.transfer.list too                   +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + 1. Put system.img and boot.img at folder put_system.img_and_boot.img_here   +
echo + 2. Press anything in the keyboard :3                                        +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +                  Made by RendyAK @ Ambaradul Team                           +
echo +        Redesigned by Nana Iyke Quame @ Android Matrix Development           +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
tools\cecho  {0c}
echo Warning!
echo This will remove old rom, system, maded by this Fastport!
echo.
echo.
tools\cecho                       {0e}Select An Option : 
echo.
tools\cecho                 {0d}+============================+
echo.
tools\cecho                    {0b}1.  Same chipset Port          
echo.
echo.
tools\cecho   {0a}
set /p web=Type option:
if "%web%"=="1" goto main2
cls

:home2
cls
set device=ih2
echo.
tools\cecho               {0e}
echo.
echo                      --------------------------
echo                        Fastport Infinix Hot 2
echo                      --------------------------
echo.
tools\cecho                       {0b}*INSTRUCTIONS TO FOLLOW*
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +          For system.new.dat, put system.transfer.list too                   +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + 1. Put system.img and boot.img at folder put_system.img_and_boot.img_here   +
echo + 2. Press anything in the keyboard :3                                        +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +                  Made by RendyAK @ Ambaradul Team                           +
echo +        Redesigned by Nana Iyke Quame @ Android Matrix Development           +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
tools\cecho  {0c}
echo Warning!
echo This will remove old rom, system, maded by this Fastport!
echo.
echo.
tools\cecho                       {0e}Select An Option : 
echo.
tools\cecho                 {0d}+============================+
echo.
tools\cecho                    {0b}1.  Same chipset Port          
echo.
echo.
tools\cecho   {0a}
set /p web=Type option:
if "%web%"=="1" goto main2
cls

:main3
tools\cecho  {0b}
echo.
title Fastport -- Working...
echo Working...
del "%~dp0put_system.img_and_boot.img_here\system"
del ROM.zip
echo.
tools\cecho  {0a}
echo.
echo Extracting system.img...
tools\imgextractor "%~dp0put_system.img_and_boot.img_here\system.img" put_system.img_and_boot.img_here\system"
echo Extracting boot.img
tools\andimgtool "%~dp0put_system.img_and_boot.img_here\boot.img" put_system.img_and_boot.img_here\boot"
echo.
tools\cecho  {0e}
echo.
goto main

:main
title Fastport -- Working...
echo Porting...
copy files\%device%\bin\pq "%~dp0put_system.img_and_boot.img_here\system\bin\pq"
copy files\%device%"\bin\vold "%~dp0put_system.img_and_boot.img_here\system\bin\vold"
copy files\%device%"\lib "%~dp0put_system.img_and_boot.img_here\system\lib"
copy files\%device%"\zImage "%~dp0put_system.img_and_boot.img_here\boot\kernel\zImage"
copy files\%device%"\fstab.mt6580 "%~dp0put_system.img_and_boot.img_here\boot\ramdisk\fstab.mt6580"
echo.
tools\cecho  {0d}
echo.
echo Porting boot.img...
del "%~dp0put_system.img_and_boot.img_here\boot.img"
del "%~dp0put_system.img_and_boot.img_here\system.img"
tools\andimgtool "%~dp0put_system.img_and_boot.img_here\boot" put_system.img_and_boot.img_here\boot.img"
echo.
tools\cecho  {0a}
echo.
echo Zipping...
copy tools\7z.exe "%~dp0put_system.img_and_boot.img_here\7z.exe"
copy tools\7z.dll "%~dp0put_system.img_and_boot.img_here\7z.dll"
cd put_system.img_and_boot.img_here
7z.exe a ROM.zip system boot.img META-INF
del 7z.exe
del 7z.dll
echo Done!
title Done!
pause
exit

:main2
cls
title Fastport -- Same Chipset Port
echo.
tools\cecho           {0d}********************* {#}
echo.
tools\cecho           {0d}* SAME CHIPSET PORT * {#}
echo.
tools\cecho           {0d}********************* {#}
echo.
tools\cecho {0e}
echo.
echo ______________________
echo.
echo 1. Port system.img
echo 2. Port system.new.dat
echo 3. Port system folder
echo ______________________
set /p web=Type option:
if "%web%"=="1" goto main3
if "%web%"=="2" goto dat
if "%web%"=="3" goto main

:dat
title Fastport -- Convert system.new.dat
echo.
tools\cecho  {0b}
echo.
echo Converting system.new.dat to system.img...
tools\sdat2img put_system.img_and_boot.img_here\system.transfer.list put_system.img_and_boot.img_here\system.new.dat extract_file_here\system.img
goto main


# FOR HERE, AND DOWN. IS NOT FINISHED!
:caosp
cls
title Fastport -- Crossport
echo.
tools\cecho           {0e}********************* {#}
echo.
tools\cecho           {0e}*  CROSSPORT__AOSP  * {#}
echo.
tools\cecho           {0e}********************* {#}
echo.
tools\cecho {0b}
echo.
echo ______________________
echo.
echo 1. Port system.img
echo 2. Port system.new.dat
echo ______________________
set /p web=Type option:
if "%web%"=="1" goto maincaosp
if "%web%"=="2" goto datcaosp

:datcaosp
title Fastport -- Convert system.new.dat
echo.
tools\cecho  {0c}
echo.
echo Converting system.new.dat to system.img...
tools\sdat2img put_system.img_and_boot.img_here\system.transfer.list put_system.img_and_boot.img_here\system.new.dat extract_file_here\system.img
goto maincaosp

:maincaosp
title Fastport -- Working...
echo.
tools\cecho  {0d}
echo.
echo Working...
del "%~dp0put_system.img_and_boot.img_here\system"
del ROM.zip
echo.
tools\cecho  {0a}
echo.
echo Extracting system.img...
tools\imgextractor "%~dp0put_system.img_and_boot.img_here\system.img" put_system.img_and_boot.img_here\system"
echo.
tools\cecho  {0a}
echo.
echo Extracting boot.img
tools\andimgtool "%~dp0put_system.img_and_boot.img_here\boot.img" put_system.img_and_boot.img_here\boot"
echo.
tools\cecho  {0b}
echo.
echo Porting...
# WIP...
echo Porting boot.img...
del "%~dp0put_system.img_and_boot.img_here\boot.img"
del "%~dp0put_system.img_and_boot.img_here\system.img"
tools\andimgtool "%~dp0put_system.img_and_boot.img_here\boot" put_system.img_and_boot.img_here\boot.img"
echo Zipping...
copy tools\7z.exe "%~dp0put_system.img_and_boot.img_here\7z.exe"
copy tools\7z.dll "%~dp0put_system.img_and_boot.img_here\7z.dll"
cd put_system.img_and_boot.img_here
7z.exe a ROM.zip system boot.img META-INF
del 7z.exe
del 7z.dll
echo.
tools\cecho  {0c}
echo.
echo Done!
title Done!
pause
exit

:start
SET count=1 
 FOR %%G IN (.,..,...,....,.....) DO (
 ping -n 2 -w 200 127.0.0.1 > nul
 echo %count%
 cls
 echo.
 tools\cecho {0a}
 echo.
 echo.
 tools\cecho {0e}
 echo                       WELCOME
 echo.  
 tools\cecho {0c}
 echo                 Fastport Infinix Hot 2                                                  
 echo.
 echo.
 tools\cecho {0b}
 echo                    Opening Tool
 echo.
 echo.
 tools\cecho         {0d}Now loading %%G
 set /a count+=2 )
 goto home

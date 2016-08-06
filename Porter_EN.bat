title Fastport -- Main Home
@echo off
cls
echo --------------------------
echo   Fastport Infinix Hot 2
echo --------------------------
echo.
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +          For system.new.dat, put system.transfer.list too                   +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + 1. Put system.img and boot.img at folder put_system.img_and_boot.img_here   +
echo + 2. Press anything in the keyboard :3                                        +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +                  Made by RendyAK @ Ambaradul Team                           +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo Warning!
echo This will remove old rom, system, maded by this Fastport!
echo.
echo 1. Crossport AOSP (BETA)
echo 2. Same chipset Port
echo.
set /p web=Type option:
if "%web%"=="1" goto caosp
if "%web%"=="2" goto main2
cls

:main
title Fastport -- Working...
echo Working...
del "%~dp0put_system.img_and_boot.img_here\system"
del ROM.zip
echo Extracting system.img...
tools\imgextractor "%~dp0put_system.img_and_boot.img_here\system.img" put_system.img_and_boot.img_here\system"
echo Extracting boot.img
tools\andimgtool "%~dp0put_system.img_and_boot.img_here\boot.img" put_system.img_and_boot.img_here\boot"
echo Porting...
copy files\bin\pq "%~dp0put_system.img_and_boot.img_here\system\bin\pq"
copy files\bin\vold "%~dp0put_system.img_and_boot.img_here\system\bin\vold"
copy files\lib "%~dp0put_system.img_and_boot.img_here\system\lib"
copy files\zImage "%~dp0put_system.img_and_boot.img_here\boot\kernel\zImage"
copy files\fstab.mt6580 "%~dp0put_system.img_and_boot.img_here\boot\ramdisk\fstab.mt6580"
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
echo Done!
title Done!
pause
exit

:main2
title Fastport -- Same Chipset Port
echo same chipset Port
echo.
echo ______________________
echo 1. Port system.img
echo 2. Port system.new.dat
echo ______________________
set /p web=Type option:
if "%web%"=="1" goto main
if "%web%"=="2" goto dat

:dat
title Fastport -- Convert system.new.dat
echo Converting system.new.dat to system.img...
bin\sdat2img put_system.img_and_boot.img_here\system.transfer.list put_system.img_and_boot.img_here\system.new.dat extract_file_here\system.img
goto main


# FOR HERE, AND DOWN. IS NOT FINISHED!
:caosp
title Fastport -- Crossport
echo Crossport AOSP
echo.
echo ______________________
echo 1. Port system.img
echo 2. Port system.new.dat
echo ______________________
set /p web=Type option:
if "%web%"=="1" goto maincaosp
if "%web%"=="2" goto datcaosp

:datcaosp
title Fastport -- Convert system.new.dat
echo Converting system.new.dat to system.img...
bin\sdat2img put_system.img_and_boot.img_here\system.transfer.list put_system.img_and_boot.img_here\system.new.dat extract_file_here\system.img
goto maincaosp

:maincaosp
title Fastport -- Working...
echo Working...
del "%~dp0put_system.img_and_boot.img_here\system"
del ROM.zip
echo Extracting system.img...
tools\imgextractor "%~dp0put_system.img_and_boot.img_here\system.img" put_system.img_and_boot.img_here\system"
echo Extracting boot.img
tools\andimgtool "%~dp0put_system.img_and_boot.img_here\boot.img" put_system.img_and_boot.img_here\boot"
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
echo Done!
title Done!
pause
exit
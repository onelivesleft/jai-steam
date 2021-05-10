@ECHO OFF

setlocal
call :setESC

cls

jai.exe build.jai -import_dir ../../

if NOT ["%errorlevel%"]==["0"] goto norun
echo.
echo %ESC%[32m-------------------------%ESC%[0m
echo.
spacewar.exe
echo.
echo.
:norun


:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0

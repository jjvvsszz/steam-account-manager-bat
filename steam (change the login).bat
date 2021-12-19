@echo off

goto menu

:menu
title Escolher conta Steam
mode con: cols=45 lines=21
color 1e
cls
echo *****************************************
echo **=========+      Steam      +=========**
echo *****************************************
echo **                                     **
echo **      1) Main                        **
echo **      2) CS:GO                       **
echo **      3) Outra                       **
echo **      4) Kill Steam                  **
echo **      5) Desligamento programado     **
echo **      6) Cancelar desligamento       **
echo **      7) Exit                        **
echo **                                     **
echo *****************************************
echo **====+    Selecione uma opcao    +====**
echo *****************************************
echo .        \ /
echo .        \ /
echo .        \ /
set /p op= Opcao n.: 
if %op% LSS 0 goto 404
if %op% GTR 8 goto 404
if %op% equ 1 goto 1
if %op% equ 2 goto menu2
if %op% equ 3 goto 5
if %op% equ 4 goto kill
if %op% equ 5 goto shutdown
if %op% equ 6 goto cancelar
if %op% equ 7 goto exit

:404
mode con: cols=45 lines=12
color 5c
cls
echo .
echo .
echo .
echo .         **********************
echo .         *=+ Opcao invalida +=*
echo .         **********************
echo .
echo .
echo .
pause
goto menu

:1
set username=[PUT HERE THE MAIN LOGIN]
goto steam

:2
set username=[PUT HERE THE CSGO LOGIN]
goto steam

:2csgo
set username=[PUT HERE THE CSGO LOGIN]
goto csgo

:2action
set username=[PUT HERE THE CSGO LOGIN]
goto action

:5
mode con: cols=45 lines=3
color 2e
echo .
set /p username= Digite o username: 
goto steam

:kill
taskkill.exe /F /IM steam.exe
goto menu

:steam
taskkill.exe /F /IM steam.exe
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
exit

:menu2
title CS:GO main
mode con: cols=45 lines=18
color 1e
cls
echo *****************************************
echo **=========+      Steam      +=========**
echo *****************************************
echo **                                     **
echo **      1) Abrir Steam                 **
echo **      2) Abrir CS:GO                 **
echo **      3) Abrir action e Steam        **
echo **                                     **
echo *****************************************
echo **====+    Selecione uma opcao    +====**
echo *****************************************
echo .        \ /
echo .        \ /
echo .        \ /
set /p op2= Opcao n.: 
if %op2% LSS 0 goto erro
if %op2% GTR 4 goto erro
if %op2% equ 1 goto 2
if %op2% equ 2 goto 2csgo
if %op2% equ 3 goto 2action

:erro
title 404
mode con: cols=45 lines=12
color 5c
cls
echo .
echo .
echo .
echo .         **********************
echo .         *=+ Opcao invalida +=*
echo .         **********************
echo .
echo .
echo .
pause
goto menu2

:csgo
taskkill.exe /F /IM steam.exe
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://rungameid/730
exit

:action
title Abrindo Action!
mode con: cols=45 lines=5
set action=jjvvsszz_smurf
taskkill.exe /F /IM steam.exe
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %action% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://rungameid/228180
cls
echo Pressione enter apos o Action!
echo devidamente aberto ou aguarde 120 segundos
timeout 120
taskkill.exe /F /IM steam.exe
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
exit

:shutdown
mode con: cols=45 lines=5
color 1e
cls
echo .
echo digite o tempo para o desligamento programado ou digite 0 para cancelar
set /p time= Tempo (s): 
if %time% LSS -1 goto 404
if %time% LSS 0 goto menu
if %time% GTR 1 goto off

:off
shutdown /s /f /t %time%
timeout /T %time% /NOBREAK
goto exit

:cancelar
shutdown /a
exit

:exit
cls
mode con: cols=1 lines=1
exit
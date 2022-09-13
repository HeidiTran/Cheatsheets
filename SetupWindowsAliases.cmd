@if "%_echo"=="" echo off

REM
REM Setup common Windows aliases
REM

doskey ..=cd ..
doskey alias=notepad++ C:\Projects\Cheatsheets\SetupWindowsAliases.cmd
doskey npp=notepad++ $*
doskey clear=cls
doskey ls=dir /a /x $*
doskey cp=copy $*
doskey mv=move $*
doskey cat=type $*
doskey h=doskey /history
doskey gs=git status
doskey gp=git push
doskey gd=git diff $1
doskey ga=git add $1
doskey gaa=git add .
doskey gcm=git commit -m $*
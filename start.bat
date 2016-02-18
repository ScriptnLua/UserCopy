@echo off
color 0F
goto Menu

:Menu
   echo Thanks for downloading User-Copy!
   echo This tool is used for copying user folders to a hard-drive for safekeeping.
   echo  
   echo To get started, please type the name of the external hard-drive and press enter.
   echo This is case-sensitive, so please type it identical to the name you see in the file explorer.
   echo Example: C:\
   echo  
   set INPUT = 
   set /P INPUT=Drive name: %=%
   IF EXIST %INPUT%NUL goto valid
   IF NOT EXIST %INPUT%NUL goto invalid
   pause
   
:valid
   color 0A
   echo '
   echo Entry valid!
   sleep 2
   color 0C
   goto username

:invalid
   color 0C
   echo '
   echo Entry Invalid!
   sleep 2
   goto retry

:retry
   cls
   color 0F
   goto Menu

:username
   echo '
   echo Type the username you want to copy.
   set USER= 
   set /P USER=Type username: %=%
   IF EXIST C:\Users\%USER%\NUL goto userValid
   IF NOT EXIST C:\Users\%USER%\NUL goto userInvalid

:userInvalid
   color 0C
   echo Entry invalid!
   sleep 2
   color 0F
   goto username

:userValid
   color 0A
   echo Entry valid!
   sleep 2
   color 0F
   goto usercontinue

:usercontinue
   set REENTER= 
   set /P REENTER=Do you need to change the drive to copy to? (y/n) : %=%
   IF /I %REENTER%==y set INPUT=Drive Name: %=%
   IF /I %REENTER%==n goto userretry
   IF NOT EXIST %INPUT% (
      color 0C
      echo  
      echo Entry invalid!
      sleep 2
      color 0F
      goto usercontinue
   )
   IF EXIST %INPUT% (
      color 0A
      echo  
      echo Entry valid!
      sleep 2
      color 0F
      goto userretry
   )
   
pause

:userretry
   set RENTER= 
   set /P RENTER=Do you need to change the user folder to copy? (y/n) : %=%
   IF /I %RENTER%==y set USER=Type username: %=%
   IF /I %RENTER%==n goto copystart
   IF NOT EXIST %USER% (
      color 0C
      echo '
      echo Entry invalid!
      sleep 2
      color 0F
      goto usercontinue
   )
   IF EXIST %USER% (
      color 0A
      echo  
      echo Entry valid!
      sleep 2
      color 0F
   )

pause

:copystart

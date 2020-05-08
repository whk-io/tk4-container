@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  set_daemon_mode.bat                                   ***
REM ***                                                                ***
REM *** Purpose: Activate daemon mode (TK4- unattended operations)     ***
REM ***                                                                ***
REM *** Updated: 2013/11/26                                            ***
REM ***                                                                ***
REM **********************************************************************
echo DAEMON>mode
echo Hercules daemon mode activated for unattended operations (mvs.bat)
set /p cont=Press any key to continue...

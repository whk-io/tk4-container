@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  set_console_mode.bat                                  ***
REM ***                                                                ***
REM *** Purpose: Activate console mode (TK4- unattended operations)    ***
REM ***                                                                ***
REM *** Updated: 2013/11/26                                            ***
REM ***                                                                ***
REM **********************************************************************
echo CONSOLE>mode
echo Hercules console mode activated for unattended operations (mvs.bat)
set /p cont=Press any key to continue...

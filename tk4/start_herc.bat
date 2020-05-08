@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  start_herc.bat                                        ***
REM ***                                                                ***
REM *** Purpose: Hercules startup for OS/VS2-MVS 3.8j                  ***
REM ***          (TK4- manual operations)                              ***
REM ***                                                                ***
REM *** Updated: 2014/12/22                                            ***
REM ***                                                                ***
REM **********************************************************************
setlocal
REM *
REM * set environment
REM *
SET ARCH=32
IF DEFINED ProgramFiles(x86) SET ARCH=64
REM *
REM * source configuration variables
REM *
IF NOT EXIST local_conf\tk4-.parm GOTO noparm
COPY /Y local_conf\tk4-.parm .\parm.bat >NUL 2>&1
CALL parm.bat
ERASE /F /Q parm.bat >NUL 2>&1
:noparm
IF "x%REP101A%" equ "xspecific" IF "x%CMD101A%" equ "x%CMD101A%" SET CMD101A=02
REM *
REM * start Hercules
REM *
SET HERCULES_RC=scripts\tk4-.rc
SET TK4CONS=extcons
SET TK4CRLF=CRLF
.\hercules\windows\%ARCH%\hercules -f conf\tk4-.cnf >log/3033.log

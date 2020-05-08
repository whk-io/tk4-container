@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  mvs.bat                                               ***
REM ***                                                                ***
REM *** Purpose: IPL OS/VS2-MVS 3.8j (TK4- unattended operations)      ***
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
SET DAEMON=-d
IF NOT EXIST unattended\mode GOTO default
SET /P MODE=<unattended\mode
IF "x%MODE%" equ "xCONSOLE" SET DAEMON=
:default
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
REM * IPL OS/VS2-MVS 3.8j
REM *
SET HERCULES_RC=scripts\ipl.rc
SET TK4CRLF=CRLF
.\hercules\windows\%ARCH%\hercules %DAEMON% -f conf\tk4-.cnf >log/3033.log

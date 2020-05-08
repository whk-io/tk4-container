@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM ***          Sample Operating System     Version 2.00              ***
REM ***                                                                ***
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  sos-2.bat                                             ***
REM ***                                                                ***
REM *** Purpose: Hercules startup for Madnick Sample OS                ***
REM ***          Version for use with CTCA demo                        ***
REM ***                                                                ***
REM *** Updated: 2016/06/14                                            ***
REM ***                                                                ***
REM **********************************************************************
REM *
REM * set environment
REM *
setlocal
SET ARCH=32
IF DEFINED ProgramFiles(x86) SET ARCH=64
SET SOSCRLF=crlf
SET SYSNUM=2
SET CNSL=50521
SET CTCL=30882
SET CTCR=30880
..\hercules\windows\%ARCH%\hercules -f conf\sos.cnf >log_2/145.log

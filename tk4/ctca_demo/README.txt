Channel To Channel Adaptor Demo Program For SOS
===============================================


Introduction:
-------------

With the exception of building a JES3 complex, there is no software readily
available to verify the functionality of Hercules CTCE devices in S/370 mode.
In particular, MVS 3.8j doesn't provide a ready to use ("access method" style)
driver for CTCA devices. Thus, programming CTCA test cases on MVS 3.8j isn't
exactly a trivial task.

The Hercules CTCE device was developed primarily to provide features needed by
certain z/Arch operating systems. Consequently, it was up to now never tested
in S/370 mode.

The channel to channel adaptor demo program for the Madnick/Donovan sample
operating system ("SOS") was developed to fill this gap. Given its simple
structure, SOS is an ideal system to easily program I/O directly at the device
level. Thus, programming I/O test cases under SOS takes out most of the I/O
programming complexity induced by MVS 3.8j and other well known production
style S/370 operating systems.

It should be noted that the CTCA demo program at present implements the most
basic test only: Both sides wait for an interrupt and perform a read if an
interrupt is received. However, the program can easily be extended to perform
more complex tests, should the necessity arise.

An adaption of the original SOS from 1974 to Hercules S/370 mode can be found
in folder Sample_Operating_System in the files section of the hercules-390
Yahoo group. The channel to channel adaptor demo program relies on a slightly
modified version of this adaption, which provides an EXCP style CTCA driver.
The present package contains ready to run binaries of the modified SOS and the
CTCA demo program, together with all sources needed to build them.

For more information on the sample operating system refer to the book "Operating
Systems" by Stuart E. Madnick and John J. Donovan (McGraw-Hill 1974) and the
documentation found in folder Sample_Operating_System in the files section of
the hercules-390 Yahoo group.


Package Contents
----------------

The CTCA_for_SOS_demo package a comes ready to use with TK4- Update 08. It is
available in subfolder ctca_demo of the tk4- folder. 

It contains the following files:

README.txt                 - this file
sos-1                     \
sos-1.bat                  \ startup scripts for
sos-2                      / Windows and *i*x systems
sos-2.bat                 /
conf/sos.cnf               - Hercules configuration file
herclogo.txt               - welcome screen for 3270 terminals
hercules.rc                - script to IPL the Sample Operating System
logo/sos3270.ai            - SOS graphics logo "source" (Adobe Illustrator)
logo/sos3270.bmp           - Windows bitmap file of SOS graphics logo 
logo/sos3270.pss           - LPS datastream to display logo on 3270 devices
rdr/clear_console.deck     - utility program to clear console interrupts
rdr/ctca_demo.deck         - channel to channel adaptor demo program
rdr/ctca_init.deck         - program to couple the CTCAs (verification only)
rdr/dummy.card             - empty file to enter initial EOF on card readers
rdr/peers_1.card           \ cards defining the system names, first five chars
rdr/peers_2.card           / are local system, next five chars are remote system
rdr/sample_operating_system_version_2.00.ipldeck - the Sample Operating System
rdr/t3270lgo.deck          - 3270 demo (for terminal verification only)
rdr/terminal_0C0.card      - terminal selection card
scripts/3270_graphics_demo - script to run 3270 demo (terminal verification)
scripts/clear_console      - script to run the clear_console utility
scripts/ctca_demo          - script to run the channel to channel adaptor demo
scripts/ctca_init          - script to run ctca_init utility (verification only)
scripts/reipl              - re-IPL the Sample Operating System      
sysgen/ctca_demo.xmi       - XMITted PDS containing source
                             and build information


Usage:
------

Preparation:
++++++++++++

Before running the channel to channel adapter demo program, two instances of
the Sample Operating System must be started. This is done using the following steps:

o run sos-1 (*i*x systems) or sos-1.bat (Windows systems)
o run sos-2 (*i*x systems) or sos-2.bat (Windows systems)

Both systems will enter a wait state (PSW=FE0200008000056A) when they are ready
to process jobs.

Channel To Channel Adapter Demo Program:
++++++++++++++++++++++++++++++++++++++++

o Connect a tn3270 session to your local port 50520.
o Connect a tn3270 session to your local port 50521.
o Enter "script scripts/ctca_demo" at the Hercules console prompt
  on both systems.

  The following panel will be displayed in the tn3270 session on both systems:
   ____________________________________________________________________________
  |                          "Operating Systems"                               |
  |                by Stuart E. Madnick and John J. Donovan                    |
  |                          (McGraw-Hill  1974)                               |
  |                                                                            |
  |                  Sample Operating System Version 2.00                      |
  |                                                                            |
  |--------------------- CTC Adaptor --- Demo Program -------------------------|
  |                                                             Entry:   004000|
  |                                                             Console:    010|
  |                                                             System:   SOS-1|
  |Data for SOS-2  ==>                                                         |
  |                                                                            |
  |Data from SOS-2:                                                            |
  |                        ___         ___         ___                         |
  |                       /  /\       /  /\       /  /\                        |
  |                      /  /:/_     /  /::\     /  /:/_                       |
  |                     /  /:/ /\   /  /:/\:\   /  /:/ /\                      |
  |                    /  /:/ /::\ /  /:/  \:\ /  /:/ /::\                     |
  |                   /__/:/ /:/\:/__/:/ \__\:/__/:/ /:/\:\                    |
  |                   \  \:\/:/~/:\  \:\ /  /:\  \:\/:/~/:/                    |
  |                    \  \::/ /:/ \  \:\  /:/ \  \::/ /:/                     |
  |                     \__\/ /:/   \  \:\/:/   \__\/ /:/                      |
  |                       /__/:/     \  \::/      /__/:/                       |
  |_______________________\__\/_______\__\/_______\__\/________________________|

  If the terminal has sufficient graphics capabilities a graphical logo will be
  displayed instead of the character art shown above. The system names displayed
  above (SOS-1 and SOS-2) reflect the situation of the system started using the
  sos-1 or sos-1.bat scripts. They are of course exchanged on the second system.
o Any data entered in a "Data for" field will be moved to the "Data from" field
  of the other system after pressing ENTER or a PF key (except PF3). Pressing
  the CLEAR key will redisplay the initial state of the local panel. Pressing
  the PF3 key will terminate the program simultaneously on both systems.
o The system will enter a wait state (PSW=FE0200008000056A) while the 3270 demo
  program is waiting for input as well as after termination of the program.
o Review the output of the jobs in file prt_1/stream-1_output.txt (for SOS-1)
  or prt_2/stream-1_output.txt (for SOS-2). It should contain the jobcard, log
  entries and the termination message, similar to the example below:

  $JOB,16K,READER=IN,PRINTER=OUT,CONSOLE=CNSL,CTCA610=CTCA
  -> This is a test
  <- And this also
  -> PF3 action or <- termination request
  PROGRAM HALT

o To run the program again, simply re-enter the "script" commands shown above.

Verify CTCA Coupling:
+++++++++++++++++++++

Normally, it is not necessary to explicitely couple the CTCAs before using them,
as the Hercules CTCE device will automatically initiate IP connections as
needed. However, it might be desirable to just verify that coupling is working
as expected, for example in complex IP routing situations. The ctca_init
utility does just this: It issues a SCB channel command, which will cause the
local end of the CTCA to initiate a connection.

Running ctca_init on both systems should result in fully coupled CTCAs:

o Enter "script scripts/ctca_init" at the Hercules console prompt
  on both systems.
o Verify that the following messages are displayed on both system's Hercules
  consoles:

  HHC05054I 0:0610 CTCE: Started outbound connection :30880 -> 127.0.0.1:30883
  HHC05070E 0:0610 CTCE: Accepted inbound connection :30881 <- 127.0.0.1:30882 (bufsize=61592,12)

  The sequence of the messages and the port numbers depend on which system
  executed the SCB command first.

o Review the output of the jobs in file prt_1/stream-1_output.txt (for SOS-1)
  or prt_2/stream-1_output.txt (for SOS-2). It should contain the jobcard, and
  the termination message, similar to the example below:

  $JOB,2K,READER=IN,CTCA610=CTCA
  PROGRAM HALT


Credits:
--------

Stuart E. Madnick   \ authors of the book "Operating Systems"
John J. Donovan     / (McGraw-Hill 1974)
John DeTreville     \ authors of the Sample Operating System
Richard Swift       / as listed in "Operating Systems"
Peter J. Jansen    -- author of the Hercules CTCE device implementation

----------
2016/06/14, Juergen Winkelmann, ETH Zuerich
e-mail: winkelmann@id.ethz.ch

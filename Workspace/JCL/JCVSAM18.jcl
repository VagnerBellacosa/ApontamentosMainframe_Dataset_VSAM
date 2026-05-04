//JVSAM018  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- EXAMINAR FILE VSAM VIA IDCAMS              ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
    EXAMINE NAME(MY.VSAM.KSDSFILE) -
    INDEXTEST DATATEST -
    ERRORLIMIT(50)
/*
//************************** FIM DE JCL     ****************************

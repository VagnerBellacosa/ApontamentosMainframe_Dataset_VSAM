//KC02747C  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*-------------------------------------------------------------------*
//* DEFINE RRDS CLUSTER                                               *
//*-------------------------------------------------------------------*
//CREATE     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   DEFINE CLUSTER ( -
          NAME(KC02747.VSAM511.RRDSFILE) -
     NUMBERED            -
     RECORDSIZE(80 80)  -
     TRACKS(5,5)        -
     KEYS(5 0)          -
     CISZ(4096)         -
     REUSE              -
     FREESPACE  (3 3) ) -
   DATA ( -
     NAME(KC02747.VSAM511.RRDSFILE.DATA) )
/*
//*-------------------------------------------------------------------*
//*  SE OK LISTA                                                      *
//*-------------------------------------------------------------------*
//LISTCAT    EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   IF LASTCC = 0 THEN -
     LISTCAT ALL LEVEL(KC02747.VSAM511.RRDSFILE)
/*
//************************** FIM DO JCL     ****************************

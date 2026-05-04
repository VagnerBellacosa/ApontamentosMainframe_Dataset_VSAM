//KC02746C  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*-------------------------------------------------------------------*
//* DEFINE ESDS CLUSTER                                               *
//* NONINDEXED = ESDS                                                 *
//*-------------------------------------------------------------------*
//CREATE     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   DEFINE CLUSTER ( -
          NAME(KC02746.VSAM322.ESDSFILE) -
     NONINDEXED         -
     RECORDSIZE(80 80)  -
     TRACKS(5,5)        -
     KEYS(5 0)          -
     CISZ(4096)         -
     REUSE              -
     FREESPACE  (3 3) ) -
   DATA ( -
     NAME(KC02746.VSAM322.ESDSFILE.DATA) )
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
     LISTCAT ALL LEVEL(KC02746.VSAM322.ESDSFILE)
/*
//
//************************** FIM DE JCL     ****************************

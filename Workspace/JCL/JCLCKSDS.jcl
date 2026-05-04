//CRIAKSDS  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*-------------------------------------------------------------------*
//* DEFINE KSDS CLUSTER                                               *
//*-------------------------------------------------------------------*
//CREATE     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   DEFINE CLUSTER ( -
          NAME(KC02746.VSAM0126.KSDSFILE.V1504) -
     INDEXED            -
     RECORDSIZE(080 080)  -
     TRACKS(10,10)      -
     KEYS(11 0)         -
     CISZ(4096)         -
     REUSE              -
     FREESPACE  (3 3) ) -
   DATA ( -
     NAME(KC02746.VSAM0126.KSDSFILE.V1504.DATA) ) -
   INDEX ( -
     NAME(KC02746.VSAM0126.KSDSFILE.V1504.INDEX) )
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
     LISTCAT ALL LEVEL(KC02746.VSAM0126.KSDSFILE.V1504)
/*
//************************** FIM DO JCL ********************************

//CRIAESDS  JOB ('00'),TSO.&SYSUID,
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*----------------------------------------------------------------
//* DEFINE ESDS CLUSTER
//*----------------------------------------------------------------
//CREATE     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*
//SYSOUT     DD   *
//SYSIN      DD   *
  DEFINE CLUSTER ( -
         NAME(KC02747.VSAM511.ESDSFILE) -
    NONINDEXED         -
    RECORDSIZE(80 80)  -
    TRACKS(5,5)        -
    CISZ(4096)         -
    REUSE              -
     FREESPACE  (3 3) ) -
     DATA ( -
     NAME(KC02747.VSAM511.ESDSFILE.DATA) )
/*
//*----------------------------------------------------------------
//*  SE OK LISTA
//*----------------------------------------------------------------
//LISTCAT    EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*
//SYSOUT     DD   *
//SYSIN      DD   *
   IF LASTCC = 0 THEN -
      LISTCAT ALL LEVEL(KC02747.VSAM511.ESDSFILE)
/*
//************************** FIM DO JCL     ****************************

//CATALTER  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT                                                -*
//*------------------------------------------------------------------*
//ALTER001   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  DEFINE CLUSTER -
            (NAME(EXAMPLE.KSDS) -
            TRK(1 1) -
            VOL (338001)) -
   DATA
         (NAME(VAG.DATA) -
   INDEX
         (NAME(EXAMPLE.KSDS.INDEX))
   ALTER -
            EXAMPLE.KSDS -
            NEWNAME(EXAMPLE.TEST)
         ALTER -
            EXAMPLE.KSDS.* -
            NEWNAME(EXAMPLE.TEST.*)
/*
//************************** FIM DE JCL     ****************************

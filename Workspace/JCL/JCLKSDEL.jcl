//KC02746C  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* DELETA ARQUIVOS JIT                                              *
//*------------------------------------------------------------------*
//DELETE     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//INPUT      DD   DSN=KC02746.VSAM0126.KSDSFILE.V1504,DISP=SHR
//SYSIN      DD   *
   DELETE FILE (INPUT) -
   PURGE               -
   CLUSTER
/*
//*------------------------------------------------------------------*
//* DELETA ARQUIVOS JIT                                              *
//*------------------------------------------------------------------*
//DELETE2    EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   DELETE (KC02746.VSAM0126.KSDSFILE.V1504)
/*
//
//************************** FIM DE JCL     ****************************

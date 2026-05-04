//KC02746C  JOB ('00'),TSO.&SYSUID,                                     JOB00485
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* DELETA ARQUIVOS JIT                                              *
//*------------------------------------------------------------------*
//DELETE01   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//INPUT      DD   DSN=KC02746.VSAM324.KSDSFILE,DISP=SHR
//SYSIN      DD   *
   DELETE (KC02746.VSAM324.KSDSFILE) -
   CLUSTER
/*
//*------------------------------------------------------------------*
//* DELETA ARQUIVOS JIT                                              *
//*------------------------------------------------------------------*
//DELETE02   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//INPUT      DD   DSN=KC02746.VSAM324.KSDSFILE,DISP=SHR
//SYSIN      DD   *
   DELETE FILE(INPUT)
/*
//************************** FIM DE JCL     ****************************

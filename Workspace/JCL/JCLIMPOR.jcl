//CATIMPOR  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* IMPORTANDO REGISTROS DE OUTRO ARQUIVO VSAM                       *
//*------------------------------------------------------------------*
//IMPORT     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//BACKUP     DD   DSN=KC02747.QSAM.VSAM511.TESTE,
//          DISP=(OLD,KEEP)
//SYSIN      DD   *
  IMPORT INFILE(BACKUP)             -
  OUTDATASET(KC02747.VSAM511.KSDSFILE) -
  PURGE
/*
//

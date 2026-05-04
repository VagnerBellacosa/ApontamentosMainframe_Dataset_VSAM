//CATIMPOR  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* FAZER BACKUP VSAM VIA EXPORT                                     *
//*------------------------------------------------------------------*
//IMPORT     EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//BACKUP     DD   DSN=KC02747.QSAM.VSAM511.TESTE,
//       DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,
//       SPACE=(CYL,(4,4),RLSE),
//       DCB=(RECFM=FB,LRECL=80,BLKSIZE=0)
//SYSIN      DD   *
  EXPORT KC02747.VSAM511.KSDSFILE  -
  OUTFILE(BACKUP) -
  TEMPORARY
/*
//**********************************************************************

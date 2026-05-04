//CATREPRO  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* RECUPERA ARQUIVO BACKUP                                          *
//*------------------------------------------------------------------*
//RECOVERY   EXEC PGM=IDCAMS
//* ARQUIVOS DE BACKUPS
//SMFINRSV   DD DSN=SMF.RECORDS.SYSA,DISP=SHR,DCB=BUFNO=60
//           DD DSN=SMF.RECORDS.SYSB,DISP=SHR
//* ARQUIVOS DE RECUPERACAO
//SMFOUT     DD DSN=KC02746.VSAM511.KSDSFILE,
//       DISP=(NEW,CATLG),
//       SPACE=(CYL,(10,1),RLSE),
//       DCB=BUFNO=60,STORCLAS=S1P03S01
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//CRUPRINT   DD   SYSOUT=A
//SYSLOG     DD   SYSOUT=A
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  RECOVER **
    STARTDATE(10/04/21) -
    STARTTIME(00:00:01) -
    STOPDATE(10/04/21) -
    STOPTIME(23:59:59) -
    GAPTIME(30) -
    CLKDIF(0)
/*
//*------------------------------------------------------------------*
//*  SE OK LISTA                                                     *
//*------------------------------------------------------------------*
//LISTCAT    EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   IF LASTCC = 0 THEN -
     LISTCAT ALL LEVEL(KC02746.VSAM511.KSDSFILE)
/*
//************************** FIM DO JCL     ****************************

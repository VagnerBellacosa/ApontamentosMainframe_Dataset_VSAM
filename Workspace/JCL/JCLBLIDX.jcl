//CATBLDIX  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* CRIAR UM INDICE ALTERNATIVO NUM ARQUIVO VSAM KSDS               -*
//* NAO CLASSIFICANDO A CHAVE ALTERNATIVA                           -*
//*------------------------------------------------------------------*
//BLDINDX1   EXEC PGM=IDCAMS
//BASEDD     DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR
//AIXDD      DD
//IDCUT1     DD   DSNAME=SORT.WORK.ONE,DISP=OLD,AMP='AMORG',
//     VOL=SER=VSER01,UNIT=DISK
//IDCUT2     DD   DSNAME=SORT.WORK.TWO,DISP=OLD,AMP='AMORG',
//     VOL=SER=VSER01,UNIT=DISK
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD *
  BLDINDEX INFILE(BASEDD) -
           OUTFILE(AIXDD) -
           NOSORTCALL -
           CATALOG(USERCAT)
/*
//*------------------------------------------------------------------*
//* CRIAR UM INDICE ALTERNATIVO NUM ARQUIVO VSAM KSDS               -*
//* CLASSIFICANDO A CHAVE ALTERNATIVA                               -*
//*------------------------------------------------------------------*
//BLDINDX1   EXEC PGM=IDCAMS
//BASEDD     DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR
//AIXDD      DD
//IDCUT1     DD   DSNAME=SORT.WORK.ONE,DISP=OLD,AMP='AMORG',
//     VOL=SER=VSER01,UNIT=DISK
//IDCUT2     DD   DSNAME=SORT.WORK.TWO,DISP=OLD,AMP='AMORG',
//     VOL=SER=VSER01,UNIT=DISK
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD *
  BLDINDEX INFILE(BASEDD)        -
           OUTFILE(AIXDD)        -
           SORTCALL              -
           SORTMESSAGELEVEL(ALL)
/*
//************************** FIM DO JCL     **************************

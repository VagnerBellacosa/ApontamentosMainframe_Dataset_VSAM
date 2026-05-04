//CATLISTC  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* LISTA TODOS OS CONJUNTO DE DADOS GERENCIADOS POR SMS            -*
//*------------------------------------------------------------------*
//LISTCT01   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  LISTCAT ENTRIES(KC02746.VSAM.KSDSFILE)      -
  ALL
/*
//*------------------------------------------------------------------*
//* LISTA CLUSTER SEQUENCIADO E CHAVES                              -*
//*------------------------------------------------------------------*
//LISTCT02   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  LISTCAT ENTRIES(KC02746.VSAM.KSDSFILE)      -
  CLUSTER                                     -
  HISTORY
/*
//*----------------------------------------------------------------*
//* LISTA CLUSTER SEQUENCIADO E CHAVES                              -*
//*------------------------------------------------------------------*
//LISTCT03   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  LISTCAT ENTRIES(KC02746.VSAM.KSDSFILE)      -
  CLUSTER                                     -
  ALL
/*
//*----------------------------------------------------------------*
//* LISTA CLUSTER DADOS E HISTRICO                                  -*
//*------------------------------------------------------------------*
//LISTCT04   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  LISTCAT ENTRIES(KC02746.VSAM.KSDSFILE)      -
  DATA                                        -
  HISTORY
/*
//************************** FIM DO JCL     ****************************

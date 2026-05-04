//CATEXAMI  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXAMINAR KSDS DATASET                                           -*
//* VERIFICA O INDICE E O ARQUIVO DE DADOS                          -*
//*------------------------------------------------------------------*
//EXAMIN01   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD *
 EXAMINE NAME (KC02746.VSAM.KSDSEMPR)    -
 INDEXTEST DATATEST                      -
 ERRORLIMIT(50)
/*
//*------------------------------------------------------------------*
//* EXAMINAR KSDS DATASET                                           -*
//* VERIFICA APENAS OS DADOS                                        -*
//*------------------------------------------------------------------*
//EXAMIN02   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD *
 EXAMINE NAME (KC02746.VSAM.KSDSEMPR)     -
 DATATEST NOINDEXTEST                     -
 ERRORLIMIT(50)
/*
//*------------------------------------------------------------------*
//* EXAMINAR KSDS DATASET                                           -*
//* VERIFICA APENAS O INDICE                                        -*
//*------------------------------------------------------------------*
//EXAMIN03   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD *
 EXAMINE NAME (KC02746.VSAM.KSDSEMPR)    -
 INDEXTEST NODATATEST                    -
 ERRORLIMIT(50)
/*
//************************** FIM DO JCL     ****************************

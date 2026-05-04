//CATCKSDS  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*--- CRIAR ARQUIVO VSAM KSDS                                      -*
//*--- INDEXED = KSDS                                               -*
//*------------------------------------------------------------------*
//VSAM01     EXEC PGM=IDCAMS
//*------------------------------------------------------------------*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
//* DEFINE KSDS CLUSTER */
 DEFINE CLUSTER ( -
   NAME(KC02746.VSAM.KSDTEST.T202506)       -
   INDEXED                                  -
   RECORDSIZE(80 80)                        -
   TRACKS(5,5)                              -
   KEYS(11 0)                               -
   CISZ(4096)                               -
   REUSE -
   FREESPACE ((3 3) )
 DATA ( -
   NAME(KC02746.VSAM.KSDTEST.T202506.DATA) -
 INDEX ( -
   NAME(KC02746.VSAM.KSDTEST.T202506.INDEX)
/*
//************************** FIM DO JCL     ****************************

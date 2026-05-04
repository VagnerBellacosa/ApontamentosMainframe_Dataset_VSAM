//KC02746C  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//VSAM01     EXEC PGM=IDCAMS
//*------------------------------------------------------------------*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
//* DELETA ARQUIVOS JIT */
 DELETE KC02746.VSAM.KSDSFILE.T202402 -
   PURGE               -
   CLUSTER
//*  SE OK LISTA                                                    */
 IF LASTCC = 0 THEN -
 LISTCAT ALL LEVEL(KC02746.VSAM.KSDSFILE.T202401)
/*
//************************** FIM DO JCL     ****************************

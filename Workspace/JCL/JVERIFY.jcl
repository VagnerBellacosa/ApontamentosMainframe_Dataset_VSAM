//CATVERIF  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* VERIFICA ARQUIVO VSAM                                            *
//*------------------------------------------------------------------*
//VERIFY01   EXEC PGM=IDCAMS,REGION=4096K
//SYSPRINT   DD    SYSOUT=*                                             *VRS014*
//SYSTERM    DD    SYSOUT=*                                             *VRS014*
//SYSOUT     DD    *                                                    *VRS014*
//SYSIN      DD *
 VERIFY DATASET(KC02746.VSAM.KSDSEMPR)
/*
//*------------------------------------------------------------------*
//* VERIFICA E CORRIGE ERROS NO ARQUIVO VSAM - CLUSTER               *
//*------------------------------------------------------------------*
//VERIFY02   EXEC PGM=IDCAMS,REGION=4096K
//SYSPRINT   DD    SYSOUT=*                                             *VRS014*
//SYSTERM    DD    SYSOUT=*                                             *VRS014*
//SYSOUT     DD    *                                                    *VRS014*
//SYSIN      DD *
 VERIFY DATASET(KC02746.VSAM.KSDSEMPR) -
 RECOVER
/*
//************************** FIM DA JCL     ****************************

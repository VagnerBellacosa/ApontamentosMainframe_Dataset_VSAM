//CAVSAM4   JOB ('00'),TSO.&SYSUID,                                     JOB07864
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO ATUALIZACAO DE REGISTRO VIA PARM          ---------------*
//*------------------------------------------------------------------*
//JOBLIB   DD DSN=KC02746.LIB.CBLPDSE,DISP=SHR
//*------------------------------------------------------------------*
//STEP01  EXEC PGM=CBVSAM01,PARM=00000000001
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//EMPFILE  DD DSN=KC02747.VSAM511.KSDSFILE,
//           DISP=SHR
//*
//*------------------------* FIM DO JCL     *------------------------*

//CAVSAM7   JOB ('00'),TSO.&SYSUID,                                     JOB07864
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO LISTAR TODOS OS REGISTROS MODO SEQUENCIOAL --------------*
//*------------------------------------------------------------------*
//JOBLIB   DD DSN=KC02746.LIB.CBLPDSE,DISP=SHR
//*------------------------------------------------------------------*
//STEP01  EXEC PGM=CBVSAM07
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//EMPFILE  DD DSN=KC02747.VSAM511.KSDSFILE,
//           DISP=SHR
//*
//*------------------------* FIM DO JCL     *------------------------*

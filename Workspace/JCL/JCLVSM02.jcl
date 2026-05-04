//CAVSAM2   JOB ('00'),TSO.&SYSUID,                                     JOB07864
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO DE START E READ NEXT VSAM                 ---------------*
//*------------------------------------------------------------------*
//JOBLIB  DD DSN=KC02746.LIB.CBLPDSE,DISP=SHR
//STEP01  EXEC PGM=CBVSAM06
//SYSOUT  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//EMPFILE DD DSN=KC02746.VSAM.DADOS.KSDS,DISP=SHR
//*
//*------------------------* FIM DO JCL     *------------------------*

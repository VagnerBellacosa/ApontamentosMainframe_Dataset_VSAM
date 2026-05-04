//CAVSAM8   JOB ('00'),TSO.&SYSUID,                                     JOB07864
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO RECEBE SYSIN 1 UNICO REGISTRO E GRAVA     ---------------*
//*------------------------------------------------------------------*
//JOBLIB   DD DSN=KC02746.LIB.CBLPDSE,DISP=SHR
//*------------------------------------------------------------------*
//STEP01  EXEC PGM=CBVSAM08
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//EMPFILE  DD DSN=KC02747.VSAM511.KSDSFILE,
//           DISP=SHR
//SYSIN    DD *
99999999999
MAXIMUS GLADIATOR
MESTRE DOS MAGOS
0000999999
/*
//*
//* EMP-ID        PIC X(11).
//* EMP-NAME      PIC X(15).
//* EMP-DESG      PIC X(10).
//* EMP-SALARY    PIC 9(10).
//*
//*
//*
//*
//*
//*
//*------------------------* FIM DO JCL     *------------------------*

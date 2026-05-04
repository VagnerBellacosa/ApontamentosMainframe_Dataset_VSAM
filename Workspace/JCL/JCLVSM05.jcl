//CAVSAM5   JOB ('00'),TSO.&SYSUID,                                     JOB07864
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO DE WRITE VSAM 1 LINHA POR VEZ ACCEPT/SYSIN---------------*
//*------------------------------------------------------------------*
//JOBLIB   DD DSN=KC02746.LIB.CBLPDSE,DISP=SHR
//*------------------------------------------------------------------*
//STEP01  EXEC PGM=CBVSAM05,PARM=0001
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//EMPFILE  DD DSN=KC02746.VSAM0126.KSDSFILE.V1504,
//           DISP=SHR
//SYSIN    DD *
89999999991
2027/06/11
2026/11/06
0000001990
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

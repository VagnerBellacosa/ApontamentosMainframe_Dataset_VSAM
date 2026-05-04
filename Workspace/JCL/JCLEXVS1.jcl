//CATPGM1   JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//JOBLIB  DD DSN=KC02746.LIB.CBLPDSE,DISP=SHR
//STEP01  EXEC PGM=CBVSAM01
//*    ARQUIVO DE ENTRADA                                          *\\
//INPUTFL  DD  DSN=KC02746.FB80.TESTE,DISP=SHR
//SYSTSPRT DD  SYSOUT=*
//SYSPRINT DD  SYSOUT=*
//CEEDUMP  DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//REPORT   DD  SYSOUT=*
//*------------------------* FIM JCL        *------------------------*

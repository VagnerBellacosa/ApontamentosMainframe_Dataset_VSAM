//JVSAM020  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- DEFINE PATH DO ARQUIVO                     ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
    DEFINE PATH                          -
       NAME(MY.VSAM.KSDSAIX.PATH)    -
       PATHENTRY(MY.VSAM.KSDSAIX))
/*
//************************** FIM DE JCL     ****************************

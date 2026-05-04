//JVSAM019  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- VERIFICA E CORRIGE ERROS VSAM              ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
    VERIFY DS(MY.VSAM.KSDSFILE)
/*
//************************** FIM DE JCL     ****************************

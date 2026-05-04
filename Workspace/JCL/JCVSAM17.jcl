//JVSAM017  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- LISTAR  CLUSTER LDS IDCAMS                 ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
      LISTCAT ENTRY(MY.VSAM.KSDSFILE)
      ALL
/*
//************************** FIM DE JCL     ****************************

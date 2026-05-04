//JVSAM012  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- DELETAR CLUSTER VIA IDCAMS                 ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
   DELETE MY.VSAM.RRDSFILE CLUSTER
/*
//************************** FIM DE JCL     ****************************

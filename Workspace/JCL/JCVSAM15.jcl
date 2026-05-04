//JVSAM015  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- ALTERAR CLUSTER LDS IDCAMS                 ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
   ALTER  MY.VSAM.KSDSFILE
   [ADDVOLUMES(2)]
   [FREESPACE(6 6)]
   [KEYS(10 2)]
/*
//************************** FIM DE JCL     ****************************

//EXEMP09   JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A,TIME=(0,20),PRTY=9,
//          LINES=1M
//*------------------------------------------------------------------*
//* JCL PARA EXCLUIR UMA BASE GDG
//*------------------------------------------------------------------*
//STEP001 EXEC PGM=IDCAMS
//*
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  DELETE (KC02746.SAMMF.BASE1) -
          GDD -
          FORCE
/*
//*
//*------------------------* FIM DO JCL     *------------------------*

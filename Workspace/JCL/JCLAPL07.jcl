//EXEMP07   JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A,TIME=(0,20),PRTY=9,
//          LINES=1M
//*------------------------------------------------------------------*
//* JCL PARA EXCLUIR UM MEMBRO DO CONJUNTO DE DADOS PDS
//*------------------------------------------------------------------*
//STEP001 EXEC PGM=IDCAMS
//*
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
  DEFINE GDG(NAME(KC02746.IBMMF.BASE1) -
             LIMIT(10) -
             NOTEMPTY -
             SCRATCH
/*
//*
//*------------------------* FIM DO JCL     *------------------------*

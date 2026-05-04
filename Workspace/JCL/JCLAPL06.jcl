//EXEMP06   JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A,TIME=(0,20),PRTY=9,
//          LINES=1M
//*------------------------------------------------------------------*
//* JCL PARA EXCLUIR UM MEMBRO DO CONJUNTO DE DADOS PDS
//*------------------------------------------------------------------*
//STEP001  EXEC PGM=IKJEFT01,REGION=2M
//*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
  DELETE 'KC02746.IBMMF.PDS(MEMBER1)'
//SYSOUT   DD   *
//*
//*------------------------------------------------------------------*
//STEP002  EXEC PGM=IDCAMS
//*
//DD1      DD DSN=K02745.IBMMF.PDS,
//            DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  DELETE FILE 'KC02746.IBMMF.PDS(MEMBER1)' (DD1)
/*
//*
//*------------------------* FIM DO JCL     *------------------------*

//CATSORT1  JOB ('00'),TSO.&SYSUID,                                     JOB01209
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* CLASSIFICA ARQUIVO QSAM NA MESMA ORDEM QUE O INDICE DO ARQUIVO   *
//* VSAM KSDS -                                                      *
//*------------------------------------------------------------------*
//SORT001  EXEC PGM=SORT
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//* ARQUIVO DE ENTRADA                                               *
//SORTIN   DD DSN=KC02746.ARQUIVAO.TXT,DISP=SHR ---> INPUT FILE
//* ARQUIVO DE SAIDA                                                 *
//SORTOUT  DD DSN=KC02747.SORT.KSDSREPRO,        ---> OUTPUT FILE
//       DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,
//       SPACE=(CYL,(4,4),RLSE),
//       DCB=(RECFM=FB,LRECL=80,BLKSIZE=0)
//SYSIN    DD *
  SORT FIELDS=(1,11,CH,A)                          ---> SORT STATEMENTS
/*
//************************** FIM DO JCL     ****************************

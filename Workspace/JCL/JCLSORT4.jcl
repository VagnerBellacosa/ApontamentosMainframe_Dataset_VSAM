//KC02746S  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* CLASSIFICA ARQUIVO QSAM NA MESMA ORDEM QUE O INDICE DO ARQUIVO   *
//* VSAM KSDS -                                                      *
//*------------------------------------------------------------------*
//JSTEP010 EXEC PGM=SORT
//SORTIN   DD *
  DATA1
  DATA2
  DATA3
/*
//SORTOUT  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSIN    DD *
 SORT FIELDS=COPY
  OUTFIL REMOVECC,
  HEADER1=(1:C'HDR',10:X'020110131C'),
  TRAILER1=(1:C'TRL',TOT=(10,9,PD,TO=PD,LENGTH=9))
/*
//************************** FIM DE JCL     ****************************

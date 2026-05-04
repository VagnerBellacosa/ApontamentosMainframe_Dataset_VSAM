//KC02746S  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* CLASSIFICA ARQUIVO QSAM NA MESMA ORDEM QUE O INDICE DO ARQUIVO   *
//* VSAM KSDS -                                                      *
//*------------------------------------------------------------------*
//SORT01    EXEC PGM=SORT
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//* ARQUIVO DE ENTRADA                                               *
//SORTIN    DD DSN=KC02746.SORT.INPUT.FILE,DISP=SHR ---> INPUT FILE
//* ARQUIVO DE SAIDA                                                 *
//OUT1      DD DSN=USERID.SORT.OUTPUT.FILE,         ---> OUTPUT FILE
//       DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,
//       SPACE=(CYL,(4,4),RLSE),
//       DCB=(RECFM=FB,LRECL=80,BLKSIZE=0)
//SYSIN     DD *
  SORT FIELDS=(1,5,CH,A)                            ---> SORT STATEMENTS
/*
//ICETOOL  EXEC PGM=ICETOOL
//TOOLMSG    DD SYSOUT=*
//DFSMSG     DD SYSOUT=*
//SYSPRINT   DD SYSOUT=*
//SYSTERM    DD SYSOUT=*                                                *VRS014*
//SYSOUT     DD *                                                       *VRS014*
//IN1        DD DSN=KC02746.SORT.INPUT.FILE.DISP=SHR
//OUT1       DD DSN=USERID.SORT.OUTPUT.FILE,         ---> OUTPUT FILE
//       DISP=(OLD,CATLG,DELETE),UNIT=SYSDA,
//       SPACE=(CYL,(4,4),RLSE),
//       DCB=(RECFM=FB,LRECL=80,BLKSIZE=0)
//TOOLIN     DD *
  COPY FROM(IN1) TO(OUT1) USING(CTL1)
/*
//CTL1CNTL   DD *
  OPTION STOPAFT=10
/*
//************************** FIM DE JCL     ****************************

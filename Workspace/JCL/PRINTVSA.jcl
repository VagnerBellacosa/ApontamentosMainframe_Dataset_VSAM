//CATPRINT  JOB    ('00'),TSO.&SYSUID,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*
//*------------------------------------------------------------------*
//PRINT01  EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//INPUT2   DD DISP=SHR,DSN=SMS.SCDS1.SCDS
//SYSIN    DD *
  PRINT INFILE(INPUT2)
//*
//*------------------------------------------------------------------*
//*
//*------------------------------------------------------------------*
//PRINT02  EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//INPUT2   DD DISP=SHR,DSN=SMS.ACDS1.ACDS
//SYSIN    DD *
  PRINT INFILE(INPUT2)
//*
//*------------------------------------------------------------------*
//*
//*------------------------------------------------------------------*
//PRINT03  EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//INPUT2   DD DISP=SHR,DSN=SMS.COMMDS1.COMMDS
//SYSIN    DD *
  PRINT INFILE(INPUT2)
//*
//************************** FIM DE JCL     ****************************

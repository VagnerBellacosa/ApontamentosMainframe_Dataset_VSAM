//REPRO00   JOB    ('J906NPD301210'),TSO.&SYSUID,
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//VSAM01   EXEC PGM=IDCAMS
//IN       DD DSN=KC02746.LIB.VSAM01,DISP=SHR
//OUT      DD DSN=KC02746.LIB.VSAM02,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  REPRO INFILE(IN) OUTFILE(OUT)
/*
//************************** FIM DE JCL     ****************************

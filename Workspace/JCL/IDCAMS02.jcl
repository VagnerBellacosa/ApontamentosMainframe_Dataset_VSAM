//J906#REP  JOB    ('J906NPD301210'),TSO.&SYSUID,
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//VSAM01   EXEC PGM=IDCAMS
//IN       DD DSN=USER.INEFE00.COBOL(ALUNOS),DISP=SHR
//OUT      DD DSN=USER.INEFE00.COBOL.VSAM1,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  REPRO INFILE(IN) OUTFILE(OUT)
/*
//************************** FIM DE JCL     ****************************

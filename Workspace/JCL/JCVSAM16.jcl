//JVSAM014  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- COPIAR DADOS VSAM VIA IDCAMS REPRO         ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
      REPRO INFILE(IN)
         OUTFILE(OUT)
/*
//************************** FIM DE JCL     ****************************

//JVSAM013  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- CRIAR CLUSTER LDS IDCAMS                   ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
   DEFINE CLUSTER (NAME(MY.VSAM.LDSFILE)   -
   LINEAR                                  -
   TRACKS(1,1)                             -
   CISZ(4096) )                            -
   DATA (NAME(MY.VSAM.LDSFILE.DATA))
/*
//************************** FIM DE JCL     ****************************

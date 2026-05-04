//JVSAM011  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- CRIAR CLUSTER RRDS IDCAMS                  ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
   DEFINE CLUSTER (NAME(MY.VSAM.RRDSFILE)  -
   NUMBERED                                -
   RECSZ(80 80)                            -
   TRACKS(1,1)                             -
   REUSE                                   -
   FREESPACE(3 3) )                        -
   DATA (NAME(MY.VSAM.RRDSFILE.DATA))
/*
//************************** FIM DE JCL     ****************************

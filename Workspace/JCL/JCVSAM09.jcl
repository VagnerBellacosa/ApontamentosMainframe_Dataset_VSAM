//JVSAM009  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- CRIAR CLUSTER KSDS IDCAMS                  ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
   DEFINE CLUSTER (NAME(MY.VSAM.KSDSFILE)  -
   INDEXED                                 -
   KEYS(6 1)                                -
   RECSZ(80 80)                            -
   TRACKS(1,1)                             -
   CISZ(4096)                              -
   FREESPACE(3 3) )                        -
   DATA (NAME(MY.VSAM.KSDSFILE.DATA))      -
   INDEX (NAME(MY.VSAM.KSDSFILE.INDEX))    -
/*
//************************** FIM DE JCL     ****************************
